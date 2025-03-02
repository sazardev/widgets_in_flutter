import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/code/code.screen.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selections'),
        actions: [
          ThemeMaterial(isLandscape: false),
          ThemeBrightness(isLandscape: false),
          ThemeSelector(isLandscape: false),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        children: [
          CardComponents(
            content: 'Checkboxes',
            tooltip: 'See code',
            onPressedTooltip: () =>
                Get.to(() => const CodeScreen(), arguments: {
              "code": "Code",
            }),
            components: [
              CheckboxListTile(
                value: _selected,
                title: const Text('Option One'),
                onChanged: (onChanged) {
                  setState(() {
                    _selected = onChanged!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Option Two'),
                value: !_selected,
                onChanged: (onChanged) {
                  setState(() {
                    _selected = !onChanged!;
                  });
                },
              ),
              const CheckboxListTile(
                title: Text('Option Three'),
                value: false,
                onChanged: null,
              ),
            ],
          ),
          CardComponents(
            content: 'Radio',
            tooltip: 'See code',
            onPressedTooltip: () =>
                Get.to(() => const CodeScreen(), arguments: {
              "code": "Code",
            }),
            components: [
              RadioListTile(
                value: _selected,
                title: const Text('Option One'),
                onChanged: (onChanged) {
                  setState(() {
                    _selected = onChanged!;
                  });
                },
                groupValue: _selected,
              ),
              RadioListTile(
                title: const Text('Option Two'),
                value: !_selected,
                onChanged: (onChanged) {
                  setState(() {
                    _selected = !onChanged!;
                  });
                },
                groupValue: false,
              ),
              const RadioListTile(
                title: Text('Option Three'),
                value: false,
                onChanged: null,
                groupValue: null,
              ),
            ],
          ),
          CardComponents(
            content: 'Chips',
            components: [
              ActionChip(
                label: const Text('Action Chip'),
                onPressed: () {},
              ),
              ActionChip(
                label: const Text('Action Icon Chip'),
                onPressed: () {},
                avatar: const Icon(Icons.add),
              ),
              ActionChip.elevated(
                label: const Text('Elevated Chip'),
                onPressed: () {},
              ),
              ActionChip.elevated(
                label: const Text('Elevated Icon Chip'),
                onPressed: () {},
                avatar: const Icon(Icons.add),
              ),
            ],
          ),
          CardComponents(
              tooltip: 'See code',
              onPressedTooltip: () =>
                  Get.to(() => const CodeScreen(), arguments: {
                    "code": "Code",
                  }),
              content: 'Pickers',
              components: [
                TextButton(
                  onPressed: () => showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  ),
                  child: const Text('Date picker'),
                ),
                TextButton(
                  onPressed: () => showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  ),
                  child: const Text('Date range picker'),
                ),
                TextButton(
                  onPressed: () => showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ),
                  child: const Text('Time picker'),
                ),
              ])
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
