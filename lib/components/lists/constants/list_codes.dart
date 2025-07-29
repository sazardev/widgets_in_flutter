Map<String, String> listSourceCodes = {
  // ListView codes
  'ListView-Basic': '''
ListView(
  children: [
    ListTile(
      leading: Icon(Icons.person),
      title: Text('John Doe'),
      subtitle: Text('Software Developer'),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
    ListTile(
      leading: Icon(Icons.person),
      title: Text('Jane Smith'),
      subtitle: Text('UI/UX Designer'),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
    ListTile(
      leading: Icon(Icons.person),
      title: Text('Mike Johnson'),
      subtitle: Text('Product Manager'),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
  ],
)''',

  'ListView-Builder': '''
ListView.builder(
  itemCount: 100,
  itemBuilder: (context, index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('\${index + 1}'),
      ),
      title: Text('Item \${index + 1}'),
      subtitle: Text('Description for item \${index + 1}'),
      onTap: () {
        print('Tapped item \${index + 1}');
      },
    );
  },
)''',

  'ListView-Separated': '''
ListView.separated(
  itemCount: 20,
  separatorBuilder: (context, index) => Divider(),
  itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.star, color: Colors.amber),
      title: Text('Star Item \${index + 1}'),
      subtitle: Text('This is a starred item'),
    );
  },
)''',

  // GridView codes
  'GridView-Count': '''
GridView.count(
  crossAxisCount: 2,
  crossAxisSpacing: 4,
  mainAxisSpacing: 4,
  children: List.generate(20, (index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100 * (index % 9)],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          'Item \$index',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }),
)''',

  'GridView-Builder': '''
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 4,
    mainAxisSpacing: 4,
    childAspectRatio: 1,
  ),
  itemCount: 50,
  itemBuilder: (context, index) {
    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.grid_view, size: 30),
            SizedBox(height: 8),
            Text('Grid \$index'),
          ],
        ),
      ),
    );
  },
)''',

  'GridView-Extent': '''
GridView.extent(
  maxCrossAxisExtent: 150,
  crossAxisSpacing: 4,
  mainAxisSpacing: 4,
  children: List.generate(30, (index) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.blue],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          '\$index',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }),
)''',

  // ListTile codes
  'ListTile-Basic': '''
ListTile(
  leading: Icon(Icons.account_circle),
  title: Text('Username'),
  subtitle: Text('user@example.com'),
  trailing: Icon(Icons.arrow_forward_ios),
  onTap: () {
    print('ListTile tapped');
  },
)''',

  'ListTile-Complex': '''
ListTile(
  contentPadding: EdgeInsets.all(16),
  leading: CircleAvatar(
    backgroundImage: NetworkImage('https://picsum.photos/40/40'),
  ),
  title: Text(
    'John Doe',
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Software Engineer'),
      SizedBox(height: 4),
      Row(
        children: [
          Icon(Icons.star, size: 16, color: Colors.amber),
          Text(' 4.5 rating'),
        ],
      ),
    ],
  ),
  trailing: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('2 hours ago'),
      Icon(Icons.more_vert),
    ],
  ),
  isThreeLine: true,
  onTap: () {
    print('Complex ListTile tapped');
  },
)''',

  // ExpansionTile codes
  'ExpansionTile-Basic': '''
ExpansionTile(
  leading: Icon(Icons.folder),
  title: Text('Folder Name'),
  subtitle: Text('Tap to expand'),
  children: [
    ListTile(
      leading: Icon(Icons.file_copy),
      title: Text('File 1.txt'),
      onTap: () {
        print('File 1 tapped');
      },
    ),
    ListTile(
      leading: Icon(Icons.file_copy),
      title: Text('File 2.txt'),
      onTap: () {
        print('File 2 tapped');
      },
    ),
    ListTile(
      leading: Icon(Icons.file_copy),
      title: Text('File 3.txt'),
      onTap: () {
        print('File 3 tapped');
      },
    ),
  ],
)''',

  // ReorderableListView codes
  'ReorderableListView-Basic': '''
// In your StatefulWidget:
List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

ReorderableListView(
  onReorder: (int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final String item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  },
  children: _items.map((item) {
    return ListTile(
      key: ValueKey(item),
      leading: Icon(Icons.drag_handle),
      title: Text(item),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }).toList(),
)''',

  // SliverList codes
  'SliverList-Basic': '''
CustomScrollView(
  slivers: [
    SliverAppBar(
      title: Text('Sliver List'),
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
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
        (context, index) {
          return ListTile(
            leading: Icon(Icons.list),
            title: Text('Sliver Item \$index'),
            subtitle: Text('This is a sliver list item'),
          );
        },
        childCount: 50,
      ),
    ),
  ],
)''',

  // SliverGrid codes
  'SliverGrid-Basic': '''
CustomScrollView(
  slivers: [
    SliverAppBar(
      title: Text('Sliver Grid'),
      pinned: true,
    ),
    SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.teal[100 * (index % 9)],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Grid \$index',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
        childCount: 30,
      ),
    ),
  ],
)''',

  // DragAndDropList (custom implementation)
  'DragAndDropList-Custom': '''
class DragAndDropList extends StatefulWidget {
  @override
  _DragAndDropListState createState() => _DragAndDropListState();
}

class _DragAndDropListState extends State<DragAndDropList> {
  List<String> _items = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: _items.length,
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
      itemBuilder: (context, index) {
        final item = _items[index];
        return Card(
          key: ValueKey(item),
          margin: EdgeInsets.all(8),
          child: ListTile(
            leading: Icon(Icons.drag_handle),
            title: Text(item),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _items.removeAt(index);
                });
              },
            ),
          ),
        );
      },
    );
  }
}''',

  // Scrollable list with custom scroll physics
  'ListView-CustomPhysics': '''
ListView.builder(
  physics: BouncingScrollPhysics(),
  itemCount: 100,
  itemBuilder: (context, index) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: ListTile(
        leading: Icon(Icons.bounce_outlined),
        title: Text('Bouncing Item \$index'),
        subtitle: Text('This list uses bouncing scroll physics'),
      ),
    );
  },
)''',

  // Horizontal ListView
  'ListView-Horizontal': '''
Container(
  height: 200,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 20,
    itemBuilder: (context, index) {
      return Container(
        width: 160,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.cyan[100 * (index % 9)],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.card_giftcard, size: 40),
            SizedBox(height: 8),
            Text(
              'Card \$index',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    },
  ),
)''',

  // ListView with pull to refresh
  'ListView-PullToRefresh': '''
// In your StatefulWidget:
List<String> _items = List.generate(20, (index) => 'Item \$index');
bool _isRefreshing = false;

Future<void> _refresh() async {
  setState(() {
    _isRefreshing = true;
  });
  
  // Simulate network delay
  await Future.delayed(Duration(seconds: 2));
  
  setState(() {
    _items = List.generate(20, (index) => 'Refreshed Item \$index');
    _isRefreshing = false;
  });
}

RefreshIndicator(
  onRefresh: _refresh,
  child: ListView.builder(
    itemCount: _items.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.refresh),
        title: Text(_items[index]),
        subtitle: Text('Pull down to refresh'),
      );
    },
  ),
)''',
};
