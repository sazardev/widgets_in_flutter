import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:widgets_in_flutter/controllers/search.controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetSearchController searchController = Get.put(GetSearchController());

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search widgets...',
            border: InputBorder.none,
            hintStyle: TextStyle(
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
          ),
          onChanged: searchController.search,
        ),
      ),
      body: Obx(() {
        if (searchController.searchQuery.value.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                ),
                const SizedBox(height: 16),
                Text(
                  'Start typing to search widgets',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                      ),
                ),
              ],
            ),
          );
        }

        if (searchController.filteredWidgets.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_off,
                  size: 80,
                  color: Theme.of(context).colorScheme.error.withOpacity(0.3),
                ),
                const SizedBox(height: 16),
                Text(
                  'No widgets found for "${searchController.searchQuery.value}"',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                      ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: searchController.filteredWidgets.length,
          itemBuilder: (context, index) {
            final widget = searchController.filteredWidgets[index];
            return FadeInUp(
              delay: Duration(milliseconds: index * 50),
              duration: const Duration(milliseconds: 300),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _getCategoryColor(widget['category']),
                  child: Text(
                    widget['name'][0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(widget['name']),
                subtitle: Text(
                    'Category: ${widget['category'].toString().capitalize}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Get.toNamed(widget['route']),
              ),
            );
          },
        );
      }),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'actions':
        return Colors.blue;
      case 'selections':
        return Colors.green;
      case 'inputs':
        return Colors.orange;
      case 'navigation':
        return Colors.purple;
      case 'text':
        return Colors.indigo;
      case 'images':
        return Colors.pink;
      case 'layout':
        return Colors.teal;
      case 'lists':
        return Colors.cyan;
      case 'animations':
        return Colors.deepPurple;
      case 'forms':
        return Colors.amber;
      case 'material':
        return Colors.lightBlue;
      case 'gestures':
        return Colors.red;
      case 'scrolling':
        return Colors.lime;
      case 'media':
        return Colors.brown;
      case 'platform':
        return Colors.grey;
      case 'sensors':
        return Colors.deepOrange;
      case 'accessibility':
        return Colors.lightGreen;
      case 'performance':
        return Colors.yellow;
      case 'advanced_animations':
        return Colors.purple;
      case 'paint':
        return Colors.blueGrey;
      case 'state':
        return Colors.indigo;
      case 'cupertino':
        return Colors.grey;
      case 'slivers':
        return Colors.deepPurple;
      case 'dialogs_overlays':
        return Colors.cyan;
      case 'effects_filters':
        return Colors.pink;
      case 'testing_debug':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
