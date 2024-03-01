import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:widgets_in_flutter/theme/theme.controller.dart';

class ThemeBrightness extends StatelessWidget {
  const ThemeBrightness({
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
              title: const Text('Dark Theme'),
              value: themeController.isDarkTheme.value,
              onChanged: (bool value) {
                themeController.changeTheme();
              },
            )
          : IconButton(
              onPressed: () {
                themeController.changeTheme();
              },
              icon: Icon(themeController.isDarkTheme.value
                  ? Icons.light_mode
                  : Icons.dark_mode),
            );
    });
  }
}
