import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:widgets_in_flutter/theme/theme.controller.dart';

class ThemeMaterial extends StatelessWidget {
  const ThemeMaterial({
    super.key,
    required ThemeController themeController,
  }) : _themeController = themeController;

  final ThemeController _themeController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IconButton(
        onPressed: () {
          _themeController.changeMaterialVersion();
        },
        icon: Icon(_themeController.isMaterial3.value
            ? Icons.threed_rotation
            : Icons.two_k),
      );
    });
  }
}
