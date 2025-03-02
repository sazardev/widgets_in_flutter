import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/favorites/favorites.screen.dart';
import 'package:widgets_in_flutter/widgets/components.screen.dart';
import 'package:widgets_in_flutter/core/routes/routes.controller.dart';
import 'package:widgets_in_flutter/settings/settings.screen.dart';
import 'package:widgets_in_flutter/widgets/search.screen.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoutesController>(
      builder: (controller) {
        return NavigationBar(
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.widgets),
              label: 'Widgets',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.changeIndex(index);
            switch (index) {
              case 0:
                Get.offAll((() => const ComponentsScreen()),
                    transition: Transition.noTransition);
                break;
              case 1:
                Get.to((() => const FavoritesScreen()),
                    transition: Transition.rightToLeftWithFade);
                break;
              case 2:
                Get.to((() => const SearchScreen()),
                    transition: Transition.rightToLeftWithFade);
                break;
              case 3:
                Get.offAll((() => const SettingsScreen()),
                    transition: Transition.noTransition);
                break;
            }
          },
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        );
      },
    );
  }
}
