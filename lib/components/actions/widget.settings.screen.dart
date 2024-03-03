import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/arduino-light.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/components/actions/widget.controller.dart';

class WidgetSettingsScreen extends StatelessWidget {
  const WidgetSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: GetBuilder<WidgetController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: HighlightView(
                    // Aquí puedes poner tu código de ejemplo
                    'void main() {\n  print("Hello, World!");\n}',
                    language: 'dart',
                    theme: arduinoLightTheme,
                    padding: const EdgeInsets.all(12),
                    textStyle: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: controller.fontSize.value,
                    ),
                  ),
                ),
              ),
              Slider(
                value: controller.fontSize.value,
                min: 8,
                max: 46,
                onChanged: (newSize) {
                  controller.changeFontSize(newSize);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
