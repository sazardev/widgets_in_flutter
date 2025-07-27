import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class ScrollingScreen extends StatefulWidget {
  const ScrollingScreen({super.key});

  @override
  State<ScrollingScreen> createState() => _ScrollingScreenState();
}

class _ScrollingScreenState extends State<ScrollingScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showFab = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showFab = _scrollController.offset > 100;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrolling & Slivers'),
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
            content: 'SingleChildScrollView',
            components: [
              SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      20,
                      (index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 30,
                          color: Colors.blue.shade100,
                          child: Center(child: Text('Item $index')),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Scrollbar',
            components: [
              SizedBox(
                height: 150,
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('Scrollable Item $index'),
                      leading: CircleAvatar(child: Text('$index')),
                    ),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Nested ScrollView',
            components: [
              SizedBox(
                height: 200,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      expandedHeight: 50,
                      floating: true,
                      pinned: true,
                      automaticallyImplyLeading: false,
                      flexibleSpace: const FlexibleSpaceBar(
                        title: Text('Nested Header'),
                      ),
                    ),
                  ],
                  body: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('Nested Item $index'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Custom ScrollView',
            components: [
              SizedBox(
                height: 200,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 60,
                      pinned: true,
                      automaticallyImplyLeading: false,
                      flexibleSpace: FlexibleSpaceBar(
                        title: const Text('Sliver AppBar'),
                        background: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple.shade300,
                                Colors.blue.shade300
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ListTile(
                          title: Text('Sliver List Item $index'),
                          leading: Icon(Icons.list),
                        ),
                        childCount: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Sliver Grid',
            components: [
              SizedBox(
                height: 200,
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Container(
                            decoration: BoxDecoration(
                              color: Colors.teal.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(child: Text('$index')),
                          ),
                          childCount: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Sliver to Box Adapter',
            components: [
              SizedBox(
                height: 200,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        height: 60,
                        color: Colors.orange.shade200,
                        child: const Center(
                          child: Text('Fixed Header Widget'),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Card(
                          child: ListTile(
                            title: Text('Card Item $index'),
                            subtitle: Text('Subtitle for item $index'),
                          ),
                        ),
                        childCount: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Refresh Indicator',
            components: [
              SizedBox(
                height: 150,
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 1));
                  },
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('Pull to refresh $index'),
                      leading: const Icon(Icons.refresh),
                    ),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Scroll Configuration',
            components: [
              SizedBox(
                height: 150,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    scrollbars: false,
                  ),
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) => Container(
                      height: 40,
                      margin: const EdgeInsets.all(2),
                      color: Colors.indigo.shade100,
                      child: Center(child: Text('No scrollbar $index')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Icon(Icons.keyboard_arrow_up),
            )
          : null,
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
