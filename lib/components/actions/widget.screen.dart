import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/components/actions/widget.controller.dart';
import 'package:widgets_in_flutter/components/actions/widget.settings.screen.dart';

class WidgetScreen extends StatelessWidget {
  const WidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments = Get.arguments;
    final String? code = arguments['code'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Code'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Get.to((() => const WidgetSettingsScreen()));
            },
          ),
        ],
      ),
      body: GetBuilder<WidgetController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: HighlightView(
              code!,
              language: 'dart',
              theme: controller.currentHighlightTheme,
              padding: const EdgeInsets.all(12),
              textStyle: TextStyle(
                fontFamily: 'monospace',
                fontSize: controller.fontSize.value,
              ),
            ),
          );
        },
      ),
    );
  }
}
