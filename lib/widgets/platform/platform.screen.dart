import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class PlatformScreen extends StatefulWidget {
  const PlatformScreen({super.key});

  @override
  State<PlatformScreen> createState() => _PlatformScreenState();
}

class _PlatformScreenState extends State<PlatformScreen> {
  bool _switchValue = false;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedSegment = 'first';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Platform-Specific Widgets'),
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
            content: 'Platform Detection',
            components: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Current Platform: ${_getCurrentPlatform()}'),
                    Text('Is Mobile: ${_isMobile()}'),
                    Text('Is Desktop: ${_isDesktop()}'),
                    Text('Is Web: ${kIsWeb}'),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Adaptive Widgets',
            components: [
              const Text('Switch that adapts to platform:'),
              Row(
                children: [
                  const Text('Adaptive Switch: '),
                  Switch.adaptive(
                    value: _switchValue,
                    onChanged: (value) => setState(() => _switchValue = value),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Platform-specific buttons:'),
              Row(
                children: [
                  if (_isIOS()) ...[
                    CupertinoButton(
                      onPressed: () {},
                      child: const Text('iOS Button'),
                    ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Material Button'),
                    ),
                  ],
                  const SizedBox(width: 16),
                  _buildAdaptiveButton(),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino (iOS) Widgets',
            components: [
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                onPressed: () {},
                child: const Text('Cupertino Button'),
              ),
              const SizedBox(height: 16),
              CupertinoSegmentedControl<String>(
                children: const {
                  'first': Text('First'),
                  'second': Text('Second'),
                  'third': Text('Third'),
                },
                groupValue: _selectedSegment,
                onValueChanged: (value) {
                  setState(() => _selectedSegment = value);
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('iOS Switch: '),
                  CupertinoSwitch(
                    value: _switchValue,
                    onChanged: (value) => setState(() => _switchValue = value),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Date & Time Pickers',
            components: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _showMaterialDatePicker,
                    child: const Text('Material Date'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _showMaterialTimePicker,
                    child: const Text('Material Time'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_isIOS()) ...[
                Container(
                  height: 200,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: _selectedDate,
                    onDateTimeChanged: (DateTime value) {
                      setState(() => _selectedDate = value);
                    },
                  ),
                ),
              ],
            ],
          ),
          CardComponents(
            content: 'Cupertino Navigation',
            components: [
              Container(
                height: 300,
                child: CupertinoTabScaffold(
                  tabBar: CupertinoTabBar(
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.search),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.person),
                        label: 'Profile',
                      ),
                    ],
                  ),
                  tabBuilder: (context, index) {
                    return CupertinoTabView(
                      builder: (context) {
                        return Center(
                          child: Text('Tab $index Content'),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino Lists',
            components: [
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGroupedBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CupertinoListSection(
                  header: const Text('Settings'),
                  children: [
                    CupertinoListTile(
                      title: const Text('Notifications'),
                      trailing: CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) =>
                            setState(() => _switchValue = value),
                      ),
                    ),
                    const CupertinoListTile(
                      title: Text('Privacy'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    const CupertinoListTile(
                      title: Text('Account'),
                      trailing: CupertinoListTileChevron(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Platform-Specific Icons',
            components: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(_isIOS() ? CupertinoIcons.heart : Icons.favorite),
                      const Text('Heart'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(_isIOS() ? CupertinoIcons.share : Icons.share),
                      const Text('Share'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(_isIOS() ? CupertinoIcons.settings : Icons.settings),
                      const Text('Settings'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(_isIOS() ? CupertinoIcons.add : Icons.add),
                      const Text('Add'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Cupertino Dialogs',
            components: [
              Row(
                children: [
                  CupertinoButton(
                    onPressed: _showCupertinoDialog,
                    child: const Text('Cupertino Dialog'),
                  ),
                  const SizedBox(width: 16),
                  CupertinoButton(
                    onPressed: _showCupertinoActionSheet,
                    child: const Text('Action Sheet'),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Text Fields',
            components: [
              CupertinoTextField(
                placeholder: 'Cupertino TextField',
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemGrey4),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(12),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Material TextField',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }

  String _getCurrentPlatform() {
    if (kIsWeb) return 'Web';
    if (Platform.isAndroid) return 'Android';
    if (Platform.isIOS) return 'iOS';
    if (Platform.isWindows) return 'Windows';
    if (Platform.isMacOS) return 'macOS';
    if (Platform.isLinux) return 'Linux';
    return 'Unknown';
  }

  bool _isMobile() {
    if (kIsWeb) return false;
    return Platform.isAndroid || Platform.isIOS;
  }

  bool _isDesktop() {
    if (kIsWeb) return false;
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  bool _isIOS() {
    if (kIsWeb) return false;
    return Platform.isIOS;
  }

  Widget _buildAdaptiveButton() {
    if (_isIOS()) {
      return CupertinoButton.filled(
        onPressed: () {},
        child: const Text('Adaptive iOS'),
      );
    } else {
      return FilledButton(
        onPressed: () {},
        child: const Text('Adaptive Material'),
      );
    }
  }

  void _showMaterialDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      setState(() => _selectedDate = date);
    }
  }

  void _showMaterialTimePicker() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (time != null) {
      setState(() => _selectedTime = time);
    }
  }

  void _showCupertinoDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Cupertino Dialog'),
        content: const Text('This is a Cupertino-style dialog.'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
            isDefaultAction: true,
          ),
        ],
      ),
    );
  }

  void _showCupertinoActionSheet() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Action Sheet'),
        message: const Text('Choose an action'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('First Action'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Second Action'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            isDestructiveAction: true,
            child: const Text('Delete'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ),
    );
  }
}
