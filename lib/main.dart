import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/favorites/favorites.screen.dart';
import 'package:widgets_in_flutter/favorites/favorites.controller.dart';
import 'package:widgets_in_flutter/widgets/actions/actions.screen.dart';
import 'package:widgets_in_flutter/widgets/inputs/inputs.screen.dart';
import 'package:widgets_in_flutter/widgets/navigation/navigation.screen.dart';
import 'package:widgets_in_flutter/widgets/text/text.screen.dart';
import 'package:widgets_in_flutter/widgets/images/images.screen.dart';
import 'package:widgets_in_flutter/widgets/layout/layout.screen.dart';
import 'package:widgets_in_flutter/widgets/lists/lists.screen.dart';
import 'package:widgets_in_flutter/widgets/animations/animations.screen.dart';
import 'package:widgets_in_flutter/widgets/gestures/gestures.screen.dart';
import 'package:widgets_in_flutter/widgets/scrolling/scrolling.screen.dart';
import 'package:widgets_in_flutter/widgets/forms/forms.screen.dart';
import 'package:widgets_in_flutter/widgets/material/material.screen.dart';
import 'package:widgets_in_flutter/widgets/media/media.screen.dart';
import 'package:widgets_in_flutter/widgets/paint/paint.screen.dart';
import 'package:widgets_in_flutter/widgets/performance/performance.screen.dart';
import 'package:widgets_in_flutter/widgets/accessibility/accessibility.screen.dart';
import 'package:widgets_in_flutter/widgets/platform/platform.screen.dart';
import 'package:widgets_in_flutter/widgets/state/state.screen.dart'
    hide ThemeController;
import 'package:widgets_in_flutter/widgets/advanced_animations/advanced_animations.screen.dart';
import 'package:widgets_in_flutter/widgets/sensors/sensors.screen.dart';
import 'package:widgets_in_flutter/widgets/cupertino/cupertino.screen.dart';
import 'package:widgets_in_flutter/widgets/slivers/slivers.screen.dart';
import 'package:widgets_in_flutter/widgets/dialogs_overlays/dialogs_overlays.screen.dart';
import 'package:widgets_in_flutter/widgets/effects_filters/effects_filters.screen.dart';
import 'package:widgets_in_flutter/widgets/testing_debug/testing_debug.screen.dart';
import 'package:widgets_in_flutter/widgets/charts_data/charts_data.screen.dart';
import 'package:widgets_in_flutter/widgets/internationalization/internationalization.screen.dart';
import 'package:widgets_in_flutter/widgets/security_auth/security_auth.screen.dart';
import 'package:widgets_in_flutter/code/code.controller.dart';
import 'package:widgets_in_flutter/widgets/components.screen.dart';
import 'package:widgets_in_flutter/core/routes/routes.controller.dart';
import 'package:widgets_in_flutter/core/routes/routes.dart';
import 'package:widgets_in_flutter/settings/settings.screen.dart';
import 'package:widgets_in_flutter/core/theme/theme.controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = Get.put(ThemeController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _themeController.themeData,
        initialRoute: Routes.INITIAL,
        getPages: [
          GetPage(
            name: Routes.INITIAL,
            page: () => const ComponentsScreen(),
          ),
          GetPage(name: Routes.FAVORITES, page: () => const FavoritesScreen()),
          GetPage(
            name: Routes.SETTINGS,
            page: () => const SettingsScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_ACTIONS,
            page: () => const ActionsScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_INPUTS,
            page: () => const InputsScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_NAVIGATION,
            page: () => const NavigationScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_TEXT,
            page: () => const TextScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_IMAGES,
            page: () => const ImagesScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_LAYOUT,
            page: () => const LayoutScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_LISTS,
            page: () => const ListsScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_ANIMATIONS,
            page: () => const AnimationsScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_GESTURES,
            page: () => const GesturesScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_SCROLLING,
            page: () => const ScrollingScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_FORMS,
            page: () => const FormsScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_MATERIAL,
            page: () => const MaterialScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_MEDIA,
            page: () => const MediaScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_PAINT,
            page: () => const CustomPaintScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_PERFORMANCE,
            page: () => const PerformanceScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_ACCESSIBILITY,
            page: () => const AccessibilityScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_PLATFORM,
            page: () => const PlatformScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_STATE,
            page: () => const StateManagementScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_ADVANCED_ANIMATIONS,
            page: () => const AdvancedAnimationsScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_SENSORS,
            page: () => const SensorsScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_CUPERTINO,
            page: () => const CupertinoScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_SLIVERS,
            page: () => const SliversScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_DIALOGS_OVERLAYS,
            page: () => const DialogsOverlaysScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_EFFECTS_FILTERS,
            page: () => const EffectsFiltersScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_TESTING_DEBUG,
            page: () => const TestingDebugScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_CHARTS_DATA,
            page: () => const ChartsDataScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_INTERNATIONALIZATION,
            page: () => const InternationalizationScreen(),
          ),
          GetPage(
            name: Routes.COMPONENTS_SECURITY_AUTH,
            page: () => const SecurityAuthScreen(),
          ),
        ],
        initialBinding: BindingsBuilder(() {
          Get.put(RoutesController());
          Get.put(CodeController());
          Get.put(FavoritesController()); // Add this line
        }),
      );
    });
  }
}
