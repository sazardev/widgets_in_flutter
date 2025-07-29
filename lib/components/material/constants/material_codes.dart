Map<String, String> materialSourceCodes = {
  // Card codes
  'Card-Basic': '''
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Card Title',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'This is a basic card with some content inside.',
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('CANCEL'),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              child: Text('OK'),
            ),
          ],
        ),
      ],
    ),
  ),
)''',

  'Card-Elevated': '''
Card(
  elevation: 8,
  shadowColor: Colors.blue.withOpacity(0.5),
  child: Container(
    width: 300,
    height: 200,
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            SizedBox(width: 8),
            Text(
              'Elevated Card',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 16),
        Text(
          'This card has elevated shadow and custom styling.',
          style: TextStyle(fontSize: 16),
        ),
        Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Action'),
          ),
        ),
      ],
    ),
  ),
)''',

  // Material codes
  'Material-Basic': '''
Material(
  elevation: 4,
  borderRadius: BorderRadius.circular(12),
  color: Colors.blue[50],
  child: InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: () {
      print('Material tapped');
    },
    child: Container(
      width: 200,
      height: 100,
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(
          'Tap me!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  ),
)''',

  'Material-Custom': '''
Material(
  elevation: 8,
  shadowColor: Colors.purple.withOpacity(0.5),
  borderRadius: BorderRadius.circular(20),
  color: Colors.white,
  child: InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {},
    child: Container(
      width: 250,
      height: 150,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(Icons.touch_app, size: 40, color: Colors.purple),
          SizedBox(height: 16),
          Text(
            'Custom Material',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'With custom styling',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    ),
  ),
)''',

  // Surface codes
  'Surface-Basic': '''
// Using Container to simulate Surface
Container(
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.surface,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  ),
  padding: EdgeInsets.all(16),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.layers,
        size: 40,
        color: Theme.of(context).colorScheme.primary,
      ),
      SizedBox(height: 16),
      Text(
        'Surface Component',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      SizedBox(height: 8),
      Text(
        'This simulates a Material surface with proper theming.',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ],
  ),
)''',

  // Ink and InkWell codes
  'InkWell-Basic': '''
InkWell(
  onTap: () {
    print('InkWell tapped');
  },
  borderRadius: BorderRadius.circular(8),
  child: Container(
    width: 200,
    height: 80,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        'Tap for ripple effect',
        style: TextStyle(fontSize: 16),
      ),
    ),
  ),
)''',

  'Ink-Basic': '''
Material(
  color: Colors.blue[100],
  borderRadius: BorderRadius.circular(12),
  child: Ink(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue[200]!, Colors.blue[400]!],
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        print('Ink with gradient tapped');
      },
      child: Center(
        child: Text(
          'Gradient Ink',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ),
)''',

  // Chip codes
  'Chip-Material': '''
Wrap(
  spacing: 8,
  children: [
    Chip(
      avatar: CircleAvatar(
        backgroundColor: Colors.blue[900],
        child: Text('A', style: TextStyle(color: Colors.white)),
      ),
      label: Text('Avatar Chip'),
      deleteIcon: Icon(Icons.close),
      onDeleted: () {
        print('Chip deleted');
      },
    ),
    Chip(
      label: Text('Simple Chip'),
      backgroundColor: Colors.green[100],
    ),
    Chip(
      label: Text('Icon Chip'),
      avatar: Icon(Icons.star),
      backgroundColor: Colors.amber[100],
    ),
  ],
)''',

  // BottomSheet codes
  'BottomSheet-Basic': '''
// In your widget's onPressed method:
void _showBottomSheet(BuildContext context) {
  showBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 300,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bottom Sheet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text('Get link'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

// Usage:
ElevatedButton(
  onPressed: () => _showBottomSheet(context),
  child: Text('Show Bottom Sheet'),
)''',

  'BottomSheet-Modal': '''
// Modal Bottom Sheet
void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Modal Bottom Sheet',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(child: Text('\$index')),
                        title: Text('Item \$index'),
                        subtitle: Text('Subtitle for item \$index'),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

// Usage:
ElevatedButton(
  onPressed: () => _showModalBottomSheet(context),
  child: Text('Show Modal Bottom Sheet'),
)''',

  // Banner codes
  'Banner-Material': '''
Banner(
  message: 'DEBUG',
  location: BannerLocation.topEnd,
  color: Colors.red,
  child: Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.blue[100],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
      child: Text(
        'Content with Banner',
        style: TextStyle(fontSize: 16),
      ),
    ),
  ),
)''',

  // Divider codes
  'Divider-Basic': '''
Column(
  children: [
    ListTile(
      title: Text('Item 1'),
      leading: Icon(Icons.star),
    ),
    Divider(
      color: Colors.grey,
      thickness: 1,
      indent: 16,
      endIndent: 16,
    ),
    ListTile(
      title: Text('Item 2'),
      leading: Icon(Icons.favorite),
    ),
    Divider(
      color: Colors.blue,
      thickness: 2,
      height: 20,
    ),
    ListTile(
      title: Text('Item 3'),
      leading: Icon(Icons.settings),
    ),
  ],
)''',

  'VerticalDivider-Basic': '''
Row(
  children: [
    Expanded(
      child: Container(
        height: 100,
        color: Colors.red[100],
        child: Center(child: Text('Left')),
      ),
    ),
    VerticalDivider(
      color: Colors.grey,
      thickness: 2,
      width: 20,
      indent: 20,
      endIndent: 20,
    ),
    Expanded(
      child: Container(
        height: 100,
        color: Colors.blue[100],
        child: Center(child: Text('Right')),
      ),
    ),
  ],
)''',

  // Tooltip codes
  'Tooltip-Basic': '''
Tooltip(
  message: 'This is a tooltip',
  child: IconButton(
    icon: Icon(Icons.help),
    onPressed: () {},
  ),
)''',

  'Tooltip-Custom': '''
Tooltip(
  message: 'Custom styled tooltip',
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  textStyle: TextStyle(
    color: Colors.white,
    fontSize: 14,
  ),
  preferBelow: false,
  verticalOffset: 20,
  child: Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      'Hover or long press for tooltip',
      style: TextStyle(color: Colors.white),
    ),
  ),
)''',
};
