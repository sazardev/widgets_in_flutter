Map<String, String> navigationSourceCodes = {
  // AppBar codes
  'AppBar-Basic': '''
AppBar(
  title: const Text('Basic AppBar'),
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
)''',

  'AppBar-WithActions': '''
AppBar(
  title: const Text('AppBar with Actions'),
  actions: [
    IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        print('Search pressed');
      },
    ),
    IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {
        print('More pressed');
      },
    ),
  ],
)''',

  'AppBar-WithLeading': '''
AppBar(
  leading: IconButton(
    icon: const Icon(Icons.menu),
    onPressed: () {
      print('Menu pressed');
    },
  ),
  title: const Text('AppBar with Leading'),
  actions: [
    IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        print('Settings pressed');
      },
    ),
  ],
)''',

  // TabBar codes
  'TabBar-Basic': '''
// In your StatefulWidget with DefaultTabController:
DefaultTabController(
  length: 3,
  child: Scaffold(
    appBar: AppBar(
      title: const Text('TabBar Example'),
      bottom: const TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home), text: 'Home'),
          Tab(icon: Icon(Icons.star), text: 'Favorites'),
          Tab(icon: Icon(Icons.person), text: 'Profile'),
        ],
      ),
    ),
    body: const TabBarView(
      children: [
        Center(child: Text('Home Tab')),
        Center(child: Text('Favorites Tab')),
        Center(child: Text('Profile Tab')),
      ],
    ),
  ),
)''',

  'TabBar-Custom': '''
// In your StatefulWidget with TabController:
class _MyWidgetState extends State<MyWidget> with TickerProviderStateMixin {
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
        title: const Text('Custom TabBar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Content 1')),
          Center(child: Text('Content 2')),
          Center(child: Text('Content 3')),
        ],
      ),
    );
  }
}''',

  // Drawer codes
  'Drawer-Basic': '''
Drawer(
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
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ],
  ),
)''',

  'EndDrawer-Basic': '''
// In Scaffold:
Scaffold(
  appBar: AppBar(
    title: const Text('End Drawer Example'),
  ),
  endDrawer: Drawer(
    child: ListView(
      children: [
        const DrawerHeader(
          child: Text('End Drawer'),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  ),
  body: const Center(
    child: Text('Swipe from right to open end drawer'),
  ),
)''',

  // BottomNavigationBar codes
  'BottomNavigationBar-Basic': '''
// In your StatefulWidget:
int _selectedIndex = 0;

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

Scaffold(
  body: const Center(
    child: Text('Bottom Navigation Bar'),
  ),
  bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'School',
      ),
    ],
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.amber[800],
    onTap: _onItemTapped,
  ),
)''',

  'NavigationBar-Basic': '''
// In your StatefulWidget:
int currentPageIndex = 0;

Scaffold(
  bottomNavigationBar: NavigationBar(
    onDestinationSelected: (int index) {
      setState(() {
        currentPageIndex = index;
      });
    },
    indicatorColor: Colors.amber,
    selectedIndex: currentPageIndex,
    destinations: const <Widget>[
      NavigationDestination(
        selectedIcon: Icon(Icons.home),
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      NavigationDestination(
        icon: Badge(child: Icon(Icons.notifications_sharp)),
        label: 'Notifications',
      ),
      NavigationDestination(
        icon: Badge(
          label: Text('2'),
          child: Icon(Icons.messenger_sharp),
        ),
        label: 'Messages',
      ),
    ],
  ),
  body: <Widget>[
    const Center(child: Text('Home page')),
    const Center(child: Text('Notifications page')),
    const Center(child: Text('Messages page')),
  ][currentPageIndex],
)''',

  // NavigationRail codes
  'NavigationRail-Basic': '''
// In your StatefulWidget:
int _selectedIndex = 0;

Row(
  children: <Widget>[
    NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      labelType: NavigationRailLabelType.selected,
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.favorite),
          label: Text('Favorites'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.bookmark_border),
          selectedIcon: Icon(Icons.bookmark),
          label: Text('Bookmarks'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.star_border),
          selectedIcon: Icon(Icons.star),
          label: Text('Starred'),
        ),
      ],
    ),
    const VerticalDivider(thickness: 1, width: 1),
    Expanded(
      child: Center(
        child: Text('selectedIndex: \$_selectedIndex'),
      ),
    ),
  ],
)''',

  // Breadcrumb codes
  'Breadcrumb-Custom': '''
class Breadcrumb extends StatelessWidget {
  final List<String> items;
  final Function(int)? onTap;

  const Breadcrumb({
    Key? key,
    required this.items,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.asMap().entries.map((entry) {
        int index = entry.key;
        String item = entry.value;
        bool isLast = index == items.length - 1;
        
        return Row(
          children: [
            GestureDetector(
              onTap: () => onTap?.call(index),
              child: Text(
                item,
                style: TextStyle(
                  color: isLast ? Colors.black : Colors.blue,
                  decoration: isLast ? null : TextDecoration.underline,
                ),
              ),
            ),
            if (!isLast) ...[
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, size: 16),
              const SizedBox(width: 8),
            ],
          ],
        );
      }).toList(),
    );
  }
}

// Usage:
Breadcrumb(
  items: ['Home', 'Products', 'Electronics', 'Phones'],
  onTap: (index) {
    print('Breadcrumb tapped at index: \$index');
  },
)''',

  // PageView codes
  'PageView-Basic': '''
PageView(
  children: <Widget>[
    Container(
      color: Colors.red,
      child: const Center(
        child: Text('Page 1', style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    ),
    Container(
      color: Colors.green,
      child: const Center(
        child: Text('Page 2', style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    ),
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Page 3', style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    ),
  ],
)''',

  'PageView-WithController': '''
// In your StatefulWidget:
final PageController _pageController = PageController();
int _currentPage = 0;

@override
void dispose() {
  _pageController.dispose();
  super.dispose();
}

Column(
  children: [
    Expanded(
      child: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          Container(
            color: Colors.red,
            child: const Center(child: Text('Page 1')),
          ),
          Container(
            color: Colors.green,
            child: const Center(child: Text('Page 2')),
          ),
          Container(
            color: Colors.blue,
            child: const Center(child: Text('Page 3')),
          ),
        ],
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.all(4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blue : Colors.grey,
          ),
        );
      }),
    ),
  ],
)''',
};
