import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/theme/theme.controller.dart';
import 'navigation.controller.dart';

class NavigationScreen extends StatelessWidget {
  final NavigationController _navController = Get.put(NavigationController());
  final ThemeController _themeController = Get.put(ThemeController());

  NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      return screenWidth > 800
          ? _buildWideLayout(context)
          : _buildNarrowLayout(context);
    });
  }

  Widget _buildWideLayout(context) {
    return Scaffold(
      body: Row(
        children: [
          Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    _navController.changePage(0);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    _navController.changePage(1);
                  },
                ),
                ThemeBrightness(
                    themeController: _themeController, isLandscape: true),
                ThemeMaterial(
                    themeController: _themeController, isLandscape: true),
                ThemeSelector(
                    themeController: _themeController, isLandscape: true),
              ],
            ),
          ),
          Expanded(
            child: _getPage(_navController.currentPage.value),
          ),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Narrow Layout'),
        actions: [
          ThemeMaterial(themeController: _themeController, isLandscape: false),
          ThemeBrightness(
              themeController: _themeController, isLandscape: false),
          ThemeSelector(themeController: _themeController, isLandscape: false),
        ],
      ),
      body: _getPage(_navController.currentPage.value),
      bottomNavigationBar: NavigationBar(
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedIndex: _navController.currentPage.value,
        onDestinationSelected: (index) {
          _navController.changePage(index);
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text('Home Page'));
      case 1:
        return const Center(child: Text('Settings Page'));
      default:
        return const Center(child: Text('Page not found'));
    }
  }
}
