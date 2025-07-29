Map<String, String> scrollingSourceCodes = {
  // ListView codes
  'ListView-Basic': '''
ListView(
  children: <Widget>[
    ListTile(
      leading: Icon(Icons.map),
      title: Text('Map'),
      onTap: () {},
    ),
    ListTile(
      leading: Icon(Icons.photo_album),
      title: Text('Album'),
      onTap: () {},
    ),
    ListTile(
      leading: Icon(Icons.phone),
      title: Text('Phone'),
      onTap: () {},
    ),
  ],
)''',

  'ListView-Builder': '''
ListView.builder(
  itemCount: 100,
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('\${index + 1}'),
      ),
      title: Text('Item \${index + 1}'),
      subtitle: Text('This is item number \${index + 1}'),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        print('Tapped item \${index + 1}');
      },
    );
  },
)''',

  'ListView-Separated': '''
ListView.separated(
  itemCount: 20,
  separatorBuilder: (BuildContext context, int index) {
    return Divider(
      color: Colors.grey,
      thickness: 1,
    );
  },
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      leading: Icon(Icons.star, color: Colors.orange),
      title: Text('Separated Item \${index + 1}'),
      subtitle: Text('With divider'),
    );
  },
)''',

  // GridView codes
  'GridView-Count': '''
GridView.count(
  crossAxisCount: 2,
  padding: EdgeInsets.all(16),
  crossAxisSpacing: 16,
  mainAxisSpacing: 16,
  children: List.generate(20, (index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100 * (index % 9 + 1)],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          'Item \${index + 1}',
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
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    childAspectRatio: 1,
  ),
  itemCount: 50,
  itemBuilder: (BuildContext context, int index) {
    return Card(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            '\${index + 1}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  },
)''',

  // PageView codes
  'PageView-Basic': '''
PageView(
  children: <Widget>[
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Page 1',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.green,
      child: Center(
        child: Text(
          'Page 2',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Page 3',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    ),
  ],
)''',

  'PageView-Builder': '''
PageController pageController = PageController();

PageView.builder(
  controller: pageController,
  itemCount: 5,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.primaries[index % Colors.primaries.length],
            Colors.primaries[(index + 1) % Colors.primaries.length],
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pages,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Page \${index + 1}',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  },
)''',

  // SingleChildScrollView codes
  'SingleChildScrollView-Basic': '''
SingleChildScrollView(
  child: Column(
    children: List.generate(30, (index) {
      return Container(
        height: 80,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue[100 * (index % 9 + 1)],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'Scrollable Item \${index + 1}',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }),
  ),
)''',

  // CustomScrollView codes
  'CustomScrollView-Basic': '''
CustomScrollView(
  slivers: <Widget>[
    SliverAppBar(
      title: Text('Custom Scroll View'),
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
      pinned: true,
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.star),
            title: Text('Item \$index'),
          );
        },
        childCount: 20,
      ),
    ),
  ],
)''',

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
          centerTitle: true,
          title: Text("Nested Scroll View"),
          background: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.red],
              ),
            ),
          ),
        ),
      ),
    ];
  },
  body: ListView.builder(
    itemCount: 30,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: Icon(Icons.list),
          title: Text('Nested Item \$index'),
          subtitle: Text('Inside NestedScrollView'),
        ),
      );
    },
  ),
)''',

  // RefreshIndicator codes
  'RefreshIndicator-Basic': '''
RefreshIndicator(
  onRefresh: () async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));
    
    // Refresh your data here
    setState(() {
      // Update your data
    });
  },
  child: ListView.builder(
    itemCount: 20,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        leading: Icon(Icons.refresh),
        title: Text('Pull to refresh - Item \$index'),
        subtitle: Text('Pull down to refresh the list'),
      );
    },
  ),
)''',

  // NotificationListener codes
  'NotificationListener-Scroll': '''
NotificationListener<ScrollNotification>(
  onNotification: (ScrollNotification scrollInfo) {
    if (scrollInfo is ScrollStartNotification) {
      print('Scroll Started');
    } else if (scrollInfo is ScrollUpdateNotification) {
      print('Scroll Updated: \${scrollInfo.metrics.pixels}');
    } else if (scrollInfo is ScrollEndNotification) {
      print('Scroll Ended');
    }
    return false;
  },
  child: ListView.builder(
    itemCount: 50,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text('Scroll Notification Item \$index'),
        subtitle: Text('Check console for scroll events'),
      );
    },
  ),
)''',

  // Scrollbar codes
  'Scrollbar-Basic': '''
Scrollbar(
  thumbVisibility: true,
  child: ListView.builder(
    itemCount: 100,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text('Scrollbar Item \$index'),
        leading: Icon(Icons.list),
      );
    },
  ),
)''',

  // ReorderableListView codes
  'ReorderableListView-Basic': '''
List<String> items = List.generate(10, (index) => 'Item \${index + 1}');

ReorderableListView(
  onReorder: (int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final String item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
  },
  children: items.map((item) {
    return ListTile(
      key: ValueKey(item),
      leading: Icon(Icons.drag_handle),
      title: Text(item),
      subtitle: Text('Drag to reorder'),
    );
  }).toList(),
)''',

  // DraggableScrollableSheet codes
  'DraggableScrollableSheet-Basic': '''
DraggableScrollableSheet(
  initialChildSize: 0.3,
  minChildSize: 0.1,
  maxChildSize: 0.9,
  builder: (BuildContext context, ScrollController scrollController) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ListView.builder(
        controller: scrollController,
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Draggable Item \$index'),
            leading: Icon(Icons.drag_indicator),
          );
        },
      ),
    );
  },
)''',
};
