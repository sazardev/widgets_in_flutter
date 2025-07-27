import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class ListsScreen extends StatefulWidget {
  const ListsScreen({super.key});

  @override
  State<ListsScreen> createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {
  List<String> _items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists & Grids'),
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
            content: 'Basic ListView',
            components: [
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text('List Item ${index + 1}'),
                      subtitle: Text('Subtitle for item ${index + 1}'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'ListView with Separators',
            components: [
              Container(
                height: 200,
                child: ListView.separated(
                  itemCount: 8,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      title: Text('Separated Item ${index + 1}'),
                      subtitle: Text('This item has a divider below'),
                    );
                  },
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Horizontal ListView',
            components: [
              Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo,
                              size: 40,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 8),
                            Text('Card ${index + 1}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Basic GridView',
            components: [
              Container(
                height: 250,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors
                          .primaries[index % Colors.primaries.length].shade100,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.apps,
                              color: Colors
                                  .primaries[index % Colors.primaries.length],
                            ),
                            Text(
                              '${index + 1}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'GridView with Aspect Ratio',
            components: [
              Container(
                height: 200,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade300,
                            Colors.purple.shade300,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Grid ${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'GridView.count',
            components: [
              Container(
                height: 200,
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  children: List.generate(16, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.teal.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.teal),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade700,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Reorderable ListView',
            components: [
              Container(
                height: 250,
                child: ReorderableListView(
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      final String item = _items.removeAt(oldIndex);
                      _items.insert(newIndex, item);
                    });
                  },
                  children: _items.take(6).map((item) {
                    return ListTile(
                      key: ValueKey(item),
                      leading: const Icon(Icons.drag_handle),
                      title: Text(item),
                      subtitle: const Text('Drag to reorder'),
                      trailing: const Icon(Icons.more_vert),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'ListView with Different Tile Types',
            components: [
              Container(
                height: 250,
                child: ListView(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Standard ListTile'),
                      subtitle: Text('This is a standard list tile'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    CheckboxListTile(
                      value: true,
                      onChanged: (value) {},
                      title: const Text('Checkbox List Tile'),
                      subtitle: const Text('This includes a checkbox'),
                    ),
                    SwitchListTile(
                      value: false,
                      onChanged: (value) {},
                      title: const Text('Switch List Tile'),
                      subtitle: const Text('This includes a switch'),
                    ),
                    RadioListTile<String>(
                      value: 'option1',
                      groupValue: 'option1',
                      onChanged: (value) {},
                      title: const Text('Radio List Tile'),
                      subtitle: const Text('This includes a radio button'),
                    ),
                    ExpansionTile(
                      leading: const Icon(Icons.expand_more),
                      title: const Text('Expansion Tile'),
                      subtitle: const Text('Tap to expand'),
                      children: const [
                        ListTile(
                          title: Text('Expanded Item 1'),
                          leading: Icon(Icons.star),
                        ),
                        ListTile(
                          title: Text('Expanded Item 2'),
                          leading: Icon(Icons.favorite),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Staggered Grid (Custom)',
            components: [
              Container(
                height: 250,
                child: GridView.custom(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final heights = [80.0, 120.0, 100.0, 140.0, 90.0, 110.0];
                      return Container(
                        height: heights[index % heights.length],
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.orange),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.widgets,
                                color: Colors.orange.shade700,
                              ),
                              Text(
                                'Custom ${index + 1}',
                                style: TextStyle(
                                  color: Colors.orange.shade700,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: 6,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
