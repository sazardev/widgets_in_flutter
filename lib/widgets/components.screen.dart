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
import 'package:widgets_in_flutter/widgets/forms/forms.screen.dart';
import 'package:widgets_in_flutter/widgets/material/material.screen.dart';
import 'package:widgets_in_flutter/widgets/gestures/gestures.screen.dart';
import 'package:widgets_in_flutter/widgets/scrolling/scrolling.screen.dart';
import 'package:widgets_in_flutter/widgets/media/media.screen.dart';
import 'package:widgets_in_flutter/widgets/platform/platform.screen.dart';
import 'package:widgets_in_flutter/widgets/sensors/sensors.screen.dart';
import 'package:widgets_in_flutter/widgets/accessibility/accessibility.screen.dart';
import 'package:widgets_in_flutter/widgets/performance/performance.screen.dart';
import 'package:widgets_in_flutter/widgets/advanced_animations/advanced_animations.screen.dart';
import 'package:widgets_in_flutter/widgets/paint/paint.screen.dart';
import 'package:widgets_in_flutter/widgets/state/state.screen.dart';
import 'package:widgets_in_flutter/widgets/cupertino/cupertino.screen.dart';
import 'package:widgets_in_flutter/widgets/slivers/slivers.screen.dart';
import 'package:widgets_in_flutter/widgets/dialogs_overlays/dialogs_overlays.screen.dart';
import 'package:widgets_in_flutter/widgets/effects_filters/effects_filters.screen.dart';
import 'package:widgets_in_flutter/widgets/testing_debug/testing_debug.screen.dart';
import 'package:widgets_in_flutter/widgets/charts_data/charts_data.screen.dart';
import 'package:widgets_in_flutter/widgets/internationalization/internationalization.screen.dart';
import 'package:widgets_in_flutter/widgets/security_auth/security_auth.screen.dart';
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
              crossAxisCount: MediaQuery.of(context).size.width > 900
                  ? 4
                  : MediaQuery.of(context).size.width > 600
                      ? 3
                      : 2,
              childAspectRatio: 1.1,
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
                FadeInUp(
                  delay: const Duration(milliseconds: 1000),
                  child: CategoryCard(
                    icon: Icons.dynamic_form,
                    title: 'Forms',
                    subtitle: 'TextFormField, Validation, Forms',
                    color: Colors.amber.shade100,
                    onTap: () => Get.to(() => const FormsScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 1100),
                  child: CategoryCard(
                    icon: Icons.design_services,
                    title: 'Material Design',
                    subtitle: 'Cards, Surfaces, Material widgets',
                    color: Colors.lightBlue.shade100,
                    onTap: () => Get.to(() => const MaterialScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 1200),
                  child: CategoryCard(
                    icon: Icons.touch_app,
                    title: 'Gestures',
                    subtitle: 'Tap, Drag, Pan, Long Press',
                    color: Colors.red.shade100,
                    onTap: () => Get.to(() => const GesturesScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 1300),
                  child: CategoryCard(
                    icon: Icons.view_list,
                    title: 'Scrolling',
                    subtitle: 'PageView, NestedScroll, Refresh',
                    color: Colors.lime.shade100,
                    onTap: () => Get.to(() => const ScrollingScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 1400),
                  child: CategoryCard(
                    icon: Icons.devices,
                    title: 'Media & Responsive',
                    subtitle: 'MediaQuery, Responsive layouts',
                    color: Colors.brown.shade100,
                    onTap: () => Get.to(() => const MediaScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 1500),
                  child: CategoryCard(
                    icon: Icons.phonelink,
                    title: 'Platform',
                    subtitle: 'iOS/Android specific widgets',
                    color: Colors.grey.shade300,
                    onTap: () => Get.to(() => const PlatformScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 1600),
                  child: CategoryCard(
                    icon: Icons.sensors,
                    title: 'Sensors & Device',
                    subtitle: 'Battery, Location, Accelerometer',
                    color: Colors.deepOrange.shade100,
                    onTap: () => Get.to(() => const SensorsScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 1700),
                  child: CategoryCard(
                    icon: Icons.accessibility,
                    title: 'Accessibility',
                    subtitle: 'Semantics, Screen readers',
                    color: Colors.lightGreen.shade100,
                    onTap: () => Get.to(() => const AccessibilityScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 1800),
                  child: CategoryCard(
                    icon: Icons.speed,
                    title: 'Performance',
                    subtitle: 'Optimization, ListView.builder',
                    color: Colors.yellow.shade100,
                    onTap: () => Get.to(() => const PerformanceScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 1900),
                  child: CategoryCard(
                    icon: Icons.auto_awesome,
                    title: 'Advanced Animations',
                    subtitle: 'Custom animations, Physics',
                    color: Colors.purple.shade200,
                    onTap: () => Get.to(() => const AdvancedAnimationsScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 2000),
                  child: CategoryCard(
                    icon: Icons.palette,
                    title: 'Custom Paint',
                    subtitle: 'CustomPainter, Canvas drawing',
                    color: Colors.blueGrey.shade100,
                    onTap: () => Get.to(() => const CustomPaintScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 2100),
                  child: CategoryCard(
                    icon: Icons.settings_applications,
                    title: 'State Management',
                    subtitle: 'GetX, Provider, Bloc patterns',
                    color: Colors.indigo.shade200,
                    onTap: () => Get.to(() => const StateManagementScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 2200),
                  child: CategoryCard(
                    icon: Icons.phone_iphone,
                    title: 'Cupertino (iOS)',
                    subtitle: 'iOS-style widgets, CupertinoButton',
                    color: Colors.grey.shade200,
                    onTap: () => Get.to(() => const CupertinoScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 2300),
                  child: CategoryCard(
                    icon: Icons.layers,
                    title: 'Slivers',
                    subtitle: 'SliverAppBar, Advanced scrolling',
                    color: Colors.deepPurple.shade100,
                    onTap: () => Get.to(() => const SliversScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 2400),
                  child: CategoryCard(
                    icon: Icons.layers_outlined,
                    title: 'Dialogs & Overlays',
                    subtitle: 'Dialogs, BottomSheets, Overlays',
                    color: Colors.cyan.shade200,
                    onTap: () => Get.to(() => const DialogsOverlaysScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 2500),
                  child: CategoryCard(
                    icon: Icons.auto_fix_high,
                    title: 'Effects & Filters',
                    subtitle: 'Blur, Gradients, Transforms',
                    color: Colors.pink.shade200,
                    onTap: () => Get.to(() => const EffectsFiltersScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 2600),
                  child: CategoryCard(
                    icon: Icons.bug_report,
                    title: 'Testing & Debug',
                    subtitle: 'Debug tools, Testing widgets',
                    color: Colors.red.shade200,
                    onTap: () => Get.to(() => const TestingDebugScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 2700),
                  child: CategoryCard(
                    icon: Icons.insert_chart,
                    title: 'Charts & Data',
                    subtitle: 'Charts, Graphs, Data visualization',
                    color: Colors.lightBlue.shade200,
                    onTap: () => Get.to(() => const ChartsDataScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 2800),
                  child: CategoryCard(
                    icon: Icons.language,
                    title: 'Internationalization',
                    subtitle: 'i18n, RTL, Localization',
                    color: Colors.lightGreen.shade200,
                    onTap: () => Get.to(
                        () => const InternationalizationScreen(),
                        transition: Transition.fadeIn),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 2900),
                  child: CategoryCard(
                    icon: Icons.security,
                    title: 'Security & Auth',
                    subtitle: 'Authentication, Encryption',
                    color: Colors.amber.shade200,
                    onTap: () => Get.to(() => const SecurityAuthScreen(),
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
