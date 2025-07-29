import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteWidget {
  final String name;
  final String category;
  final String route;
  final DateTime dateAdded;
  final int usageCount;

  FavoriteWidget({
    required this.name,
    required this.category,
    required this.route,
    required this.dateAdded,
    this.usageCount = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'route': route,
      'dateAdded': dateAdded.toIso8601String(),
      'usageCount': usageCount,
    };
  }

  factory FavoriteWidget.fromJson(Map<String, dynamic> json) {
    return FavoriteWidget(
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      route: json['route'] ?? '',
      dateAdded: DateTime.tryParse(json['dateAdded'] ?? '') ?? DateTime.now(),
      usageCount: json['usageCount'] ?? 0,
    );
  }

  FavoriteWidget copyWith({
    String? name,
    String? category,
    String? route,
    DateTime? dateAdded,
    int? usageCount,
  }) {
    return FavoriteWidget(
      name: name ?? this.name,
      category: category ?? this.category,
      route: route ?? this.route,
      dateAdded: dateAdded ?? this.dateAdded,
      usageCount: usageCount ?? this.usageCount,
    );
  }
}

class FavoritesController extends GetxController {
  final RxList<FavoriteWidget> favorites = <FavoriteWidget>[].obs;
  final RxList<FavoriteWidget> filteredFavorites = <FavoriteWidget>[].obs;
  final RxString searchQuery = ''.obs;
  final RxString selectedCategory = 'all'.obs;
  final RxString sortBy =
      'dateAdded'.obs; // dateAdded, name, category, usageCount
  final RxBool sortAscending = false.obs;

  // Estadísticas
  final RxInt totalFavorites = 0.obs;
  final RxMap<String, int> favoritesByCategory = <String, int>{}.obs;
  final RxList<String> recentlyAdded = <String>[].obs;
  final RxList<String> mostUsed = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();

    // Escuchar cambios para actualizar filtros
    ever(searchQuery, (_) => _updateFilteredFavorites());
    ever(selectedCategory, (_) => _updateFilteredFavorites());
    ever(sortBy, (_) => _updateFilteredFavorites());
    ever(sortAscending, (_) => _updateFilteredFavorites());
    ever(favorites, (_) => _updateStats());
  }

  Future<void> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList('favorites_v2') ?? [];

      final loadedFavorites = favoritesJson
          .map((jsonStr) {
            try {
              final Map<String, dynamic> json =
                  Map<String, dynamic>.from(Uri.splitQueryString(jsonStr));
              return FavoriteWidget.fromJson(json);
            } catch (e) {
              print('Error parsing favorite: $e');
              return null;
            }
          })
          .where((fav) => fav != null)
          .cast<FavoriteWidget>()
          .toList();

      favorites.assignAll(loadedFavorites);
      _updateFilteredFavorites();
      _updateStats();
    } catch (e) {
      print('Error loading favorites: $e');
    }
  }

  Future<void> saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = favorites.map((fav) {
        final json = fav.toJson();
        return json.entries
            .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
            .join('&');
      }).toList();

      await prefs.setStringList('favorites_v2', favoritesJson);
      _updateStats();
    } catch (e) {
      print('Error saving favorites: $e');
    }
  }

  void toggleFavorite(String widgetName, String category, String route) {
    final existingIndex = favorites.indexWhere((fav) => fav.name == widgetName);

    if (existingIndex != -1) {
      favorites.removeAt(existingIndex);
      Get.snackbar(
        '💔 Removido de Favoritos',
        '$widgetName eliminado de tus favoritos',
        duration: const Duration(seconds: 2),
      );
    } else {
      final newFavorite = FavoriteWidget(
        name: widgetName,
        category: category,
        route: route,
        dateAdded: DateTime.now(),
      );
      favorites.add(newFavorite);
      Get.snackbar(
        '❤️ Agregado a Favoritos',
        '$widgetName agregado a tus favoritos',
        duration: const Duration(seconds: 2),
      );
    }

    saveFavorites();
    _updateFilteredFavorites();
  }

  void incrementUsage(String widgetName) {
    final index = favorites.indexWhere((fav) => fav.name == widgetName);
    if (index != -1) {
      favorites[index] = favorites[index].copyWith(
        usageCount: favorites[index].usageCount + 1,
      );
      saveFavorites();
    }
  }

  bool isFavorite(String widgetName) {
    return favorites.any((fav) => fav.name == widgetName);
  }

  void clearAllFavorites() {
    favorites.clear();
    saveFavorites();
    _updateFilteredFavorites();
    Get.snackbar(
      '🗑️ Favoritos Eliminados',
      'Todos los favoritos han sido eliminados',
      duration: const Duration(seconds: 2),
    );
  }

  void searchFavorites(String query) {
    searchQuery.value = query.toLowerCase();
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
  }

  void setSortBy(String sort) {
    if (sortBy.value == sort) {
      sortAscending.value = !sortAscending.value;
    } else {
      sortBy.value = sort;
      sortAscending.value = false;
    }
  }

  void _updateFilteredFavorites() {
    var filtered = favorites.where((fav) {
      final matchesSearch = searchQuery.value.isEmpty ||
          fav.name.toLowerCase().contains(searchQuery.value) ||
          fav.category.toLowerCase().contains(searchQuery.value);

      final matchesCategory = selectedCategory.value == 'all' ||
          fav.category == selectedCategory.value;

      return matchesSearch && matchesCategory;
    }).toList();

    // Aplicar ordenamiento
    filtered.sort((a, b) {
      int comparison = 0;

      switch (sortBy.value) {
        case 'name':
          comparison = a.name.compareTo(b.name);
          break;
        case 'category':
          comparison = a.category.compareTo(b.category);
          break;
        case 'usageCount':
          comparison = a.usageCount.compareTo(b.usageCount);
          break;
        case 'dateAdded':
        default:
          comparison = a.dateAdded.compareTo(b.dateAdded);
          break;
      }

      return sortAscending.value ? comparison : -comparison;
    });

    filteredFavorites.assignAll(filtered);
  }

  void _updateStats() {
    totalFavorites.value = favorites.length;

    // Contar por categoría
    final categoryCount = <String, int>{};
    for (final fav in favorites) {
      categoryCount[fav.category] = (categoryCount[fav.category] ?? 0) + 1;
    }
    favoritesByCategory.assignAll(categoryCount);

    // Recientes (últimos 5)
    final recent = favorites.map((fav) => fav.name).take(5).toList();
    recentlyAdded.assignAll(recent);

    // Más usados (top 5)
    final mostUsedList = favorites.where((fav) => fav.usageCount > 0).toList()
      ..sort((a, b) => b.usageCount.compareTo(a.usageCount));
    mostUsed.assignAll(mostUsedList.take(5).map((fav) => fav.name).toList());
  }

  List<String> getAvailableCategories() {
    final categories = favorites.map((fav) => fav.category).toSet().toList();
    categories.sort();
    return ['all', ...categories];
  }

  void exportFavorites() {
    // TODO: Implementar exportación a JSON
    Get.snackbar(
      '📤 Exportar',
      'Función de exportación en desarrollo',
      duration: const Duration(seconds: 2),
    );
  }

  void importFavorites() {
    // TODO: Implementar importación desde JSON
    Get.snackbar(
      '📥 Importar',
      'Función de importación en desarrollo',
      duration: const Duration(seconds: 2),
    );
  }
}
