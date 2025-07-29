import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/code/code.screen.dart';
import 'package:widgets_in_flutter/components/actions/constant/filled-button.contants.dart';
import 'package:widgets_in_flutter/components/actions/constants/button_codes.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/favorites/favorite_button_new.dart';

class ActionsScreen extends StatelessWidget {
  const ActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actions'),
        actions: [
          FavoriteIconButton(
            widgetName: 'Actions',
            category: 'actions',
            route: '/components/actions/',
          ),
          ThemeMaterial(isLandscape: false),
          ThemeBrightness(isLandscape: false),
          ThemeSelector(isLandscape: false),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        children: [
          CardComponents(
            content: 'Filled buttons',
            components: [
              FilledButton(
                onPressed: () => Get.to((() => const CodeScreen()), arguments: {
                  'code': filledButtonSourceCode['FilledButton-Filled']!
                }),
                child: const Text('Filled'),
              ),
              InkWell(
                onTap: () => Get.to((() => const CodeScreen()), arguments: {
                  'code': filledButtonSourceCode['FilledButton-Disabled']!
                }),
                borderRadius: BorderRadius.circular(14),
                child: const FilledButton(
                  onPressed: null,
                  child: Text('Disabled'),
                ),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Icon'),
              ),
              FilledButton.tonal(
                onPressed: () {},
                child: const Text('Tonal'),
              ),
              FilledButton.tonalIcon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Tonal Icon'),
              ),
            ],
          ),
          // View Code button for Filled Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () => Get.to(() => const CodeScreen(), arguments: {
                'code': buttonSourceCodes['FilledButton-Filled']!,
                'title': 'FilledButton Code Examples'
              }),
              icon: const Icon(Icons.code),
              label: const Text('View All FilledButton Codes'),
            ),
          ),
          CardComponents(
            content: 'Outlined buttons',
            components: [
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined'),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(14),
                child: const OutlinedButton(
                  onPressed: null,
                  child: Text('Disabled'),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Icon'),
              ),
            ],
          ),
          // View Code button for Outlined Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () => Get.to(() => const CodeScreen(), arguments: {
                'code': buttonSourceCodes['OutlinedButton-Basic']!,
                'title': 'OutlinedButton Code Examples'
              }),
              icon: const Icon(Icons.code),
              label: const Text('View OutlinedButton Codes'),
            ),
          ),
          CardComponents(
            content: 'Elevated buttons',
            components: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated'),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(14),
                child: const ElevatedButton(
                  onPressed: null,
                  child: Text('Disabled'),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Icon'),
              ),
            ],
          ),
          // View Code button for Elevated Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () => Get.to(() => const CodeScreen(), arguments: {
                'code': buttonSourceCodes['ElevatedButton-Basic']!,
                'title': 'ElevatedButton Code Examples'
              }),
              icon: const Icon(Icons.code),
              label: const Text('View ElevatedButton Codes'),
            ),
          ),
          CardComponents(
            content: 'Text buttons',
            components: [
              TextButton(
                onPressed: () {},
                child: const Text('Text'),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(14),
                child: const TextButton(
                  onPressed: null,
                  child: Text('Disabled'),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Icon'),
              ),
            ],
          ),
          // View Code button for Text Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () => Get.to(() => const CodeScreen(), arguments: {
                'code': buttonSourceCodes['TextButton-Basic']!,
                'title': 'TextButton Code Examples'
              }),
              icon: const Icon(Icons.code),
              label: const Text('View TextButton Codes'),
            ),
          ),
          CardComponents(
            content: 'Icon buttons',
            components: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(14),
                child: const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add),
                ),
              ),
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          // View Code button for Icon Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () => Get.to(() => const CodeScreen(), arguments: {
                'code': buttonSourceCodes['IconButton-Basic']!,
                'title': 'IconButton Code Examples'
              }),
              icon: const Icon(Icons.code),
              label: const Text('View IconButton Codes'),
            ),
          ),
          CardComponents(
            content: 'Floating Action Buttons',
            components: [
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              FloatingActionButton.small(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              FloatingActionButton.large(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              FloatingActionButton.extended(
                onPressed: () {},
                label: const Text('Extended'),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          // View Code button for Floating Action Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () => Get.to(() => const CodeScreen(), arguments: {
                'code': buttonSourceCodes['FloatingActionButton-Basic']!,
                'title': 'FloatingActionButton Code Examples'
              }),
              icon: const Icon(Icons.code),
              label: const Text('View FAB Codes'),
            ),
          ),
          CardComponents(
            content: 'Dropdown Buttons',
            components: [
              DropdownButton<String>(
                value: 'Option 1',
                items: ['Option 1', 'Option 2', 'Option 3']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? newValue) {},
              ),
              DropdownButtonFormField<String>(
                value: 'Option 1',
                decoration: const InputDecoration(
                  labelText: 'Select Option',
                  border: OutlineInputBorder(),
                ),
                items: ['Option 1', 'Option 2', 'Option 3']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? newValue) {},
              ),
            ],
          ),
          CardComponents(
            content: 'Popup Menu Buttons',
            components: [
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (String value) {},
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'share',
                    child: ListTile(
                      leading: Icon(Icons.share),
                      title: Text('Share'),
                    ),
                  ),
                ],
              ),
              PopupMenuButton<String>(
                child: const FilledButton(
                  onPressed: null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Menu'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                onSelected: (String value) {},
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                      value: 'option1', child: Text('Option 1')),
                  const PopupMenuItem(
                      value: 'option2', child: Text('Option 2')),
                  const PopupMenuItem(
                      value: 'option3', child: Text('Option 3')),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Menu Anchor Buttons',
            components: [
              MenuAnchor(
                builder: (context, controller, child) {
                  return FilledButton(
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    child: const Text('Show Menu'),
                  );
                },
                menuChildren: [
                  MenuItemButton(
                    leadingIcon: const Icon(Icons.home),
                    child: const Text('Home'),
                    onPressed: () {},
                  ),
                  MenuItemButton(
                    leadingIcon: const Icon(Icons.settings),
                    child: const Text('Settings'),
                    onPressed: () {},
                  ),
                  MenuItemButton(
                    leadingIcon: const Icon(Icons.logout),
                    child: const Text('Logout'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
