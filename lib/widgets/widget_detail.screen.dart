import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:widgets_in_flutter/code/code.screen.dart';

class WidgetDetailScreen extends StatelessWidget {
  const WidgetDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments;
    final String title = arguments['title'] ?? 'Widget Details';
    final String description =
        arguments['description'] ?? 'No description available';
    final String code = arguments['code'] ?? '';
    final Widget example = arguments['example'] ?? const SizedBox();
    final List<Map<String, dynamic>> properties = arguments['properties'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.code),
            onPressed: () => Get.to(() => const CodeScreen(),
                arguments: {'code': code, 'title': '$title Code'}),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FadeInDown(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 16),
          FadeInDown(
            delay: const Duration(milliseconds: 100),
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 24),
          FadeInDown(
            delay: const Duration(milliseconds: 200),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Example',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Divider(),
                    Center(child: example),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          if (properties.isNotEmpty) ...[
            FadeInDown(
              delay: const Duration(milliseconds: 300),
              child: Text(
                'Properties',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 8),
            ...properties.asMap().entries.map((entry) {
              final index = entry.key;
              final property = entry.value;
              return FadeInDown(
                delay: Duration(milliseconds: 400 + (index * 100)),
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(property['name'] ?? ''),
                    subtitle: Text(property['description'] ?? ''),
                    trailing: property['type'] != null
                        ? Chip(label: Text(property['type']))
                        : null,
                  ),
                ),
              );
            }).toList(),
          ],
        ],
      ),
    );
  }
}
