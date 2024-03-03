import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/components/code/code.controller.dart';

class CodeSettingsScreen extends StatelessWidget {
  const CodeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 150),
          child: GetBuilder<CodeController>(
            builder: (controller) => Column(
              children: [
                ListTile(
                  title: const Text('Override system font size'),
                  subtitle: Slider(
                    value: controller.fontSize.value,
                    min: 8,
                    max: 46,
                    divisions: 5,
                    onChanged: (newSize) {
                      controller.changeFontSize(newSize);
                    },
                    label: controller.fontSize.value.round().toString(),
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (String result) {
                    controller.changeTheme(result);
                  },
                  itemBuilder: (BuildContext context) =>
                      controller.themeMap.keys.map((String key) {
                    return PopupMenuItem<String>(
                      value: key,
                      child: Text(key),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<CodeController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: HighlightView(
                    'void main() {\n  print("Hello, World!");\n}',
                    language: 'dart',
                    theme: controller.currentHighlightTheme,
                    padding: const EdgeInsets.all(12),
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
    );
  }
}
