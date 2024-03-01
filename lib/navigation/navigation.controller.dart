import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/components/actions/actions.screen.dart';
import 'package:widgets_in_flutter/components/components.screen.dart';
import 'package:widgets_in_flutter/settings/settings.screen.dart';

class NavigationController extends GetxController {
  var currentPage = 0.obs;
  var currentScreenIndex = (-1).obs;
  List<int> history = [];
  List<String> screenTitles = ['Components', 'Actions', 'Settings'];
  List<Widget> screens = const [
    ComponentsScreen(),
    ActionsScreen(),
    SettingsScreen(),
  ];

  void changePage(int index) {
    currentPage.value = index;
    currentScreenIndex.value = -1;
    history
        .clear(); // Limpia el historial de navegación cuando se cambia de página
  }

  void changeScreen(int index) {
    if (currentScreenIndex.value != 0) {
      history.add(currentScreenIndex.value);
    }
    currentScreenIndex.value = index;
  }

  void goBack() {
    if (history.isNotEmpty) {
      currentScreenIndex.value = history.removeLast();
    }
  }

  String get currentScreenTitle {
    if (currentScreenIndex.value == -1) {
      return screenTitles[currentPage.value];
    } else {
      return screenTitles[currentScreenIndex.value];
    }
  }

  Widget get currentScreen {
    if (currentScreenIndex.value == -1) {
      return screens[currentPage.value];
    } else {
      return screens[currentScreenIndex.value];
    }
  }
}
