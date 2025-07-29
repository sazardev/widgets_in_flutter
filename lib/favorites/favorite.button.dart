import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/favorites/favorites.controller.dart';

class FavoriteButton extends StatelessWidget {
  final String widgetName;
  final double? size;

  const FavoriteButton({
    super.key,
    required this.widgetName,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final FavoritesController controller = Get.find<FavoritesController>();

    return Obx(() {
      final bool isFavorite = controller.isFavorite(widgetName);

      return IconButton(
        iconSize: size ?? 24.0,
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            key: ValueKey<bool>(isFavorite),
            color: isFavorite ? Colors.red : null,
          ),
        ),
        tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
        onPressed: () {
          controller.toggleFavorite(widgetName, 'unknown', '/components');

          final String message = isFavorite
              ? '$widgetName removed from favorites'
              : '$widgetName added to favorites';

          Get.snackbar(
            isFavorite ? 'Removed from Favorites' : 'Added to Favorites',
            message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: isFavorite
                ? Theme.of(context).colorScheme.errorContainer
                : Theme.of(context).colorScheme.primaryContainer,
            colorText: isFavorite
                ? Theme.of(context).colorScheme.onErrorContainer
                : Theme.of(context).colorScheme.onPrimaryContainer,
            duration: const Duration(seconds: 2),
          );
        },
      );
    });
  }
}
