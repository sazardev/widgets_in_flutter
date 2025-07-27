import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout'),
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
            content: 'Container',
            components: [
              Container(
                width: 100,
                height: 60,
                color: Colors.blue.shade200,
                child: const Center(child: Text('Basic')),
              ),
              Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: const Center(child: Text('Decorated')),
              ),
              Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade300, Colors.pink.shade300],
                  ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Gradient',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Padding & Margin',
            components: [
              Container(
                color: Colors.blue.shade100,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Padding All'),
                ),
              ),
              Container(
                color: Colors.green.shade100,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text('Padding Symmetric'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(12),
                color: Colors.orange.shade100,
                child: const Text('Margin + Padding'),
              ),
            ],
          ),
          CardComponents(
            content: 'Column Layout',
            components: [
              Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Text('Item 1'),
                    Text('Item 2'),
                    Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
              ),
              Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Center'),
                    Text('Cross Start'),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Row Layout',
            components: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.home),
                    Text('Home'),
                    Icon(Icons.star),
                    Text('Star'),
                  ],
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.menu),
                    ),
                    Text('Title'),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Stack Layout',
            components: [
              Container(
                width: 120,
                height: 120,
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(Icons.favorite, color: Colors.red),
                    ),
                    const Positioned(
                      bottom: 8,
                      left: 8,
                      child: Text('Overlay Text'),
                    ),
                  ],
                ),
              ),
              Container(
                width: 120,
                height: 120,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                    const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Flexible & Expanded',
            components: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      color: Colors.red.shade200,
                      child: const Center(child: Text('Fixed')),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue.shade200,
                        child: const Center(child: Text('Expanded')),
                      ),
                    ),
                    Container(
                      width: 50,
                      color: Colors.green.shade200,
                      child: const Center(child: Text('Fixed')),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.orange.shade200,
                        child: const Center(child: Text('Flex 1')),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        color: Colors.purple.shade200,
                        child: const Center(child: Text('Flex 2')),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.teal.shade200,
                        child: const Center(child: Text('Flex 1')),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Wrap Layout',
            components: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(
                      label: const Text('Tag 1'),
                      backgroundColor: Colors.blue.shade100,
                    ),
                    Chip(
                      label: const Text('Tag 2'),
                      backgroundColor: Colors.green.shade100,
                    ),
                    Chip(
                      label: const Text('Longer Tag 3'),
                      backgroundColor: Colors.orange.shade100,
                    ),
                    Chip(
                      label: const Text('Tag 4'),
                      backgroundColor: Colors.purple.shade100,
                    ),
                    Chip(
                      label: const Text('Another Tag'),
                      backgroundColor: Colors.red.shade100,
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Center & Align',
            components: [
              Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text('Centered'),
                ),
              ),
              Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Bottom Left'),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'SizedBox & Spacer',
            components: [
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    color: Colors.blue.shade200,
                    child: const Center(child: Text('Box 1')),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 100,
                    height: 30,
                    color: Colors.green.shade200,
                    child: const Center(child: Text('Box 2')),
                  ),
                ],
              ),
              Container(
                height: 80,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      color: Colors.red.shade200,
                    ),
                    const Spacer(),
                    Container(
                      width: 30,
                      color: Colors.blue.shade200,
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
