import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/navigation/navigation.controller.dart';

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onTap: () {
                // Añade la pantalla actual al historial y navega a ActionsScreen
                Get.find<NavigationController>().changeScreen(1);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
