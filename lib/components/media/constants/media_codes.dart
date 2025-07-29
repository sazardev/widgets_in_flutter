Map<String, String> mediaSourceCodes = {
  // MediaQuery codes
  'MediaQuery-Basic': '''
// Get screen information
Widget build(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  
  return Column(
    children: [
      Text('Screen Width: \${mediaQuery.size.width}'),
      Text('Screen Height: \${mediaQuery.size.height}'),
      Text('Pixel Ratio: \${mediaQuery.devicePixelRatio}'),
      Text('Text Scale Factor: \${mediaQuery.textScaleFactor}'),
      Text('Platform Brightness: \${mediaQuery.platformBrightness}'),
    ],
  );
}''',

  'MediaQuery-Responsive': '''
// Responsive design with MediaQuery
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  
  return Container(
    width: double.infinity,
    child: screenWidth > 600
        ? Row(
            children: [
              Expanded(child: _buildContent()),
              Expanded(child: _buildSidebar()),
            ],
          )
        : Column(
            children: [
              _buildContent(),
              _buildSidebar(),
            ],
          ),
  );
}

Widget _buildContent() {
  return Container(
    padding: EdgeInsets.all(16),
    color: Colors.blue[100],
    child: Text('Main Content'),
  );
}

Widget _buildSidebar() {
  return Container(
    padding: EdgeInsets.all(16),
    color: Colors.green[100],
    child: Text('Sidebar'),
  );
}''',

  // LayoutBuilder codes
  'LayoutBuilder-Basic': '''
LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth,
      height: constraints.maxHeight,
      color: Colors.blue[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Available Width: \${constraints.maxWidth.toStringAsFixed(1)}'),
            Text('Available Height: \${constraints.maxHeight.toStringAsFixed(1)}'),
            Text('Min Width: \${constraints.minWidth}'),
            Text('Min Height: \${constraints.minHeight}'),
          ],
        ),
      ),
    );
  },
)''',

  'LayoutBuilder-Responsive': '''
LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth > 800) {
      // Desktop layout
      return Row(
        children: [
          Container(
            width: 200,
            color: Colors.blue[100],
            child: Text('Desktop Sidebar'),
          ),
          Expanded(
            child: Container(
              color: Colors.green[100],
              child: Text('Desktop Main Content'),
            ),
          ),
        ],
      );
    } else if (constraints.maxWidth > 400) {
      // Tablet layout
      return Column(
        children: [
          Container(
            height: 60,
            color: Colors.orange[100],
            child: Text('Tablet Header'),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150,
                  color: Colors.blue[100],
                  child: Text('Tablet Sidebar'),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green[100],
                    child: Text('Tablet Content'),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      // Mobile layout
      return Column(
        children: [
          Container(
            height: 50,
            color: Colors.red[100],
            child: Text('Mobile Header'),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow[100],
              child: Text('Mobile Content'),
            ),
          ),
          Container(
            height: 60,
            color: Colors.purple[100],
            child: Text('Mobile Bottom Nav'),
          ),
        ],
      );
    }
  },
)''',

  // OrientationBuilder codes
  'OrientationBuilder-Basic': '''
OrientationBuilder(
  builder: (BuildContext context, Orientation orientation) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: orientation == Orientation.portrait 
          ? Colors.blue[100] 
          : Colors.green[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              orientation == Orientation.portrait 
                  ? Icons.smartphone 
                  : Icons.tablet,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              orientation == Orientation.portrait 
                  ? 'Portrait Mode' 
                  : 'Landscape Mode',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  },
)''',

  // AspectRatio codes
  'AspectRatio-Basic': '''
Container(
  width: 300,
  child: AspectRatio(
    aspectRatio: 16 / 9, // 16:9 aspect ratio
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          '16:9 Aspect Ratio',
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

  'AspectRatio-Multiple': '''
Column(
  children: [
    Container(
      width: 200,
      child: AspectRatio(
        aspectRatio: 1, // Square
        child: Container(
          color: Colors.red,
          child: Center(child: Text('1:1 Square')),
        ),
      ),
    ),
    SizedBox(height: 16),
    Container(
      width: 200,
      child: AspectRatio(
        aspectRatio: 16 / 9, // Widescreen
        child: Container(
          color: Colors.green,
          child: Center(child: Text('16:9 Widescreen')),
        ),
      ),
    ),
    SizedBox(height: 16),
    Container(
      width: 200,
      child: AspectRatio(
        aspectRatio: 4 / 3, // Traditional
        child: Container(
          color: Colors.blue,
          child: Center(child: Text('4:3 Traditional')),
        ),
      ),
    ),
  ],
)''',

  // FractionallySizedBox codes
  'FractionallySizedBox-Basic': '''
Container(
  width: 300,
  height: 200,
  color: Colors.grey[300],
  child: FractionallySizedBox(
    widthFactor: 0.8, // 80% of parent width
    heightFactor: 0.6, // 60% of parent height
    alignment: Alignment.center,
    child: Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          '80% x 60%',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ),
)''',

  // Flexible and Expanded codes
  'Flexible-Basic': '''
Row(
  children: [
    Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: Center(child: Text('Fixed')),
    ),
    Flexible(
      flex: 1,
      child: Container(
        height: 50,
        color: Colors.green,
        child: Center(child: Text('Flexible 1')),
      ),
    ),
    Flexible(
      flex: 2,
      child: Container(
        height: 50,
        color: Colors.blue,
        child: Center(child: Text('Flexible 2')),
      ),
    ),
  ],
)''',

  'Expanded-Basic': '''
