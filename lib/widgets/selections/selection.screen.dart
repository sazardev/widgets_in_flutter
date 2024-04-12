import 'package:flutter/material.dart';
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
            components: [
              CheckboxListTile(
                value: _selected,
                title: const Text('Option One'),
                onChanged: (onChanged) =>
                    setState(() => _selected = onChanged!),
              ),
              CheckboxListTile(
                title: const Text('Option Two'),
                value: !_selected,
                onChanged: (onChanged) =>
                    setState(() => _selected = !onChanged!),
              ),
              const CheckboxListTile(
                title: Text('Option Three'),
                value: false,
                onChanged: null,
              ),
            ],
          ),
          CardComponents(
            content: 'Chips',
            components: [
              const Chip(label: Text('Simple Chip')),
              const RawChip(label: Text('Raw Chip')),
              const InputChip(label: Text('Input Chip')),
              ActionChip(
                label: const Text('Action Chip'),
                onPressed: () {},
              ),
              ActionChip.elevated(
                label: const Text('Action Chip Elevated'),
                onPressed: () {},
              ),
              ChoiceChip(
                label: const Text('Choice Chip'),
                selected: _selected,
                showCheckmark: false,
                onSelected: (value) => setState(() => _selected = value),
              ),
              ChoiceChip.elevated(
                label: const Text('Choice Chip Elevated'),
                selected: !_selected,
                showCheckmark: false,
                onSelected: (value) => setState(() => _selected = !value),
              ),
              FilterChip(
                label: const Text('Filter Chip'),
                selected: _selected,
                onSelected: (value) => setState(() => _selected = value),
              ),
              FilterChip.elevated(
                label: const Text('Filter Chip Elevated'),
                selected: !_selected,
                onSelected: (value) => setState(() => _selected = !value),
              ),
            ],
          ),
          CardComponents(
            content: 'Dialogs',
            components: [
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const Dialog(),
                ),
                child: const Text('Show Dialog'),
              ),
              TextButton(
                onPressed: () => showAboutDialog(context: context),
                child: const Text('Show About Dialog'),
              ),
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Alert'),
                    content: const Text('Alert Dialog'),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel')),
                      FilledButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Accept'))
                    ],
                  ),
                ),
                child: const Text('Show Alert Dialog'),
              ),
              TextButton(
                onPressed: () => showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      Scaffold(
                    appBar: AppBar(),
                  ),
                ),
                child: const Text('Show General Dialog'),
              ),
              TextButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Scaffold(
                      appBar: AppBar(),
                      body: const Text('Hello!'),
                    ),
                  ),
                ),
                child: const Text('Show Modal Bottom'),
              ),
            ],
          ),
          CardComponents(
            content: 'Pickers',
            components: [
              TextButton(
                onPressed: () => showDatePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                ),
                child: const Text('Show Date Picker'),
              ),
              TextButton(
                onPressed: () => showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                ),
                child: const Text('Show Date Range Picker'),
              ),
              TextButton(
                onPressed: () => showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ),
                child: const Text('Show Time Picker'),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
