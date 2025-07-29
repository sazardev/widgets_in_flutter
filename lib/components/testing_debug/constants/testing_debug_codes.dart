Map<String, String> testingDebugSourceCodes = {
  // Debug Information codes
  'Debug-Mode-Check': '''
import 'package:flutter/foundation.dart';

Widget build(BuildContext context) {
  return Column(
    children: [
      Text('Debug Mode: \${kDebugMode ? "ON" : "OFF"}'),
      Text('Profile Mode: \${kProfileMode ? "ON" : "OFF"}'),
      Text('Release Mode: \${kReleaseMode ? "ON" : "OFF"}'),
      Text('Platform: \${defaultTargetPlatform.name}'),
      Text('Is Web: \${kIsWeb ? "YES" : "NO"}'),
    ],
  );
}''',

  // Debug Print codes
  'Debug-Print': '''
import 'package:flutter/foundation.dart';

ElevatedButton(
  onPressed: () {
    debugPrint('This is a debug print message');
    
    // Only prints in debug mode
    if (kDebugMode) {
      print('This only prints in debug mode');
    }
    
    // Assert only runs in debug mode
    assert(() {
      print('Assert message - debug only');
      return true;
    }());
  },
  child: Text('Debug Print'),
)''',

  // Widget Inspector codes
  'Widget-Inspector': '''
// Widget tree debugging
ElevatedButton(
  onPressed: () {
    // Dump widget tree to console
    debugDumpApp();
  },
  child: Text('Dump Widget Tree'),
),

ElevatedButton(
  onPressed: () {
    // Dump render tree to console
    debugDumpRenderTree();
  },
  child: Text('Dump Render Tree'),
),

ElevatedButton(
  onPressed: () {
    // Dump focus tree
    debugDumpFocusTree();
  },
  child: Text('Dump Focus Tree'),
)''',

  // Performance Debugging codes
  'Performance-Overlay': '''
MaterialApp(
  debugShowCheckedModeBanner: false,
  showPerformanceOverlay: true, // Shows FPS overlay
  home: MyHomePage(),
)

// Alternative: Runtime toggle
bool showPerformanceOverlay = false;

MaterialApp(
  builder: (context, child) {
    return Stack(
      children: [
        child!,
        if (showPerformanceOverlay)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PerformanceOverlay.allEnabled(),
          ),
      ],
    );
  },
  home: MyHomePage(),
)''',

  // Debug Banner codes
  'Debug-Banner': '''
// Remove debug banner
MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyHomePage(),
)

// Custom debug banner
Banner(
  message: 'DEBUG',
  location: BannerLocation.topEnd,
  color: Colors.red,
  child: Container(
    width: 200,
    height: 200,
    color: Colors.blue,
    child: Center(child: Text('App Content')),
  ),
)''',

  // Semantics Debugging codes
  'Semantics-Debugger': '''
MaterialApp(
  showSemanticsDebugger: true, // Shows accessibility info
  home: MyHomePage(),
)

// Runtime toggle
bool showSemanticsDebugger = false;

MaterialApp(
  builder: (context, child) {
    if (showSemanticsDebugger) {
      return SemanticsDebugger(child: child!);
    }
    return child!;
  },
  home: MyHomePage(),
)''',

  // Test Keys codes
  'Test-Keys': '''
// Using keys for testing
Container(
  key: Key('test_container'),
  child: Text('Testable Widget'),
)

// Value keys
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      key: ValueKey(items[index].id),
      title: Text(items[index].name),
    );
  },
)

// Global keys
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        key: Key('email_field'),
        validator: (value) => value!.isEmpty ? 'Required' : null,
      ),
      ElevatedButton(
        key: Key('submit_button'),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Submit form
          }
        },
        child: Text('Submit'),
      ),
    ],
  ),
)''',

  // Layout Explorer codes
  'Layout-Information': '''
Widget build(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  
  return Container(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Screen size: \${mediaQuery.size}'),
        Text('Pixel ratio: \${mediaQuery.devicePixelRatio}'),
        Text('Text scale: \${mediaQuery.textScaleFactor}'),
        Text('Padding: \${mediaQuery.padding}'),
        Text('View insets: \${mediaQuery.viewInsets}'),
        Text('Safe area: \${mediaQuery.padding}'),
      ],
    ),
  );
}''',

  // Memory Debugging codes
  'Memory-Debugging': '''
import 'package:flutter/services.dart';

// Memory usage information
ElevatedButton(
  onPressed: () async {
    // Get memory info (Android only)
    if (Platform.isAndroid) {
      final MemoryInfo? memoryInfo = await ProcessInfo.currentRss;
      print('Memory usage: \$memoryInfo bytes');
    }
    
    // Force garbage collection
    SystemChannels.system.invokeMethod('SystemChrome.systemUIChangeCallback');
  },
  child: Text('Check Memory'),
)

// Monitor widget rebuilds
class RebuildTracker extends StatelessWidget {
  static int rebuildCount = 0;
  
  @override
  Widget build(BuildContext context) {
    rebuildCount++;
    debugPrint('Widget rebuilt \$rebuildCount times');
    
    return Text('Rebuild count: \$rebuildCount');
  }
}''',

  // Debug Paint codes
  'Debug-Paint': '''
import 'package:flutter/rendering.dart';

// Show widget boundaries
ElevatedButton(
  onPressed: () {
    debugPaintSizeEnabled = !debugPaintSizeEnabled;
    // Forces a rebuild to show changes
    WidgetsBinding.instance.reassembleApplication();
  },
  child: Text('Toggle Size Debug'),
)

// Show repaint rainbow
ElevatedButton(
  onPressed: () {
    debugRepaintRainbowEnabled = !debugRepaintRainbowEnabled;
  },
  child: Text('Toggle Repaint Rainbow'),
)''',

  // Testing Widgets codes
  'Testing-Setup': '''
// Widget test example
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

// Golden test example
testWidgets('Golden test example', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello, World!'),
        ),
      ),
    ),
  );

  await expectLater(
    find.byType(Scaffold),
    matchesGoldenFile('golden_test.png'),
  );
});''',

  // Custom Assert codes
  'Custom-Assert': '''
// Custom assertions for debugging
void customAssert(bool condition, String message) {
  assert(() {
    if (!condition) {
      debugPrint('ASSERTION FAILED: \$message');
    }
    return condition;
  }());
}

// Usage
customAssert(
  widget.items.isNotEmpty,
  'Items list should not be empty'
);

// Debug-only validation
bool validateData(Map<String, dynamic> data) {
  if (kDebugMode) {
    assert(data.containsKey('id'), 'Data must contain id field');
    assert(data['id'] is String, 'ID must be a string');
    assert(data['id'].isNotEmpty, 'ID cannot be empty');
  }
  return true;
}''',

  // Performance Profiling codes
  'Performance-Profiling': '''
import 'dart:developer' as developer;

// Timeline events for profiling
void performExpensiveOperation() {
  developer.Timeline.startSync('ExpensiveOperation');
  
  try {
    // Your expensive operation here
    for (int i = 0; i < 1000000; i++) {
      // Some work
    }
  } finally {
    developer.Timeline.finishSync();
  }
}

// Custom performance markers
ElevatedButton(
  onPressed: () {
    developer.Timeline.instantSync('ButtonPressed');
    performExpensiveOperation();
  },
  child: Text('Profile This'),
)

// Memory allocation tracking
void trackMemoryUsage() {
  if (kDebugMode) {
    final stopwatch = Stopwatch()..start();
    
    // Your operation here
    
    stopwatch.stop();
    debugPrint('Operation took: \${stopwatch.elapsedMilliseconds}ms');
  }
}''',
};
