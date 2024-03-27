import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/arduino-light.dart';
import 'package:flutter_highlight/themes/gruvbox-dark.dart';
import 'package:flutter_highlight/themes/gruvbox-light.dart';
import 'package:flutter_highlight/themes/monokai.dart';
import 'package:flutter_highlight/themes/night-owl.dart';
import 'package:flutter_highlight/themes/shades-of-purple.dart';
import 'package:flutter_highlight/themes/solarized-dark.dart';
import 'package:flutter_highlight/themes/solarized-light.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CodeController extends GetxController {
  RxDouble fontSize = 24.0.obs;
  RxString currentTheme = 'arduino-light'.obs;
  Map<String, Map<String, TextStyle>> themeMap = {
    'arduino-light': arduinoLightTheme,
    'github': githubTheme,
    'monokai': monokaiTheme,
    'solarized-dark': solarizedDarkTheme,
    'solarized-light': solarizedLightTheme,
    'gruvbox-dark': gruvboxDarkTheme,
    'gruvbox-light': gruvboxLightTheme,
    'dracula': draculaTheme,
    'night-owl': nightOwlTheme,
    'shades-of-purple': shadesOfPurpleTheme,
  };

  void changeFontSize(double newSize) {
    fontSize.value = newSize;
    update();
  }

  void changeTheme(String newTheme) {
    if (themeMap.containsKey(newTheme)) {
      currentTheme.value = newTheme;
    } else {
      currentTheme.value = 'arduino-light'; // Default theme
    }
    update();
  }

  Map<String, TextStyle> get currentHighlightTheme {
    return themeMap[currentTheme.value] ?? arduinoLightTheme;
  }
}