Column(
  children: [
    Container(
      height: 50,
      color: Colors.red,
      child: Center(child: Text('Fixed Height')),
    ),
    Expanded(
      flex: 1,
      child: Container(
        color: Colors.green,
        child: Center(child: Text('Expanded 1')),
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        color: Colors.blue,
        child: Center(child: Text('Expanded 2')),
      ),
    ),
    Container(
      height: 50,
      color: Colors.orange,
      child: Center(child: Text('Fixed Height')),
    ),
  ],
)''',

  // ConstrainedBox codes
  'ConstrainedBox-Basic': '''
ConstrainedBox(
  constraints: BoxConstraints(
    minWidth: 100,
    maxWidth: 200,
    minHeight: 50,
    maxHeight: 100,
  ),
  child: Container(
    color: Colors.blue,
    child: Center(
      child: Text('Constrained Box'),
    ),
  ),
)''',

  // IntrinsicHeight and IntrinsicWidth codes
  'IntrinsicHeight-Basic': '''
IntrinsicHeight(
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        width: 50,
        color: Colors.red,
        child: Center(child: Text('A')),
      ),
      Container(
        width: 50,
        color: Colors.green,
        child: Column(
          children: [
            Text('B'),
            Text('B'),
            Text('B'),
          ],
        ),
      ),
      Container(
        width: 50,
        color: Colors.blue,
        child: Center(child: Text('C')),
      ),
    ],
  ),
)''',

  // FittedBox codes
  'FittedBox-Basic': '''
Container(
  width: 200,
  height: 100,
  color: Colors.grey[300],
  child: FittedBox(
    fit: BoxFit.contain,
    child: Text(
      'This text will fit inside the container',
      style: TextStyle(fontSize: 50),
    ),
  ),
)''',

  'FittedBox-Different-Fits': '''
Column(
  children: [
    Container(
      width: 200,
      height: 60,
      color: Colors.red[100],
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text('BoxFit.contain', style: TextStyle(fontSize: 30)),
      ),
    ),
    SizedBox(height: 8),
    Container(
      width: 200,
      height: 60,
      color: Colors.green[100],
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text('BoxFit.cover', style: TextStyle(fontSize: 30)),
      ),
    ),
    SizedBox(height: 8),
    Container(
      width: 200,
      height: 60,
      color: Colors.blue[100],
      child: FittedBox(
        fit: BoxFit.fill,
        child: Text('BoxFit.fill', style: TextStyle(fontSize: 30)),
      ),
    ),
  ],
)''',
};
