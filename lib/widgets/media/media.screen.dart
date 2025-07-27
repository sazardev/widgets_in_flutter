import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLargeScreen = screenSize.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Media & Responsive'),
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
            content: 'MediaQuery Information',
            components: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Screen Width: ${screenSize.width.toInt()}px'),
                    Text('Screen Height: ${screenSize.height.toInt()}px'),
                    Text(
                        'Device Pixel Ratio: ${MediaQuery.of(context).devicePixelRatio}'),
                    Text(
                        'Text Scale Factor: ${MediaQuery.of(context).textScaler}'),
                    Text(
                        'Platform Brightness: ${MediaQuery.of(context).platformBrightness}'),
                    Text('Screen Type: ${isLargeScreen ? "Large" : "Small"}'),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Responsive Layout',
            components: [
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 400) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            color: Colors.green.shade200,
                            child: const Center(child: Text('Wide Layout')),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 100,
                            color: Colors.orange.shade200,
                            child: const Center(child: Text('Side Panel')),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 80,
                          color: Colors.green.shade200,
                          child: const Center(child: Text('Narrow Layout')),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          height: 80,
                          color: Colors.orange.shade200,
                          child: const Center(child: Text('Stacked Panel')),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
          CardComponents(
            content: 'Flexible & Responsive Grids',
            components: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isLargeScreen ? 4 : 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.purple.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text('$index'),
                    ),
                  );
                },
              ),
            ],
          ),
          CardComponents(
            content: 'AspectRatio & FittedBox',
            components: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text('16:9 Aspect Ratio'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'This text fits in the box',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Intrinsic Dimensions',
            components: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.teal.shade200,
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Short text'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        color: Colors.cyan.shade200,
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                              'This is a much longer text that takes up more space'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Orientation Builder',
            components: [
              OrientationBuilder(
                builder: (context, orientation) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: orientation == Orientation.portrait
                          ? Colors.green.shade200
                          : Colors.orange.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Orientation: ${orientation.name}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          CardComponents(
            content: 'SafeArea & Padding',
            components: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SafeArea(
                  child: Container(
                    color: Colors.yellow.shade200,
                    child: const Center(
                      child: Text('Content in SafeArea'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Viewport & Constraints',
            components: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100,
                  maxWidth: 200,
                  minHeight: 50,
                  maxHeight: 100,
                ),
                child: Container(
                  color: Colors.indigo.shade200,
                  child: const Center(
                    child: Text('Constrained Box'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              LimitedBox(
                maxWidth: 150,
                maxHeight: 75,
                child: Container(
                  color: Colors.pink.shade200,
                  child: const Center(
                    child: Text('Limited Box'),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Breakpoint Responsive',
            components: [
              Builder(
                builder: (context) {
                  final width = MediaQuery.of(context).size.width;
                  String deviceType;
                  Color color;

                  if (width < 600) {
                    deviceType = 'Mobile';
                    color = Colors.red.shade200;
                  } else if (width < 1024) {
                    deviceType = 'Tablet';
                    color = Colors.orange.shade200;
                  } else {
                    deviceType = 'Desktop';
                    color = Colors.green.shade200;
                  }

                  return Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Device Type: $deviceType',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
