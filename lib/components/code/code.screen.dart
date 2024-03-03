import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/components/code/code.controller.dart';
import 'package:widgets_in_flutter/components/code/code.settings.screen.dart';

class CodeScreen extends StatelessWidget {
  const CodeScreen({super.key});

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
              Get.to((() => const CodeSettingsScreen()));
            },
          ),
        ],
      ),
      body: GetBuilder<CodeController>(
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
