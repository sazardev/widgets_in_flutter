import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:widgets_in_flutter/favorites/favorites.controller.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';
import 'package:widgets_in_flutter/code/code.screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController =
        Get.find<FavoritesController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Widgets ✨'),
        actions: [
          Obx(() => favoritesController.favorites.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.delete_sweep),
                  tooltip: 'Clear all favorites',
                  onPressed: () =>
                      _showClearConfirmation(context, favoritesController),
                )
              : const SizedBox.shrink()),
        ],
      ),
      body: Obx(() {
        if (favoritesController.favorites.isEmpty) {
          return _buildEmptyState(context);
        }
        return _buildFavoritesList(context, favoritesController);
      }),
      bottomNavigationBar: const NavigationBarWidget(),
    );
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
          final String widgetName = controller.favorites[index];

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
                  widgetName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: const Text('Tap to view details'),
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  child: Text(widgetName[0]),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  tooltip: 'Remove from favorites',
                  onPressed: () {
                    controller.toggleFavorite(widgetName);
                    Get.snackbar(
                      'Removed from Favorites',
                      '$widgetName removed from your favorites',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor:
                          Theme.of(context).colorScheme.errorContainer,
                      colorText: Theme.of(context).colorScheme.onErrorContainer,
                    );
                  },
                ),
                onTap: () => _navigateToWidget(widgetName),
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToWidget(String widgetName) {
    // This is a simplified example - you'll need to expand this
    // to properly navigate to the correct widget based on your app structure

    // Map of widget names to their routes or handling
    final Map<String, Function> widgetRoutes = {
      'FilledButton': () => Get.toNamed('/components/actions/'),
      'Selection': () => Get.toNamed('/components/selections/'),
      // Add more mappings as needed
    };

    // Try to navigate using the map, or show the widget in code view as fallback
    if (widgetRoutes.containsKey(widgetName)) {
      widgetRoutes[widgetName]!();
    } else {
      // Fallback to showing a generic code view if specific navigation isn't defined
      Get.to(() => const CodeScreen(), arguments: {
        'title': widgetName,
        'code': '// Example code for $widgetName\n// Add actual code here',
      });
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
