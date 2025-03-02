import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:widgets_in_flutter/shared/category_card.widget.dart';
import 'package:widgets_in_flutter/widgets/actions/actions.screen.dart';
import 'package:widgets_in_flutter/widgets/selections/selection.screen.dart';
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
        title: const Text('Flutter Widgets Gallery'),
        actions: [
          ThemeMaterial(isLandscape: false),
          ThemeBrightness(isLandscape: false),
          ThemeSelector(isLandscape: false),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FadeInDown(
              child: Text(
                'Explore Flutter Widgets',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16.0),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
              children: [
                FadeInUp(
                  delay: const Duration(milliseconds: 100),
                  child: CategoryCard(
                    icon: Icons.touch_app,
                    title: 'Actions',
                    subtitle: 'Buttons, FABs, and more',
                    color: Colors.blue.shade100,
                    onTap: () => Get.to(() => const ActionsScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  child: CategoryCard(
                    icon: Icons.select_all,
                    title: 'Selections',
                    subtitle: 'Checkboxes, chips, and more',
                    color: Colors.green.shade100,
                    onTap: () => Get.to(() => const SelectionScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: CategoryCard(
                    icon: Icons.input,
                    title: 'Inputs',
                    subtitle: 'Text fields and more',
                    color: Colors.orange.shade100,
                    onTap: () => Get.to(() => const SelectionScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 400),
                  child: CategoryCard(
                    icon: Icons.layers,
                    title: 'Layout',
                    subtitle: 'Flex, Grid, and more',
                    color: Colors.purple.shade100,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
