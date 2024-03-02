import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/core/theme/theme.controller.dart';

class ThemeMaterial extends StatelessWidget {
  ThemeMaterial({
    super.key,
    required this.isLandscape,
  });

  final bool isLandscape;
  final ThemeController themeController = Get.put(ThemeController());

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
