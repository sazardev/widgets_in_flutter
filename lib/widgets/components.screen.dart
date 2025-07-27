import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:widgets_in_flutter/shared/category_card.widget.dart';
import 'package:widgets_in_flutter/widgets/actions/actions.screen.dart';
import 'package:widgets_in_flutter/widgets/selections/selection.screen.dart';
import 'package:widgets_in_flutter/widgets/inputs/inputs.screen.dart';
import 'package:widgets_in_flutter/widgets/navigation/navigation.screen.dart';
import 'package:widgets_in_flutter/widgets/text/text.screen.dart';
import 'package:widgets_in_flutter/widgets/images/images.screen.dart';
import 'package:widgets_in_flutter/widgets/layout/layout.screen.dart';
import 'package:widgets_in_flutter/widgets/lists/lists.screen.dart';
import 'package:widgets_in_flutter/widgets/animations/animations.screen.dart';
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
                    onTap: () => Get.to(() => const InputsScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 400),
                  child: CategoryCard(
                    icon: Icons.navigation,
                    title: 'Navigation',
                    subtitle: 'AppBar, Tabs, Drawers',
                    color: Colors.purple.shade100,
                    onTap: () => Get.to(() => const NavigationScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 500),
                  child: CategoryCard(
                    icon: Icons.text_fields,
                    title: 'Text',
                    subtitle: 'Text, RichText, SelectableText',
                    color: Colors.indigo.shade100,
                    onTap: () => Get.to(() => const TextScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 600),
                  child: CategoryCard(
                    icon: Icons.image,
                    title: 'Images & Icons',
                    subtitle: 'Images, Icons, Avatars',
                    color: Colors.pink.shade100,
                    onTap: () => Get.to(() => const ImagesScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 700),
                  child: CategoryCard(
                    icon: Icons.layers,
                    title: 'Layout',
                    subtitle: 'Container, Column, Row, Stack',
                    color: Colors.teal.shade100,
                    onTap: () => Get.to(() => const LayoutScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  child: CategoryCard(
                    icon: Icons.list,
                    title: 'Lists & Grids',
                    subtitle: 'ListView, GridView, Reorderable',
                    color: Colors.cyan.shade100,
                    onTap: () => Get.to(() => const ListsScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 900),
                  child: CategoryCard(
                    icon: Icons.animation,
                    title: 'Animations',
                    subtitle: 'AnimatedContainer, Hero, Transitions',
                    color: Colors.deepPurple.shade100,
                    onTap: () => Get.to(() => const AnimationsScreen(),
                        transition: Transition.fadeIn),
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
