import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:widgets_in_flutter/code/code.controller.dart';
import 'package:widgets_in_flutter/code/code.settings.screen.dart';

class CodeScreen extends StatelessWidget {
  const CodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments = Get.arguments;
    final String? code = arguments['code'];
    final String title = arguments['title'] ?? 'Widget Code';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: 'Copy code',
            onPressed: () {
              Clipboard.setData(ClipboardData(text: code ?? ''));
              Get.snackbar(
                'Copied!',
                'Code copied to clipboard',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                colorText: Theme.of(context).colorScheme.onPrimaryContainer,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Code settings',
            onPressed: () {
              Get.to(() => const CodeSettingsScreen());
            },
          ),
        ],
      ),
      body: FadeIn(
        child: GetBuilder<CodeController>(
          builder: (controller) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => controller
                            .changeFontSize(controller.fontSize.value - 2),
                        tooltip: 'Decrease font size',
                      ),
                      Text('${controller.fontSize.value.toInt()}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => controller
                            .changeFontSize(controller.fontSize.value + 2),
                        tooltip: 'Increase font size',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: HighlightView(
                      code ?? 'No code provided',
                      language: 'dart',
                      theme: controller.currentHighlightTheme,
                      padding: const EdgeInsets.all(16),
                      textStyle: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: controller.fontSize.value,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.back(),
        tooltip: 'Back',
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
