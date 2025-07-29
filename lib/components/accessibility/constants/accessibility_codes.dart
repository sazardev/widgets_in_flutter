Map<String, String> accessibilitySourceCodes = {
  // Semantics codes
  'Semantics-Basic': '''
Semantics(
  label: 'Increment Counter',
  hint: 'Tap to increase the counter value',
  child: FloatingActionButton(
    onPressed: () {
      // Increment counter
    },
    child: Icon(Icons.add),
  ),
)''',

  'Semantics-Complex': '''
Semantics(
  container: true,
  label: 'User Profile Card',
  child: Card(
    child: Column(
      children: [
        Semantics(
          label: 'Profile picture of John Doe',
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
        ),
        Semantics(
          label: 'User name',
          child: Text('John Doe'),
        ),
        Semantics(
          label: 'Email address',
          child: Text('john.doe@example.com'),
        ),
      ],
    ),
  ),
)''',

  // ExcludeSemantics codes
  'ExcludeSemantics-Basic': '''
Column(
  children: [
    Text('This text is accessible'),
    ExcludeSemantics(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.blue,
        child: Text('Hidden from screen readers'),
      ),
    ),
    Text('This text is also accessible'),
  ],
)''',

  // MergeSemantics codes
  'MergeSemantics-Basic': '''
MergeSemantics(
  child: Row(
    children: [
      Icon(Icons.star),
      Text('5'),
      Text('stars'),
    ],
  ),
)
// Screen reader will announce: "5 stars"''',

  // Focus Management codes
  'Focus-Management': '''
class FocusExample extends StatefulWidget {
  @override
  _FocusExampleState createState() => _FocusExampleState();
}

class _FocusExampleState extends State<FocusExample> {
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;

  @override
  void initState() {
    super.initState();
    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          focusNode: _firstFocusNode,
          decoration: InputDecoration(labelText: 'First Field'),
        ),
        TextField(
          focusNode: _secondFocusNode,
          decoration: InputDecoration(labelText: 'Second Field'),
        ),
        ElevatedButton(
          onPressed: () {
            _secondFocusNode.requestFocus();
          },
          child: Text('Focus Second Field'),
        ),
      ],
    );
  }
}''',

  // Screen Reader codes
  'Screen-Reader-Announcements': '''
ElevatedButton(
  onPressed: () {
    // Announce to screen readers
    SemanticsService.announce(
      'Action completed successfully',
      TextDirection.ltr,
    );
  },
  child: Text('Complete Action'),
)''',

  // Live Region codes
  'Live-Region': '''
class LiveRegionExample extends StatefulWidget {
  @override
  _LiveRegionExampleState createState() => _LiveRegionExampleState();
}

class _LiveRegionExampleState extends State<LiveRegionExample> {
  String _statusMessage = 'Ready';

  void _updateStatus(String message) {
    setState(() {
      _statusMessage = message;
    });
    
    // Announce the change to screen readers
    SemanticsService.announce(
      message,
      TextDirection.ltr,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Semantics(
          liveRegion: true,
          child: Text(
            'Status: \$_statusMessage',
            style: TextStyle(fontSize: 18),
          ),
        ),
        ElevatedButton(
          onPressed: () => _updateStatus('Loading...'),
          child: Text('Start Loading'),
        ),
        ElevatedButton(
          onPressed: () => _updateStatus('Complete'),
          child: Text('Complete'),
        ),
      ],
    );
  }
}''',

  // Keyboard Navigation codes
  'Keyboard-Navigation': '''
class KeyboardNavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              Focus.of(context).requestFocus();
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Focus.of(context).hasFocus 
                      ? Colors.blue 
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: Text('Focusable Container'),
            ),
          );
        },
      ),
    );
  }
}''',

  // Color Contrast codes
  'Color-Contrast': '''
// Good contrast example
Container(
  color: Colors.blue[900], // Dark background
  padding: EdgeInsets.all(16),
  child: Text(
    'High contrast text',
    style: TextStyle(
      color: Colors.white, // Light text
      fontSize: 18,
    ),
  ),
)

// Color-blind friendly example
Row(
  children: [
    Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(child: Text('1')),
    ),
    Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(child: Text('2')),
    ),
  ],
)''',

  // Tooltip Accessibility codes
  'Tooltip-Accessibility': '''
Tooltip(
  message: 'This button adds a new item to your list',
  child: Semantics(
    label: 'Add item button',
    hint: 'Double tap to add a new item',
    child: IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        // Add item logic
      },
    ),
  ),
)''',

  // Text Scaling codes
  'Text-Scaling': '''
Widget build(BuildContext context) {
  final textScaleFactor = MediaQuery.of(context).textScaleFactor;
  
  return Column(
    children: [
      Text('Current text scale: \${textScaleFactor.toStringAsFixed(1)}x'),
      Text(
        'This text scales with system settings',
        style: TextStyle(fontSize: 16),
      ),
      // Text that respects user's text scaling preferences
      Text(
        'Accessible text that scales properly',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ],
  );
}''',

  // Button Accessibility codes
  'Button-Accessibility': '''
// Accessible button with proper semantics
Semantics(
  button: true,
  label: 'Save document',
  hint: 'Saves the current document to your device',
  enabled: true,
  child: ElevatedButton(
    onPressed: () {
      // Save logic
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.save),
        SizedBox(width: 8),
        Text('Save'),
      ],
    ),
  ),
)''',

  // Image Accessibility codes
  'Image-Accessibility': '''
// Image with proper alt text
Semantics(
  label: 'A golden retriever dog playing fetch in a park',
  child: Image.asset(
    'assets/dog.jpg',
    width: 200,
    height: 150,
    fit: BoxFit.cover,
  ),
)

// Decorative image (hidden from screen readers)
ExcludeSemantics(
  child: Image.asset(
    'assets/decorative_pattern.png',
    width: 100,
    height: 100,
  ),
)''',
};
