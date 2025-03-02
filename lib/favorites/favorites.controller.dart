import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesController extends GetxController {
  final RxList<String> favorites = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getStringList('favorites') ?? [];
    favorites.assignAll(savedFavorites);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', favorites.toList());
  }

  void toggleFavorite(String widgetName) {
    if (favorites.contains(widgetName)) {
      favorites.remove(widgetName);
    } else {
      favorites.add(widgetName);
    }
    saveFavorites();
  }

  bool isFavorite(String widgetName) {
    return favorites.contains(widgetName);
  }

  void clearAllFavorites() {
    favorites.clear();
    saveFavorites();
  }
}
