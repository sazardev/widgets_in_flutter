Map<String, String> sliverSourceCodes = {
  // SliverAppBar codes
  'SliverAppBar-Basic': '''
CustomScrollView(
  slivers: [
    SliverAppBar(
      title: Text('SliverAppBar'),
      floating: true,
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Flexible Space'),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
            ),
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
        childCount: 50,
      ),
    ),
  ],
)''',

  'SliverAppBar-Custom': '''
CustomScrollView(
  slivers: [
    SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: 300,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Custom SliverAppBar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://picsum.photos/400/300',
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        ),
      ],
    ),
    SliverToBoxAdapter(
      child: Container(
        height: 100,
        color: Colors.blue[50],
        child: Center(
          child: Text('Content below AppBar'),
        ),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            title: Text('Card Item \$index'),
            subtitle: Text('Subtitle for item \$index'),
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('\$index'),
            ),
          ),
        ),
        childCount: 20,
      ),
    ),
  ],
)''',

  // SliverList codes
  'SliverList-Basic': '''
CustomScrollView(
  slivers: [
    SliverAppBar(
      title: Text('SliverList Example'),
      pinned: true,
    ),
    SliverList(
      delegate: SliverChildListDelegate([
        Container(
          height: 80,
          color: Colors.red[100],
          child: Center(child: Text('Fixed Item 1')),
        ),
        Container(
          height: 80,
          color: Colors.green[100],
          child: Center(child: Text('Fixed Item 2')),
        ),
        Container(
          height: 80,
          color: Colors.blue[100],
          child: Center(child: Text('Fixed Item 3')),
        ),
      ]),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          height: 60,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text('Dynamic Item \$index'),
          ),
        ),
        childCount: 20,
      ),
    ),
  ],
)''',

  // SliverGrid codes
  'SliverGrid-Basic': '''
CustomScrollView(
  slivers: [
    SliverAppBar(
      title: Text('SliverGrid Example'),
      pinned: true,
    ),
    SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.teal[100 * (index % 9)],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.grid_view, size: 40),
                SizedBox(height: 8),
                Text('Grid \$index'),
              ],
            ),
          ),
        ),
        childCount: 30,
      ),
    ),
  ],
)''',

  'SliverGrid-Extent': '''
CustomScrollView(
  slivers: [
    SliverAppBar(
      title: Text('SliverGrid with Max Extent'),
      floating: true,
    ),
    SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange, Colors.red],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Icon(Icons.star, color: Colors.white, size: 30),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Item \$index'),
              ),
            ],
          ),
        ),
        childCount: 50,
      ),
    ),
  ],
)''',

  // SliverToBoxAdapter codes
  'SliverToBoxAdapter-Basic': '''
CustomScrollView(
  slivers: [
    SliverAppBar(
      title: Text('SliverToBoxAdapter'),
      pinned: true,
    ),
    SliverToBoxAdapter(
      child: Container(
        height: 200,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.orange],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info, size: 50, color: Colors.white),
              SizedBox(height: 16),
              Text(
                'This is a single widget\\nin a CustomScrollView',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          title: Text('List Item \$index'),
          leading: Icon(Icons.list),
        ),
        childCount: 20,
      ),
    ),
  ],
)''',

  // SliverPersistentHeader codes
  'SliverPersistentHeader-Basic': '''
class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

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

// Usage:
CustomScrollView(
  slivers: [
    SliverAppBar(
      title: Text('Persistent Header Example'),
      pinned: true,
    ),
    SliverPersistentHeader(
      pinned: true,
      delegate: _SliverHeaderDelegate(
        minHeight: 60,
        maxHeight: 120,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.cyan],
            ),
          ),
          child: Center(
            child: Text(
              'Persistent Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          height: 80,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text('Item \$index')),
        ),
        childCount: 30,
      ),
    ),
  ],
)''',

  // SliverAnimatedList codes
  'SliverAnimatedList-Basic': '''
class SliverAnimatedListExample extends StatefulWidget {
  @override
  _SliverAnimatedListExampleState createState() => _SliverAnimatedListExampleState();
}

class _SliverAnimatedListExampleState extends State<SliverAnimatedListExample> {
  final GlobalKey<SliverAnimatedListState> _listKey = GlobalKey<SliverAnimatedListState>();
  List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  void _addItem() {
    final newIndex = _items.length;
    _items.insert(newIndex, 'Item \${newIndex + 1}');
    _listKey.currentState!.insertItem(newIndex);
  }

  void _removeItem(int index) {
    final removedItem = _items.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildItem(removedItem, animation),
    );
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(begin: Offset(1, 0), end: Offset.zero),
      ),
      child: Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          title: Text(item),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _removeItem(_items.indexOf(item)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('SliverAnimatedList'),
          pinned: true,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addItem,
            ),
          ],
        ),
        SliverAnimatedList(
          key: _listKey,
          initialItemCount: _items.length,
          itemBuilder: (context, index, animation) {
            return _buildItem(_items[index], animation);
          },
        ),
      ],
    );
  }
}''',

  // NestedScrollView codes
  'NestedScrollView-Basic': '''
NestedScrollView(
  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        expandedHeight: 200.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('NestedScrollView'),
          background: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo, Colors.blue],
              ),
            ),
          ),
        ),
      ),
    ];
  },
  body: TabBarView(
    children: [
      ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(
          title: Text('Tab 1 - Item \$index'),
          leading: Icon(Icons.star),
        ),
      ),
      ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(
          title: Text('Tab 2 - Item \$index'),
          leading: Icon(Icons.favorite),
        ),
      ),
    ],
  ),
)''',

  // Complex sliver combination
  'Slivers-Complex': '''
CustomScrollView(
  slivers: [
    SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Complex Slivers'),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
            ),
          ),
        ),
      ),
    ),
    SliverToBoxAdapter(
      child: Container(
        height: 100,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.orange[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Header Section',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
    SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.blue[100 * (index % 9)],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text('G\$index')),
        ),
        childCount: 12,
      ),
    ),
    SliverToBoxAdapter(
      child: Container(
        height: 80,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Middle Section',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListTile(
            title: Text('List Item \$index'),
            subtitle: Text('Subtitle for item \$index'),
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text('\$index'),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
        childCount: 20,
      ),
    ),
  ],
)''',
};
