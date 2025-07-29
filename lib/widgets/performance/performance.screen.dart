import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({super.key});

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  final List<String> _items = List.generate(100, (index) => 'Item $index');
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance & Optimization'),
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
            content: 'ListView.builder vs ListView',
            components: [
              const Text('ListView.builder for large lists:'),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_items[index]),
                      leading: CircleAvatar(child: Text('${index + 1}')),
                    );
                  },
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'RepaintBoundary',
            components: [
              const Text('Isolate expensive widgets:'),
              Row(
                children: [
                  RepaintBoundary(
                    child: ExpensiveWidget(counter: _counter),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => setState(() => _counter++),
                    child: const Text('Update Counter'),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'AutomaticKeepAliveClientMixin',
            components: [
              const Text('Keep tabs alive:'),
              SizedBox(
                height: 200,
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(text: 'Tab 1'),
                          Tab(text: 'Tab 2'),
                          Tab(text: 'Tab 3'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            KeepAliveTab(title: 'Tab 1 Content'),
                            KeepAliveTab(title: 'Tab 2 Content'),
                            KeepAliveTab(title: 'Tab 3 Content'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'const Constructors',
            components: [
              const Text('Use const widgets for better performance:'),
              const ConstWidget(),
              const SizedBox(height: 8),
              NonConstWidget(),
            ],
          ),
          CardComponents(
            content: 'ValueListenableBuilder',
            components: [
              const Text('Efficient state management:'),
              ValueListenableExample(),
            ],
          ),
          CardComponents(
            content: 'Sliver Performance',
            components: [
              const Text('Efficient scrolling with Slivers:'),
              SizedBox(
                height: 300,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 60,
                      pinned: true,
                      title: const Text('Sliver Performance'),
                    ),
                    SliverList.builder(
                      itemCount: 50,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Sliver Item $index'),
                          subtitle: const Text('Built only when visible'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Future & Stream Builders',
            components: [
              const Text('Async widget building:'),
              FutureBuilder<String>(
                future: _simulateNetworkCall(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return Text('Result: ${snapshot.data}');
                },
              ),
              const SizedBox(height: 16),
              StreamBuilder<int>(
                stream: _countStream(),
                builder: (context, snapshot) {
                  return Text('Stream value: ${snapshot.data ?? 0}');
                },
              ),
            ],
          ),
          CardComponents(
            content: 'Image Optimization',
            components: [
              const Text('Cached and optimized images:'),
              Image.asset(
                'assets/icon.png',
                width: 50,
                height: 50,
                cacheWidth: 50,
                cacheHeight: 50,
              ),
              const SizedBox(width: 16),
              const FadeInImage(
                placeholder: AssetImage('assets/icon.png'),
                image: AssetImage('assets/icon.png'),
                width: 50,
                height: 50,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }

  Future<String> _simulateNetworkCall() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Network data loaded';
  }

  Stream<int> _countStream() {
    return Stream.periodic(
      const Duration(seconds: 1),
      (count) => count,
    ).take(10);
  }
}

class ExpensiveWidget extends StatelessWidget {
  final int counter;

  const ExpensiveWidget({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Text('Expensive Widget'),
          Text('Counter: $counter'),
          // Simulate expensive operation
          ...List.generate(
            10,
            (index) => Container(
              width: 20,
              height: 2,
              color: Colors.blue,
              margin: const EdgeInsets.symmetric(vertical: 1),
            ),
          ),
        ],
      ),
    );
  }
}

class KeepAliveTab extends StatefulWidget {
  final String title;

  const KeepAliveTab({super.key, required this.title});

  @override
  State<KeepAliveTab> createState() => _KeepAliveTabState();
}

class _KeepAliveTabState extends State<KeepAliveTab>
    with AutomaticKeepAliveClientMixin {
  int _localCounter = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.title),
          Text('Local counter: $_localCounter'),
          ElevatedButton(
            onPressed: () => setState(() => _localCounter++),
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}

class ConstWidget extends StatelessWidget {
  const ConstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text('const Widget - Won\'t rebuild'),
    );
  }
}

class NonConstWidget extends StatelessWidget {
  const NonConstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text('Non-const Widget - Will rebuild'),
    );
  }
}

class ValueListenableExample extends StatefulWidget {
  const ValueListenableExample({super.key});

  @override
  State<ValueListenableExample> createState() => _ValueListenableExampleState();
}

class _ValueListenableExampleState extends State<ValueListenableExample> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: _counter,
          builder: (context, value, child) {
            return Text('Counter: $value');
          },
        ),
        ElevatedButton(
          onPressed: () => _counter.value++,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
