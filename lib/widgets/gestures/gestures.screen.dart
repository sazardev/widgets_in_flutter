import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class GesturesScreen extends StatefulWidget {
  const GesturesScreen({super.key});

  @override
  State<GesturesScreen> createState() => _GesturesScreenState();
}

class _GesturesScreenState extends State<GesturesScreen> {
  String _gestureMessage = 'Waiting for gesture...';
  Offset _panOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures & Interactions'),
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
            content: 'Gesture Detector',
            components: [
              GestureDetector(
                onTap: () => setState(() => _gestureMessage = 'Tapped!'),
                onDoubleTap: () =>
                    setState(() => _gestureMessage = 'Double Tapped!'),
                onLongPress: () =>
                    setState(() => _gestureMessage = 'Long Pressed!'),
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Center(
                    child: Text(
                      _gestureMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Draggable & Drag Target',
            components: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Draggable<String>(
                    data: 'dragged_item',
                    feedback: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.star, color: Colors.white),
                    ),
                    childWhenDragging: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.star_border),
                    ),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.star, color: Colors.white),
                    ),
                  ),
                  DragTarget<String>(
                    onAcceptWithDetails: (data) {
                      setState(() {
                        _gestureMessage = 'Item Dropped!';
                      });
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: candidateData.isNotEmpty
                              ? Colors.orange.shade200
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: candidateData.isNotEmpty
                                ? Colors.orange
                                : Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: const Center(
                          child: Text('Drop Here'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Pan & Scale Gestures',
            components: [
              GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    _panOffset += details.delta;
                  });
                },
                onPanEnd: (details) {
                  setState(() {
                    _panOffset = Offset.zero;
                  });
                },
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      const Center(child: Text('Pan me around')),
                      Positioned(
                        left: 50 + _panOffset.dx,
                        top: 30 + _panOffset.dy,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Interactive Viewer',
            components: [
              SizedBox(
                width: 200,
                height: 150,
                child: InteractiveViewer(
                  boundaryMargin: const EdgeInsets.all(20),
                  minScale: 0.1,
                  maxScale: 3.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple.shade300, Colors.pink.shade300],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Pinch to zoom\nDrag to pan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Ink Well & Ink Response',
            components: [
              InkWell(
                onTap: () =>
                    setState(() => _gestureMessage = 'InkWell tapped!'),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text('InkWell'),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkResponse(
                  onTap: () =>
                      setState(() => _gestureMessage = 'InkResponse tapped!'),
                  radius: 40,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.touch_app),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Long Press Draggable',
            components: [
              LongPressDraggable<String>(
                data: 'long_press_item',
                feedback: Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Dragging!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Long Press\nto Drag',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Dismissible',
            components: [
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key('item_$index'),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          _gestureMessage = 'Item $index dismissed!';
                        });
                      },
                      child: Card(
                        child: ListTile(
                          title: Text('Swipe to dismiss $index'),
                          trailing: const Icon(Icons.swipe),
                        ),
                      ),
                    );
                  },
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
