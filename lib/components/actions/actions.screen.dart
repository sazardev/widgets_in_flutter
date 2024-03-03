import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/components/actions/widget.screen.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';

class ActionsScreen extends StatelessWidget {
  const ActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actions'),
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
            content: 'Filled buttons',
            components: [
              FilledButton(
                onPressed: () =>
                    Get.to((() => const WidgetScreen()), arguments: {
                  'code': '''FilledButton(
                onPressed: () {},
                child: const Text('Filled'),
              ),'''
                }),
                child: const Text('Filled'),
              ),
              InkWell(
                onTap: () {},
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
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
