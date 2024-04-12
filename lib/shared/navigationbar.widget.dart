import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/widgets/components.screen.dart';
import 'package:widgets_in_flutter/core/routes/routes.controller.dart';
import 'package:widgets_in_flutter/settings/settings.screen.dart';

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
              label: 'Components',
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
