import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:widgets_in_flutter/controllers/search.controller.dart';
import 'package:widgets_in_flutter/favorites/favorite.button.dart';
import 'package:widgets_in_flutter/favorites/favorites.controller.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _selectedCategory = 'All';
  bool _showFavoritesOnly = false;
  String _sortBy = 'Name'; // Name, Category, Favorites
  final TextEditingController _searchController = TextEditingController();

  final List<String> _categories = [
    'All',
    'actions',
    'inputs',
    'navigation',
    'text',
    'images',
    'layout',
    'lists',
    'animations',
    'forms',
    'material',
    'gestures',
    'scrolling',
    'media',
    'platform',
    'sensors',
    'accessibility',
    'performance',
    'advanced_animations',
    'paint',
    'state',
    'cupertino',
    'slivers',
    'dialogs_overlays',
    'effects_filters',
    'testing_debug',
    'charts_data',
    'internationalization',
    'security_auth',
  ];

  @override
  Widget build(BuildContext context) {
    final GetSearchController searchController = Get.put(GetSearchController());
    final FavoritesController favoritesController =
        Get.put(FavoritesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Search'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search widgets...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              searchController.search('');
                              setState(() {});
                            },
                          )
                        : null,
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    searchController.search(value);
                    setState(() {});
                  },
                ),
              ),
              // Filters Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    // Category Filter
                    Expanded(
                      child: DropdownButton<String>(
                        value: _selectedCategory,
                        isExpanded: true,
                        items: _categories.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category == 'All'
                                ? 'All Categories'
                                : category),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Favorites Toggle
                    FilterChip(
                      label: const Text('Favorites Only'),
                      selected: _showFavoritesOnly,
                      onSelected: (selected) {
                        setState(() {
                          _showFavoritesOnly = selected;
                        });
                      },
                      avatar: Icon(
                        _showFavoritesOnly
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      body: Obx(() {
        var widgets = searchController.filteredWidgets.toList();

        // Apply category filter
        if (_selectedCategory != 'All') {
          widgets = widgets
              .where((widget) => widget['category'] == _selectedCategory)
              .toList();
        }

        // Apply favorites filter
        if (_showFavoritesOnly) {
          widgets = widgets
              .where((widget) => favoritesController.isFavorite(widget['name']))
              .toList();
        }

        // Sort widgets
        switch (_sortBy) {
          case 'Name':
            widgets.sort((a, b) => a['name'].compareTo(b['name']));
            break;
          case 'Category':
            widgets.sort((a, b) => a['category'].compareTo(b['category']));
            break;
          case 'Favorites':
            widgets.sort((a, b) {
              bool aFav = favoritesController.isFavorite(a['name']);
              bool bFav = favoritesController.isFavorite(b['name']);
              if (aFav && !bFav) return -1;
              if (!aFav && bFav) return 1;
              return a['name'].compareTo(b['name']);
            });
            break;
        }

        if (searchController.searchQuery.value.isEmpty &&
            _selectedCategory == 'All' &&
            !_showFavoritesOnly) {
          return _buildEmptySearchState(context);
        }

        if (widgets.isEmpty) {
          return _buildNoResultsState(context);
        }

        return Column(
          children: [
            // Sort and Results Info
            Container(
              padding: const EdgeInsets.all(16),
              color:
                  Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
              child: Row(
                children: [
                  Text(
                    '${widgets.length} widget${widgets.length != 1 ? 's' : ''} found',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    value: _sortBy,
                    items: ['Name', 'Category', 'Favorites'].map((sort) {
                      return DropdownMenuItem(
                        value: sort,
                        child: Text('Sort by $sort'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _sortBy = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            // Results List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: widgets.length,
                itemBuilder: (context, index) {
                  final widget = widgets[index];
                  return FadeInUp(
                    delay: Duration(milliseconds: index * 50),
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              _getCategoryColor(widget['category']),
                          child: Text(
                            widget['name'][0].toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          widget['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Category: ${_formatCategoryName(widget['category'])}',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.7),
                              ),
                            ),
                            if (favoritesController.isFavorite(widget['name']))
                              Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: 16,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Favorite',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FavoriteButton(
                              widgetName: widget['name'],
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        onTap: () {
                          Get.toNamed(widget['route']);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }

  Widget _buildEmptySearchState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeIn(
            child: Icon(
              Icons.search,
              size: 80,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 16),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              'Advanced Widget Search',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: Text(
              'Search through 200+ Flutter widgets',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
            ),
          ),
          const SizedBox(height: 32),
          FadeInUp(
            delay: const Duration(milliseconds: 600),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildSuggestionChip('Button'),
                _buildSuggestionChip('Text'),
                _buildSuggestionChip('Animation'),
                _buildSuggestionChip('List'),
                _buildSuggestionChip('Card'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoResultsState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeIn(
            child: Icon(
              Icons.search_off,
              size: 80,
              color: Theme.of(context).colorScheme.error.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 16),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              'No widgets found',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: Text(
              'Try adjusting your search or filters',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
            ),
          ),
          const SizedBox(height: 32),
          FadeInUp(
            delay: const Duration(milliseconds: 600),
            child: ElevatedButton(
              onPressed: () {
                _searchController.clear();
                Get.find<GetSearchController>().search('');
                setState(() {
                  _selectedCategory = 'All';
                  _showFavoritesOnly = false;
                });
              },
              child: const Text('Clear all filters'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionChip(String text) {
    return ActionChip(
      label: Text(text),
      onPressed: () {
        _searchController.text = text;
        Get.find<GetSearchController>().search(text);
        setState(() {});
      },
    );
  }

  Color _getCategoryColor(String category) {
    final colors = {
      'actions': Colors.blue,
      'inputs': Colors.green,
      'navigation': Colors.purple,
      'text': Colors.orange,
      'images': Colors.red,
      'layout': Colors.teal,
      'lists': Colors.indigo,
      'animations': Colors.pink,
      'forms': Colors.cyan,
      'material': Colors.deepOrange,
      'gestures': Colors.lime,
      'scrolling': Colors.amber,
      'media': Colors.brown,
      'platform': Colors.grey,
      'sensors': Colors.lightBlue,
      'accessibility': Colors.lightGreen,
      'performance': Colors.deepPurple,
      'advanced_animations': Colors.pinkAccent,
      'paint': Colors.yellowAccent,
      'state': Colors.blueGrey,
      'cupertino': Colors.black,
      'slivers': Colors.deepPurple,
      'dialogs_overlays': Colors.cyan,
      'effects_filters': Colors.pink,
      'testing_debug': Colors.red,
      'charts_data': Colors.lightBlue,
      'internationalization': Colors.lightGreen,
      'security_auth': Colors.amber,
    };
    return colors[category] ?? Colors.grey;
  }

  String _formatCategoryName(String category) {
    return category
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
