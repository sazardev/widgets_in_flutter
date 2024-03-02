import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/components/actions/actions.screen.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Components'),
        actions: [
          ThemeMaterial(isLandscape: false),
          ThemeBrightness(isLandscape: false),
          ThemeSelector(isLandscape: false),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.attractions),
              subtitle: const Text('Actions'),
              title: const Text('Actions'),
              onTap: () => Get.to((() => const ActionsScreen()),
                  transition: Transition.noTransition),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
