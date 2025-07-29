import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/code/code.screen.dart';
import 'package:widgets_in_flutter/favorites/favorite_button_new.dart';
import 'package:widgets_in_flutter/components/slivers/constants/sliver_codes.dart';

class SliversScreen extends StatefulWidget {
  const SliversScreen({super.key});

  @override
  State<SliversScreen> createState() => _SliversScreenState();
}

class _SliversScreenState extends State<SliversScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isPinned = true;
  bool _isFloating = true;
  double _expandedHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slivers & Advanced Scrolling'),
        actions: [
          FavoriteIconButton(
            widgetName: 'Slivers',
            category: 'slivers',
            route: '/components/slivers/',
          ),
          ThemeMaterial(isLandscape: false),
          ThemeBrightness(isLandscape: false),
          ThemeSelector(isLandscape: false),
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CardComponents(
                  content: 'SliverAppBar',
                  components: [
                    Container(
                      height: 400,
                      child: CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            title: const Text('SliverAppBar Demo'),
                            pinned: _isPinned,
                            floating: _isFloating,
                            expandedHeight: _expandedHeight,
                            flexibleSpace: FlexibleSpaceBar(
                              title: const Text('Flexible Space'),
                              background: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.blue.shade300,
                                      Colors.purple.shade300,
                                    ],
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(Icons.layers,
                                      size: 64, color: Colors.white),
                                ),
                              ),
                            ),
                            actions: [
                              IconButton(
                                icon: const Icon(Icons.code),
                                onPressed: () => Get
                                    .to(() => const CodeScreen(), arguments: {
                                  'code':
                                      sliverSourceCodes['SliverAppBar-Basic'],
                                  'title': 'SliverAppBar Code'
                                }),
                              ),
                            ],
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => ListTile(
                                title: Text('Item $index'),
                                leading: CircleAvatar(child: Text('$index')),
                              ),
                              childCount: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      children: [
                        FilterChip(
                          label: const Text('Pinned'),
                          selected: _isPinned,
                          onSelected: (value) =>
                              setState(() => _isPinned = value),
                        ),
                        FilterChip(
                          label: const Text('Floating'),
                          selected: _isFloating,
                          onSelected: (value) =>
                              setState(() => _isFloating = value),
                        ),
                      ],
                    ),
                  ],
                ),
                CardComponents(
                  content: 'SliverGrid',
                  components: [
                    Container(
                      height: 300,
                      child: CustomScrollView(
                        slivers: [
                          SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 1,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Container(
                                  alignment: Alignment.center,
                                  color: Colors.teal[100 * (index % 9)],
                                  child: Text('Grid Item $index'),
                                );
                              },
                              childCount: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => Get.to(() => const CodeScreen(),
                          arguments: {
                            'code': sliverSourceCodes['SliverGrid-Basic'],
                            'title': 'SliverGrid Code'
                          }),
                      icon: const Icon(Icons.code),
                      label: const Text('View Code'),
                    ),
                  ],
                ),
                CardComponents(
                  content: 'SliverList',
                  components: [
                    Container(
                      height: 300,
                      child: CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Card(
                                  margin: const EdgeInsets.all(8),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: Text('${index + 1}'),
                                    ),
                                    title: Text('List Item ${index + 1}'),
                                    subtitle: Text(
                                        'This is item number ${index + 1}'),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                  ),
                                );
                              },
                              childCount: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => Get.to(() => const CodeScreen(),
                          arguments: {
                            'code': sliverSourceCodes['SliverList-Basic'],
                            'title': 'SliverList Code'
                          }),
                      icon: const Icon(Icons.code),
                      label: const Text('View Code'),
                    ),
                  ],
                ),
                CardComponents(
                  content: 'SliverPersistentHeader',
                  components: [
                    Container(
                      height: 400,
                      child: CustomScrollView(
                        slivers: [
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: _SliverHeaderDelegate(
                              minHeight: 60,
                              maxHeight: 100,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Persistent Header',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => Card(
                                child: ListTile(
                                  title: Text('Content Item $index'),
                                  leading:
                                      Icon(Icons.star, color: Colors.amber),
                                ),
                              ),
                              childCount: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () =>
                          Get.to(() => const CodeScreen(), arguments: {
                        'code':
                            sliverSourceCodes['SliverPersistentHeader-Basic'],
                        'title': 'SliverPersistentHeader Code'
                      }),
                      icon: const Icon(Icons.code),
                      label: const Text('View Code'),
                    ),
                  ],
                ),
                CardComponents(
                  content: 'NestedScrollView',
                  components: [
                    Container(
                      height: 400,
                      child: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverAppBar(
                              expandedHeight: 120.0,
                              floating: false,
                              pinned: true,
                              flexibleSpace: FlexibleSpaceBar(
                                centerTitle: true,
                                title: const Text("NestedScrollView"),
                                background: Container(
                                  color: Colors.deepPurple.shade100,
                                  child: const Center(
                                    child: Icon(Icons.view_list, size: 50),
                                  ),
                                ),
                              ),
                            ),
                          ];
                        },
                        body: ListView.builder(
                          itemCount: 15,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                title: Text('Nested Item $index'),
                                leading:
                                    Icon(Icons.folder, color: Colors.orange),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () =>
                          Get.to(() => const CodeScreen(), arguments: {
                        'code': sliverSourceCodes['NestedScrollView-Basic'],
                        'title': 'NestedScrollView Code'
                      }),
                      icon: const Icon(Icons.code),
                      label: const Text('View Code'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

// Source codes for each component
const String sliverAppBarCode = '''
CustomScrollView(
  slivers: [
    SliverAppBar(
      title: const Text('SliverAppBar Demo'),
      pinned: true,
      floating: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('Flexible Space'),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade300,
                Colors.purple.shade300,
              ],
            ),
          ),
          child: const Center(
            child: Icon(Icons.layers, size: 64, color: Colors.white),
          ),
        ),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          title: Text('Item \$index'),
          leading: CircleAvatar(child: Text('\$index')),
        ),
        childCount: 20,
      ),
    ),
  ],
)''';

const String sliverGridCode = '''
CustomScrollView(
  slivers: [
    SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 9)],
            child: Text('Grid Item \$index'),
          );
        },
        childCount: 20,
      ),
    ),
  ],
)''';

const String sliverListCode = '''
CustomScrollView(
  slivers: [
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('\${index + 1}'),
              ),
              title: Text('List Item \${index + 1}'),
              subtitle: Text('This is item number \${index + 1}'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
        childCount: 15,
      ),
    ),
  ],
)''';

const String sliverPersistentHeaderCode = '''
class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

// Usage:
CustomScrollView(
  slivers: [
    SliverPersistentHeader(
      pinned: true,
      delegate: _SliverHeaderDelegate(
        minHeight: 60,
        maxHeight: 100,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Persistent Header',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    ),
  ],
)''';

const String nestedScrollViewCode = '''
NestedScrollView(
  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        expandedHeight: 120.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: const Text("NestedScrollView"),
          background: Container(
            color: Colors.deepPurple.shade100,
            child: const Center(
              child: Icon(Icons.view_list, size: 50),
            ),
          ),
        ),
      ),
    ];
  },
  body: ListView.builder(
    itemCount: 15,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: ListTile(
          title: Text('Nested Item \$index'),
          leading: Icon(Icons.folder, color: Colors.orange),
        ),
      );
    },
  ),
)''';
