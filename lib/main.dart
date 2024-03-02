import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/components/actions/actions.screen.dart';
import 'package:widgets_in_flutter/components/components.screen.dart';
import 'package:widgets_in_flutter/navigation/navigation.controller.dart';
import 'package:widgets_in_flutter/routes/app.routes.dart';
import 'package:widgets_in_flutter/settings/settings.screen.dart';
import 'package:widgets_in_flutter/theme/theme.controller.dart';

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
        initialRoute: AppRoutes.INITIAL,
        getPages: [
          GetPage(
            name: AppRoutes.INITIAL,
            page: () => const ComponentsScreen(),
          ),
          GetPage(
            name: AppRoutes.SETTINGS,
            page: () => const SettingsScreen(),
          ),
          GetPage(
            name: AppRoutes.COMPONENTS_ACTIONS,
            page: () => const ActionsScreen(),
          ),
        ],
        initialBinding: BindingsBuilder(() {
          Get.put(
            NavigationController(),
          );
        }),
      );
    });
  }
}
