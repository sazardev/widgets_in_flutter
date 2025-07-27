import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class TestingDebugScreen extends StatefulWidget {
  const TestingDebugScreen({super.key});

  @override
  State<TestingDebugScreen> createState() => _TestingDebugScreenState();
}

class _TestingDebugScreenState extends State<TestingDebugScreen> {
  int _debugPrintCount = 0;
  bool _showDebugBanner = true;
  bool _showPerformanceOverlay = false;
  bool _showSemanticsDebugger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing & Debug Widgets'),
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
            content: 'Debug Information',
            components: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Debug Mode: ${kDebugMode ? "ON" : "OFF"}'),
                    Text('Profile Mode: ${kProfileMode ? "ON" : "OFF"}'),
                    Text('Release Mode: ${kReleaseMode ? "ON" : "OFF"}'),
                    Text('Platform: ${defaultTargetPlatform.name}'),
                    Text('Is Web: ${kIsWeb ? "YES" : "NO"}'),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Debug Print & Logging',
            components: [
              Column(
                children: [
                  Text('Debug prints: $_debugPrintCount'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          debugPrint('Debug print #${++_debugPrintCount}');
                          setState(() {});
                        },
                        child: const Text('Debug Print'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          assert(() {
                            print('Assert message in debug mode');
                            return true;
                          }());
                        },
                        child: const Text('Assert'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Widget Inspector',
            components: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Text('Use Flutter Inspector in IDE'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // This would trigger widget inspector in debug mode
                        debugDumpApp();
                      },
                      child: const Text('Dump Widget Tree'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        debugDumpRenderTree();
                      },
                      child: const Text('Dump Render Tree'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Performance Debugging',
            components: [
              Column(
                children: [
                  SwitchListTile(
                    title: const Text('Performance Overlay'),
                    subtitle: const Text('Shows FPS and frame rendering times'),
                    value: _showPerformanceOverlay,
                    onChanged: (value) {
                      setState(() => _showPerformanceOverlay = value);
                      // Note: This would be used in MaterialApp's builder
                    },
                  ),
                  if (_showPerformanceOverlay)
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.yellow.shade100,
                      child: const Text(
                        'Performance overlay would show in MaterialApp.builder',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Semantics Debugging',
            components: [
              Column(
                children: [
                  SwitchListTile(
                    title: const Text('Semantics Debugger'),
                    subtitle: const Text('Shows accessibility information'),
                    value: _showSemanticsDebugger,
                    onChanged: (value) {
                      setState(() => _showSemanticsDebugger = value);
                    },
                  ),
                  if (_showSemanticsDebugger)
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.green.shade100,
                      child: const Text(
                        'Semantics debugger would highlight accessibility info',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Debug Banner',
            components: [
              Column(
                children: [
                  SwitchListTile(
                    title: const Text('Debug Banner'),
                    subtitle: const Text('Shows "DEBUG" banner in debug mode'),
                    value: _showDebugBanner,
                    onChanged: (value) {
                      setState(() => _showDebugBanner = value);
                    },
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        const Center(child: Text('App Content')),
                        if (_showDebugBanner && kDebugMode)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Banner(
                              message: 'DEBUG',
                              location: BannerLocation.topEnd,
                              color: Colors.red,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Layout Explorer',
            components: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.purple.shade100,
                      padding: const EdgeInsets.all(8),
                      child: const Row(
                        children: [
                          Icon(Icons.info),
                          SizedBox(width: 8),
                          Text('Layout Information'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Screen size: ${MediaQuery.of(context).size}'),
                          Text(
                              'Pixel ratio: ${MediaQuery.of(context).devicePixelRatio}'),
                          Text(
                              'Text scale: ${MediaQuery.of(context).textScaleFactor}'),
                          Text('Padding: ${MediaQuery.of(context).padding}'),
                          Text(
                              'View insets: ${MediaQuery.of(context).viewInsets}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Test Keys & Finders',
            components: [
              Column(
                children: [
                  Container(
                    key: const Key('test_container'),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('Container with Key'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    key: const ValueKey('test_button'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Button with ValueKey pressed')),
                      );
                    },
                    child: const Text('Button with ValueKey'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    key: const Key('test_textfield'),
                    decoration: const InputDecoration(
                      labelText: 'TextField with Key',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Debug Functions',
            components: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      debugDumpLayerTree();
                    },
                    child: const Text('Dump Layers'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      debugDumpSemanticsTree();
                    },
                    child: const Text('Dump Semantics'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      debugPaintSizeEnabled = !debugPaintSizeEnabled;
                      setState(() {});
                    },
                    child: Text(
                        debugPaintSizeEnabled ? 'Hide Sizes' : 'Show Sizes'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (kDebugMode) {
                        assert(() {
                          debugPrint('Custom debug assertion');
                          return true;
                        }());
                      }
                    },
                    child: const Text('Debug Assert'),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Memory & Performance Info',
            components: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Memory Debugging:'),
                    SizedBox(height: 8),
                    Text('• Use DevTools for memory profiling'),
                    Text('• Enable memory tracking in debug mode'),
                    Text('• Watch for memory leaks in animations'),
                    Text('• Profile widget rebuilds'),
                    SizedBox(height: 16),
                    Text('Performance Tips:'),
                    SizedBox(height: 8),
                    Text('• Use const constructors'),
                    Text('• Avoid rebuilding expensive widgets'),
                    Text('• Use RepaintBoundary wisely'),
                    Text('• Profile with --profile flag'),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Widget Tester Simulation',
            components: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Widget Testing Example:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.grey.shade100,
                      child: const Text(
                        '''testWidgets('Button tap test', (WidgetTester tester) async {
  await tester.pumpWidget(MyApp());
  
  final buttonFinder = find.byKey(Key('test_button'));
  expect(buttonFinder, findsOneWidget);
  
  await tester.tap(buttonFinder);
  await tester.pump();
  
  expect(find.text('Button pressed'), findsOneWidget);
});''',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
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
