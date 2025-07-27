import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
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
            content: 'App Bars',
            components: [
              SizedBox(
                height: 200,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Basic AppBar'),
                    leading: const Icon(Icons.menu),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  body: const Center(
                    child: Text('AppBar Demo'),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('AppBar with Tabs'),
                    bottom: TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(icon: Icon(Icons.home), text: 'Home'),
                        Tab(icon: Icon(Icons.star), text: 'Favorites'),
                        Tab(icon: Icon(Icons.person), text: 'Profile'),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    controller: _tabController,
                    children: const [
                      Center(child: Text('Home Tab')),
                      Center(child: Text('Favorites Tab')),
                      Center(child: Text('Profile Tab')),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Bottom Navigation',
            components: [
              SizedBox(
                height: 100,
                child: BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: NavigationBar(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.explore),
                      label: 'Explore',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.commute),
                      label: 'Commute',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.bookmark_border),
                      selectedIcon: Icon(Icons.bookmark),
                      label: 'Saved',
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Tab Bars',
            components: [
              SizedBox(
                height: 150,
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      const TabBar(
                        isScrollable: true,
                        tabs: [
                          Tab(text: 'Tab 1'),
                          Tab(text: 'Tab 2'),
                          Tab(text: 'Tab 3'),
                          Tab(text: 'Tab 4'),
                        ],
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            Center(child: Text('Content 1')),
                            Center(child: Text('Content 2')),
                            Center(child: Text('Content 3')),
                            Center(child: Text('Content 4')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(icon: Icon(Icons.directions_car)),
                          Tab(icon: Icon(Icons.directions_transit)),
                          Tab(icon: Icon(Icons.directions_bike)),
                        ],
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            Center(child: Icon(Icons.directions_car, size: 50)),
                            Center(
                                child:
                                    Icon(Icons.directions_transit, size: 50)),
                            Center(
                                child: Icon(Icons.directions_bike, size: 50)),
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
            content: 'Drawers',
            components: [
              SizedBox(
                height: 200,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Drawer Demo'),
                  ),
                  drawer: Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        const DrawerHeader(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Text(
                            'Drawer Header',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.home),
                          title: const Text('Home'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text('Settings'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text('Logout'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  body: const Center(
                    child: Text('Swipe right or tap menu to open drawer'),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Page View',
            components: [
              SizedBox(
                height: 200,
                child: PageView(
                  children: [
                    Container(
                      color: Colors.red.shade100,
                      child: const Center(
                        child: Text(
                          'Page 1',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.green.shade100,
                      child: const Center(
                        child: Text(
                          'Page 2',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.blue.shade100,
                      child: const Center(
                        child: Text(
                          'Page 3',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Navigation Rail',
            components: [
              SizedBox(
                height: 200,
                child: Row(
                  children: [
                    NavigationRail(
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      labelType: NavigationRailLabelType.all,
                      destinations: const [
                        NavigationRailDestination(
                          icon: Icon(Icons.favorite_border),
                          selectedIcon: Icon(Icons.favorite),
                          label: Text('First'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.bookmark_border),
                          selectedIcon: Icon(Icons.bookmark),
                          label: Text('Second'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.star_border),
                          selectedIcon: Icon(Icons.star),
                          label: Text('Third'),
                        ),
                      ],
                    ),
                    const VerticalDivider(thickness: 1, width: 1),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Selected: $_selectedIndex',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
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
