import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:widgets_in_flutter/theme/theme.controller.dart';

class ThemeMaterial extends StatelessWidget {
  const ThemeMaterial({
    super.key,
    required this.themeController,
    required this.isLandscape,
  });

  final ThemeController themeController;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return isLandscape
          ? SwitchListTile(
              title: const Text('Material 3'),
              value: themeController.isMaterial3.value,
              onChanged: (bool value) {
                themeController.changeMaterialVersion();
              },
            )
          : IconButton(
              onPressed: () {
                themeController.changeMaterialVersion();
              },
              icon: Icon(themeController.isMaterial3.value
                  ? Icons.threed_rotation
                  : Icons.two_k),
            );
    });
  }
}
