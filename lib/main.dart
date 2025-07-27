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
