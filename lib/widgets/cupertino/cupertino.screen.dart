import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class CupertinoScreen extends StatefulWidget {
  const CupertinoScreen({super.key});

  @override
  State<CupertinoScreen> createState() => _CupertinoScreenState();
}

class _CupertinoScreenState extends State<CupertinoScreen> {
  bool _switchValue = false;
  double _sliderValue = 0.5;
  DateTime _selectedDate = DateTime.now();
  String _selectedSegment = 'first';
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupertino (iOS) Widgets'),
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
            content: 'Cupertino Buttons',
            components: [
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                onPressed: () {},
                child: const Text('Filled Button'),
              ),
              CupertinoButton(
                onPressed: () {},
                child: const Text('Text Button'),
              ),
              CupertinoButton.filled(
                onPressed: () {},
                child: const Text('Filled Button'),
              ),
              CupertinoButton(
                color: CupertinoColors.destructiveRed,
                onPressed: () {},
                child: const Text('Destructive'),
              ),
              CupertinoButton(
                onPressed: () {},
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(CupertinoIcons.add, color: CupertinoColors.activeBlue),
                    SizedBox(width: 8),
                    Text('Add Item'),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino Form Controls',
            components: [
              Row(
                children: [
                  const Text('Switch: '),
                  CupertinoSwitch(
                    value: _switchValue,
                    onChanged: (value) => setState(() => _switchValue = value),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Slider: ${_sliderValue.toStringAsFixed(2)}'),
                  CupertinoSlider(
                    value: _sliderValue,
                    onChanged: (value) => setState(() => _sliderValue = value),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const CupertinoTextField(
                placeholder: 'Cupertino TextField',
                padding: EdgeInsets.all(12),
              ),
              const SizedBox(height: 16),
              CupertinoTextField(
                prefix: const Icon(CupertinoIcons.search),
                placeholder: 'Search',
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino Segmented Control',
            components: [
              CupertinoSegmentedControl<String>(
                children: const {
                  'first': Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('First'),
                  ),
                  'second': Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Second'),
                  ),
                  'third': Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Third'),
                  ),
                },
                groupValue: _selectedSegment,
                onValueChanged: (value) {
                  setState(() => _selectedSegment = value);
                },
              ),
              const SizedBox(height: 16),
              CupertinoSlidingSegmentedControl<int>(
                children: const {
                  0: Text('One'),
                  1: Text('Two'),
                  2: Text('Three'),
                },
                groupValue: _tabIndex,
                onValueChanged: (value) {
                  setState(() => _tabIndex = value ?? 0);
                },
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino Activity Indicator',
            components: [
              const CupertinoActivityIndicator(),
              const SizedBox(width: 16),
              const CupertinoActivityIndicator(
                radius: 20,
                color: CupertinoColors.activeBlue,
              ),
              const SizedBox(width: 16),
              Column(
                children: const [
                  CupertinoActivityIndicator(),
                  SizedBox(height: 8),
                  Text('Loading...'),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino Alert Dialog',
            components: [
              CupertinoButton(
                onPressed: _showCupertinoAlert,
                child: const Text('Show Alert'),
              ),
              CupertinoButton(
                onPressed: _showCupertinoActionSheet,
                child: const Text('Action Sheet'),
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino Date Picker',
            components: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _selectedDate,
                  onDateTimeChanged: (DateTime value) {
                    setState(() => _selectedDate = value);
                  },
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino Timer Picker',
            components: [
              SizedBox(
                height: 200,
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hms,
                  initialTimerDuration: const Duration(hours: 1, minutes: 30),
                  onTimerDurationChanged: (Duration value) {
                    // Handle timer duration change
                  },
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino Picker',
            components: [
              SizedBox(
                height: 200,
                child: CupertinoPicker(
                  itemExtent: 32,
                  onSelectedItemChanged: (int value) {
                    // Handle selection
                  },
                  children: List.generate(10, (index) {
                    return Center(child: Text('Item $index'));
                  }),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino List Section',
            components: [
              CupertinoListSection(
                header: const Text('SETTINGS'),
                children: [
                  CupertinoListTile(
                    title: const Text('Wi-Fi'),
                    leading: const Icon(CupertinoIcons.wifi),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {},
                  ),
                  CupertinoListTile(
                    title: const Text('Bluetooth'),
                    leading: const Icon(CupertinoIcons.bluetooth),
                    trailing: CupertinoSwitch(
                      value: _switchValue,
                      onChanged: (value) =>
                          setState(() => _switchValue = value),
                    ),
                  ),
                  CupertinoListTile(
                    title: const Text('Cellular'),
                    leading: const Icon(
                        CupertinoIcons.antenna_radiowaves_left_right),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino Context Menu',
            components: [
              CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    child: const Text('Copy'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoContextMenuAction(
                    child: const Text('Share'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoContextMenuAction(
                    isDestructiveAction: true,
                    child: const Text('Delete'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Long press for context menu'),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino Search Text Field',
            components: [
              CupertinoSearchTextField(
                placeholder: 'Search',
                onChanged: (value) {
                  // Handle search
                },
              ),
              const SizedBox(height: 16),
              CupertinoSearchTextField(
                placeholder: 'Search with custom style',
                decoration: BoxDecoration(
                  color: CupertinoColors.tertiarySystemFill,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino Icons',
            components: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: const [
                  Icon(CupertinoIcons.home, size: 32),
                  Icon(CupertinoIcons.heart,
                      size: 32, color: CupertinoColors.systemRed),
                  Icon(CupertinoIcons.star,
                      size: 32, color: CupertinoColors.systemYellow),
                  Icon(CupertinoIcons.person,
                      size: 32, color: CupertinoColors.systemBlue),
                  Icon(CupertinoIcons.settings,
                      size: 32, color: CupertinoColors.systemGrey),
                  Icon(CupertinoIcons.search,
                      size: 32, color: CupertinoColors.systemGreen),
                  Icon(CupertinoIcons.add,
                      size: 32, color: CupertinoColors.systemPurple),
                  Icon(CupertinoIcons.delete,
                      size: 32, color: CupertinoColors.destructiveRed),
                  Icon(CupertinoIcons.share,
                      size: 32, color: CupertinoColors.activeOrange),
                  Icon(CupertinoIcons.camera,
                      size: 32, color: CupertinoColors.systemIndigo),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }

  void _showCupertinoAlert() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('This is a Cupertino alert dialog.'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _showCupertinoActionSheet() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Actions'),
        message: const Text('Choose an action'),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Save'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoActionSheetAction(
            child: const Text('Share'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            child: const Text('Delete'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
