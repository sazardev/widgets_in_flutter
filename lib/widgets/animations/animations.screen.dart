import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({super.key});

  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  double _opacity = 1.0;
  late AnimationController _rotationController;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _slideController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
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
            content: 'AnimatedContainer',
            components: [
              Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: _width,
                    height: _height,
                    decoration: BoxDecoration(
                      color: _color,
                      borderRadius:
                          BorderRadius.circular(_isExpanded ? 50 : 10),
                    ),
                    child: const Center(
                      child: Text(
                        'Tap me!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _width = _isExpanded ? 100 : 200;
                        _height = _isExpanded ? 100 : 150;
                        _color = _isExpanded ? Colors.blue : Colors.red;
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text(_isExpanded ? 'Shrink' : 'Expand'),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'AnimatedOpacity',
            components: [
              Column(
                children: [
                  AnimatedOpacity(
                    opacity: _opacity,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Fade',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _opacity = _opacity == 1.0 ? 0.3 : 1.0;
                      });
                    },
                    child: Text(_opacity == 1.0 ? 'Fade Out' : 'Fade In'),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'AnimatedRotation',
            components: [
              Column(
                children: [
                  RotationTransition(
                    turns: _rotationController,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_rotationController.isAnimating) {
                            _rotationController.stop();
                          } else {
                            _rotationController.repeat();
                          }
                        },
                        child: Text(
                            _rotationController.isAnimating ? 'Stop' : 'Start'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'SlideTransition',
            components: [
              Column(
                children: [
                  Container(
                    height: 80,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Container(
                          color: Colors.orange,
                          child: const Center(
                            child: Text(
                              'Sliding!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_slideController.isCompleted) {
                        _slideController.reverse();
                      } else {
                        _slideController.forward();
                      }
                    },
                    child: const Text('Slide In/Out'),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'AnimatedSwitcher',
            components: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: _isExpanded
                          ? Container(
                              key: const ValueKey('expanded'),
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 50,
                              ),
                            )
                          : Container(
                              key: const ValueKey('collapsed'),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: const Text('Switch Widget'),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Hero Animation',
            components: [
              Column(
                children: [
                  Hero(
                    tag: 'hero-demo',
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HeroDetailScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tap the blue box to see Hero animation',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Animated List Tile',
            components: [
              AnimatedList(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                initialItemCount: 3,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ),
                    ),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text('Animated Item ${index + 1}'),
                        subtitle: const Text('This item slides in'),
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

class HeroDetailScreen extends StatelessWidget {
  const HeroDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Detail'),
      ),
      body: Center(
        child: Hero(
          tag: 'hero-demo',
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.star,
              color: Colors.white,
              size: 100,
            ),
          ),
        ),
      ),
    );
  }
}
