import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:widgets_in_flutter/favorites/favorites.controller.dart';
import 'package:widgets_in_flutter/controllers/search.controller.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  String _sortBy = 'Recently Added';

  final List<String> _sortOptions = [
    'Recently Added',
    'Alphabetical',
    'Category',
  ];

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController =
        Get.find<FavoritesController>();
    final GetSearchController searchController = Get.put(GetSearchController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Widgets ✨'),
        actions: [
          Obx(() => favoritesController.favorites.isNotEmpty
              ? PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (value) {
                    if (value == 'clear') {
                      _showClearConfirmation(context, favoritesController);
                    } else if (value == 'sort') {
                      _showSortOptions(context);
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'sort',
                      child: ListTile(
                        leading: Icon(Icons.sort),
                        title: Text('Sort'),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'clear',
                      child: ListTile(
                        leading: Icon(Icons.clear_all),
                        title: Text('Clear All'),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink()),
        ],
      ),
      body: Obx(() {
        if (favoritesController.favorites.isEmpty) {
          return _buildEmptyState(context);
        }

        // Get widget details for favorites
        List<Map<String, dynamic>> favoriteWidgets = [];
        for (FavoriteWidget favoriteWidget in favoritesController.favorites) {
          var widgetInfo = searchController.allWidgets.firstWhereOrNull(
            (widget) => widget['name'] == favoriteWidget.name,
          );
          if (widgetInfo != null) {
            favoriteWidgets.add(widgetInfo);
          }
        }

        // Sort favorites
        _sortFavorites(favoriteWidgets);

        return Column(
          children: [
            // Stats and Filter Bar
            Container(
              padding: const EdgeInsets.all(16),
              color:
                  Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${favoriteWidgets.length} Favorite Widget${favoriteWidgets.length != 1 ? 's' : ''}',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          _getStatsText(favoriteWidgets),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.7),
                                  ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.sort),
                    onSelected: (value) {
                      setState(() {
                        _sortBy = value;
                      });
                    },
                    itemBuilder: (context) => _sortOptions.map((option) {
                      return PopupMenuItem(
                        value: option,
                        child: Row(
                          children: [
                            if (_sortBy == option)
                              const Icon(Icons.check, size: 16)
                            else
                              const SizedBox(width: 16),
                            const SizedBox(width: 8),
                            Text(option),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            // Favorites List
            Expanded(
              child: _buildFavoritesListWithData(context, favoriteWidgets),
            ),
          ],
        );
      }),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }

  void _sortFavorites(List<Map<String, dynamic>> widgets) {
    switch (_sortBy) {
      case 'Alphabetical':
        widgets.sort((a, b) => a['name'].compareTo(b['name']));
        break;
      case 'Category':
        widgets.sort((a, b) => a['category'].compareTo(b['category']));
        break;
      case 'Recently Added':
      default:
        // Keep original order (recently added first)
        break;
    }
  }

  String _getStatsText(List<Map<String, dynamic>> widgets) {
    if (widgets.isEmpty) return '';

    Map<String, int> categoryCounts = {};
    for (var widget in widgets) {
      String category = widget['category'];
      categoryCounts[category] = (categoryCounts[category] ?? 0) + 1;
    }

    var topCategory =
        categoryCounts.entries.reduce((a, b) => a.value > b.value ? a : b);

    return 'Most favorited: ${_formatCategoryName(topCategory.key)} (${topCategory.value})';
  }

  String _formatCategoryName(String category) {
    return category
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sort Favorites',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ..._sortOptions.map((option) => ListTile(
                  title: Text(option),
                  leading: Radio<String>(
                    value: option,
                    groupValue: _sortBy,
                    onChanged: (value) {
                      setState(() {
                        _sortBy = value!;
                      });
                      Navigator.pop(context);
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesListWithData(
      BuildContext context, List<Map<String, dynamic>> widgets) {
    return FadeIn(
      duration: const Duration(milliseconds: 300),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          final widget = widgets[index];

          return FadeInUp(
            delay: Duration(milliseconds: index * 100),
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 2,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: _getCategoryColor(widget['category']),
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      'Category: ${_formatCategoryName(widget['category'])}',
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 16,
                          color: Colors.red.withOpacity(0.7),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Favorited',
                          style: TextStyle(
                            color: Colors.red.withOpacity(0.7),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Get.find<FavoritesController>().toggleFavorite(
                            widget['name'],
                            widget['category'] ?? 'general',
                            widget['route'] ?? '/unknown');
                        Get.snackbar(
                          'Removed from Favorites',
                          '${widget['name']} removed from favorites',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor:
                              Theme.of(context).colorScheme.errorContainer,
                          colorText:
                              Theme.of(context).colorScheme.onErrorContainer,
                          duration: const Duration(seconds: 2),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
                onTap: () => _navigateToWidget(widget['route'] ?? '/unknown'),
              ),
            ),
          );
        },
      ),
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

  Widget _buildEmptyState(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 600),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 100,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
            const SizedBox(height: 24),
            Text(
              'No favorites yet! 💔',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Tap the heart icon on any widget to add it to your collection',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.explore),
              label: const Text('Discover Widgets'),
              onPressed: () => Get.toNamed('/components'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesList(
      BuildContext context, FavoritesController controller) {
    return FadeIn(
      duration: const Duration(milliseconds: 300),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.favorites.length,
        itemBuilder: (context, index) {
          final FavoriteWidget favoriteWidget = controller.favorites[index];

          return FadeInUp(
            delay: Duration(milliseconds: index * 50),
            duration: const Duration(milliseconds: 300),
            from: 30,
            child: Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                title: Text(
                  favoriteWidget.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: Text('Category: ${favoriteWidget.category}'),
                leading: CircleAvatar(
                  backgroundColor: _getCategoryColor(favoriteWidget.category),
                  foregroundColor: Colors.white,
                  child: Text(favoriteWidget.name[0]),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  tooltip: 'Remove from favorites',
                  onPressed: () {
                    controller.toggleFavorite(favoriteWidget.name,
                        favoriteWidget.category, favoriteWidget.route);
                    Get.snackbar(
                      'Removed from Favorites',
                      '${favoriteWidget.name} removed from your favorites',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor:
                          Theme.of(context).colorScheme.errorContainer,
                      colorText: Theme.of(context).colorScheme.onErrorContainer,
                    );
                  },
                ),
                onTap: () => _navigateToWidget(favoriteWidget.route),
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToWidget(String route) {
    // Navigate directly using the route if provided
    if (route != '/unknown' && route.isNotEmpty) {
      Get.toNamed(route);
    } else {
      // Fallback to showing a generic message
      Get.snackbar(
        'Navigation',
        'Widget details not available',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
  }

  void _showClearConfirmation(
      BuildContext context, FavoritesController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear All Favorites?'),
          content: const Text(
              'This will remove all widgets from your favorites list. This action cannot be undone.'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FilledButton(
              child: const Text('Clear All'),
              onPressed: () {
                controller.clearAllFavorites();
                Navigator.of(context).pop();
                Get.snackbar(
                  'Favorites Cleared',
                  'All widgets have been removed from your favorites',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Theme.of(context).colorScheme.errorContainer,
                  colorText: Theme.of(context).colorScheme.onErrorContainer,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
