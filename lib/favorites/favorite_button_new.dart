import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/favorites/favorites.controller.dart';

class FavoriteButton extends StatelessWidget {
  final String widgetName;
  final String category;
  final String route;
  final double? size;
  final Color? activeColor;
  final Color? inactiveColor;
  final bool showLabel;

  const FavoriteButton({
    super.key,
    required this.widgetName,
    required this.category,
    required this.route,
    this.size,
    this.activeColor,
    this.inactiveColor,
    this.showLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.find<FavoritesController>();

    return Obx(() {
      final isFav = favoritesController.isFavorite(widgetName);

      return GestureDetector(
        onTap: () {
          favoritesController.toggleFavorite(widgetName, category, route);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: showLabel
              ? const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
              : const EdgeInsets.all(4),
          decoration: showLabel
              ? BoxDecoration(
                  color: isFav
                      ? (activeColor ?? Colors.red).withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isFav
                        ? (activeColor ?? Colors.red)
                        : (inactiveColor ?? Colors.grey),
                    width: 1,
                  ),
                )
              : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  key: ValueKey(isFav),
                  size: size ?? 24,
                  color: isFav
                      ? (activeColor ?? Colors.red)
                      : (inactiveColor ?? Colors.grey),
                ),
              ),
              if (showLabel) ...[
                const SizedBox(width: 4),
                Text(
                  isFav ? 'Favorito' : 'Agregar',
                  style: TextStyle(
                    color: isFav
                        ? (activeColor ?? Colors.red)
                        : (inactiveColor ?? Colors.grey),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }
}

class FavoriteIconButton extends StatelessWidget {
  final String widgetName;
  final String category;
  final String route;
  final double? iconSize;
  final Color? activeColor;
  final Color? inactiveColor;

  const FavoriteIconButton({
    super.key,
    required this.widgetName,
    required this.category,
    required this.route,
    this.iconSize,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.find<FavoritesController>();

    return Obx(() {
      final isFav = favoritesController.isFavorite(widgetName);

      return IconButton(
        onPressed: () {
          favoritesController.toggleFavorite(widgetName, category, route);
        },
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            key: ValueKey(isFav),
            size: iconSize ?? 24,
            color: isFav
                ? (activeColor ?? Colors.red)
                : (inactiveColor ?? Colors.grey),
          ),
        ),
        tooltip: isFav ? 'Quitar de favoritos' : 'Agregar a favoritos',
      );
    });
  }
}

class FavoriteFloatingButton extends StatelessWidget {
  final String widgetName;
  final String category;
  final String route;

  const FavoriteFloatingButton({
    super.key,
    required this.widgetName,
    required this.category,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.find<FavoritesController>();

    return Obx(() {
      final isFav = favoritesController.isFavorite(widgetName);

      return FloatingActionButton(
        onPressed: () {
          favoritesController.toggleFavorite(widgetName, category, route);
        },
        backgroundColor: isFav ? Colors.red : Colors.grey.shade400,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            key: ValueKey(isFav),
            color: Colors.white,
          ),
        ),
      );
    });
  }
}

class FavoriteStatsWidget extends StatelessWidget {
  const FavoriteStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.find<FavoritesController>();

    return Obx(() {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estadísticas de Favoritos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      title: 'Total',
                      value: '${favoritesController.totalFavorites.value}',
                      icon: Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _StatCard(
                      title: 'Categorías',
                      value:
                          '${favoritesController.favoritesByCategory.length}',
                      icon: Icons.category,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              if (favoritesController.recentlyAdded.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  'Agregados Recientemente',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: favoritesController.recentlyAdded.map((name) {
                    return Chip(
                      label: Text(name),
                      avatar: const Icon(Icons.access_time, size: 16),
                    );
                  }).toList(),
                ),
              ],
              if (favoritesController.mostUsed.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  'Más Utilizados',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: favoritesController.mostUsed.map((name) {
                    return Chip(
                      label: Text(name),
                      avatar: const Icon(Icons.trending_up, size: 16),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: color.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
