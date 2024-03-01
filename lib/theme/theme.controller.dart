import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkTheme = false.obs;
  var isMaterial3 = true.obs;
  var primaryColor = Colors.indigo.obs;

  ThemeData get themeData => ThemeData(
        brightness: isDarkTheme.value ? Brightness.dark : Brightness.light,
        useMaterial3: isMaterial3.value,
        colorSchemeSeed: primaryColor.value,
      );

  void changeTheme() {
    isDarkTheme.value = !isDarkTheme.value;
  }

  void changeMaterialVersion() {
    isMaterial3.value = !isMaterial3.value;
  }

  void changePrimaryColor(Color color) {
    primaryColor.value = color as MaterialColor;
  }
}
