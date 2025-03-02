import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme.controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          FadeInUp(
            child: _buildSettingsSection(
              context,
              'Appearance',
              [
                Obx(() => SwitchListTile(
                      title: const Text('Dark Theme'),
                      subtitle: const Text('Enable dark mode'),
                      value: themeController.isDarkTheme.value,
                      onChanged: (_) => themeController.changeTheme(),
                    )),
                Obx(() => SwitchListTile(
                      title: const Text('Material 3'),
                      subtitle: const Text('Use Material Design 3'),
                      value: themeController.isMaterial3.value,
                      onChanged: (_) => themeController.changeMaterialVersion(),
                    )),
                ListTile(
                  title: const Text('Theme Color'),
                  subtitle: const Text('Select primary color'),
                  trailing: Obx(() => CircleAvatar(
                        backgroundColor: themeController.primaryColor.value,
                        radius: 16,
                      )),
                  onTap: () => _showColorPicker(context, themeController),
                ),
              ],
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: _buildSettingsSection(
              context,
              'About',
              [
                ListTile(
                  title: const Text('Version'),
                  subtitle: const Text('0.1.0'),
                  trailing: const Icon(Icons.info_outline),
                ),
                ListTile(
                  title: const Text('Source Code'),
                  subtitle: const Text('View on GitHub'),
                  trailing: const Icon(Icons.code),
                  onTap: () {
                    // Add URL launcher to open GitHub repo
                  },
                ),
                ListTile(
                  title: const Text('Flutter Documentation'),
                  subtitle: const Text('View official docs'),
                  trailing: const Icon(Icons.open_in_new),
                  onTap: () {
                    // Add URL launcher to open Flutter docs
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }

  Widget _buildSettingsSection(
      BuildContext context, String title, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Divider(),
          ...children,
        ],
      ),
    );
  }

  void _showColorPicker(BuildContext context, ThemeController controller) {
    final Map<Color, String> colorList = {
      Colors.blue: 'Blue',
      Colors.red: 'Red',
      Colors.green: 'Green',
      Colors.orange: 'Orange',
      Colors.purple: 'Purple',
      Colors.brown: 'Brown',
      Colors.grey: 'Grey',
      Colors.teal: 'Teal',
      Colors.cyan: 'Cyan',
      Colors.indigo: 'Indigo',
    };

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Theme Color',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: colorList.entries.map((entry) {
                return InkWell(
                  onTap: () {
                    controller.changePrimaryColor(entry.key);
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: entry.key,
                          radius: 25,
                          child: controller.primaryColor.value == entry.key
                              ? const Icon(Icons.check, color: Colors.white)
                              : null,
                        ),
                        const SizedBox(height: 4),
                        Text(entry.value),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
