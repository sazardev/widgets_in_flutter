import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/controllers/search.controller.dart';
import 'package:widgets_in_flutter/favorites/favorites.controller.dart';
import 'package:widgets_in_flutter/favorites/favorite_button_new.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class AdvancedSearchScreen extends StatefulWidget {
  const AdvancedSearchScreen({super.key});

  @override
  State<AdvancedSearchScreen> createState() => _AdvancedSearchScreenState();
}

class _AdvancedSearchScreenState extends State<AdvancedSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final GetSearchController _searchControllerGet =
      Get.find<GetSearchController>();
  bool _showSuggestions = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Búsqueda Avanzada'),
        actions: [
          ThemeMaterial(isLandscape: false),
          ThemeBrightness(isLandscape: false),
          ThemeSelector(isLandscape: false),
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: () {
              _searchController.clear();
              _searchControllerGet.clearSearch();
              setState(() {
                _showSuggestions = false;
              });
            },
            tooltip: 'Limpiar búsqueda',
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de búsqueda principal
          _buildMainSearchBar(),

          // Historial y sugerencias
          if (_showSuggestions) _buildSuggestions(),

          // Filtros avanzados
          _buildAdvancedFilters(),

          // Resultados
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }

  Widget _buildMainSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Buscar widgets, categorías...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_searchController.text.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        _searchControllerGet.search('');
                        setState(() {
                          _showSuggestions = false;
                        });
                      },
                    ),
                  IconButton(
                    icon: const Icon(Icons.mic),
                    onPressed: () {
                      // TODO: Implementar búsqueda por voz
                      Get.snackbar(
                        '🎤 Búsqueda por Voz',
                        'Función en desarrollo',
                        duration: const Duration(seconds: 2),
                      );
                    },
                  ),
                ],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) {
              _searchControllerGet.search(value);
              setState(() {
                _showSuggestions = value.isNotEmpty;
              });
            },
            onTap: () {
              setState(() {
                _showSuggestions = true;
              });
            },
          ),

          const SizedBox(height: 12),

          // Búsquedas rápidas
          _buildQuickSearches(),
        ],
      ),
    );
  }

  Widget _buildQuickSearches() {
    return Obx(() {
      final popularSearches = _searchControllerGet.popularSearches;
      if (popularSearches.isEmpty) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Búsquedas Populares',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: popularSearches.map((search) {
              return ActionChip(
                label: Text(search),
                onPressed: () {
                  _searchController.text = search;
                  _searchControllerGet.search(search);
                  setState(() {
                    _showSuggestions = false;
                  });
                },
              );
            }).toList(),
          ),
        ],
      );
    });
  }

  Widget _buildSuggestions() {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Sugerencias de autocompletado
          Expanded(
            child: ListView(
              children: [
                if (_searchController.text.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sugerencias',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...(_searchControllerGet
                      .getSearchSuggestions(_searchController.text)
                      .map((widget) {
                    return ListTile(
                      dense: true,
                      leading: const Icon(Icons.widgets, size: 20),
                      title: Text(widget['name']),
                      subtitle: Text(widget['category']),
                      onTap: () {
                        _searchController.text = widget['name'];
                        _searchControllerGet.search(widget['name']);
                        setState(() {
                          _showSuggestions = false;
                        });
                      },
                    );
                  })),
                ],

                // Historial de búsqueda
                Obx(() {
                  final history = _searchControllerGet.searchHistory;
                  if (history.isEmpty) return const SizedBox.shrink();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Historial',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                _searchControllerGet.clearSearchHistory();
                              },
                              child: const Text('Limpiar'),
                            ),
                          ],
                        ),
                      ),
                      ...history.take(3).map((search) {
                        return ListTile(
                          dense: true,
                          leading: const Icon(Icons.history, size: 20),
                          title: Text(search),
                          onTap: () {
                            _searchController.text = search;
                            _searchControllerGet.search(search);
                            setState(() {
                              _showSuggestions = false;
                            });
                          },
                        );
                      }),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedFilters() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filtros Avanzados',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // Filtro por categoría
                Obx(() {
                  final categories =
                      _searchControllerGet.getAvailableCategories();
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: _searchControllerGet.selectedCategory.value,
                      hint: const Text('Categoría'),
                      underline: const SizedBox.shrink(),
                      items: categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(category == 'all' ? 'Todas' : category),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          _searchControllerGet.filterByCategory(value);
                        }
                      },
                    ),
                  );
                }),

                const SizedBox(width: 16),

                // Ordenamiento
                Obx(() => Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: _searchControllerGet.sortBy.value,
                        hint: const Text('Ordenar'),
                        underline: const SizedBox.shrink(),
                        items: const [
                          DropdownMenuItem(
                              value: 'name', child: Text('Nombre')),
                          DropdownMenuItem(
                              value: 'category', child: Text('Categoría')),
                          DropdownMenuItem(
                              value: 'popularity', child: Text('Popularidad')),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            _searchControllerGet.setSortBy(value);
                          }
                        },
                      ),
                    )),

                const SizedBox(width: 8),

                // Dirección de ordenamiento
                Obx(() => IconButton(
                      icon: Icon(
                        _searchControllerGet.sortAscending.value
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                      ),
                      onPressed: () {
                        _searchControllerGet
                            .setSortBy(_searchControllerGet.sortBy.value);
                      },
                    )),

                const SizedBox(width: 16),

                // Solo favoritos
                FilterChip(
                  label: const Text('Solo Favoritos'),
                  selected: false, // TODO: Implementar filtro de favoritos
                  onSelected: (selected) {
                    // TODO: Implementar lógica de filtro de favoritos
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return Obx(() {
      final results = _searchControllerGet.filteredWidgets;

      if (results.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off,
                size: 80,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 16),
              Text(
                'No se encontraron resultados',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Intenta cambiar los términos de búsqueda',
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: results.length,
        itemBuilder: (context, index) {
          final widget = results[index];
          return _buildResultCard(widget);
        },
      );
    });
  }

  Widget _buildResultCard(Map<String, dynamic> widget) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getCategoryColor(widget['category']),
          child: Text(
            widget['category'].substring(0, 1).toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          widget['name'],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('Categoría: ${widget['category']}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FavoriteIconButton(
              widgetName: widget['name'],
              category: widget['category'],
              route: widget['route'],
              iconSize: 20,
            ),
            IconButton(
              icon: const Icon(Icons.open_in_new),
              onPressed: () {
                Get.toNamed(widget['route']);
              },
              tooltip: 'Abrir widget',
            ),
          ],
        ),
        onTap: () {
          Get.toNamed(widget['route']);
        },
      ),
    );
  }

  Color _getCategoryColor(String category) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
      Colors.cyan,
      Colors.amber,
    ];

    final index = category.hashCode % colors.length;
    return colors[index.abs()];
  }
}
