import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/favorites/favorites.screen.dart';
import 'package:widgets_in_flutter/favorites/favorites.controller.dart';
import 'package:widgets_in_flutter/widgets/actions/actions.screen.dart';
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
