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
      default:
        return Colors.grey;
    }
  }
}
