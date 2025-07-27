import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class AdvancedAnimationsScreen extends StatefulWidget {
  const AdvancedAnimationsScreen({super.key});

  @override
  State<AdvancedAnimationsScreen> createState() =>
      _AdvancedAnimationsScreenState();
}

class _AdvancedAnimationsScreenState extends State<AdvancedAnimationsScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _slideController;
  late AnimationController _bounceController;
  late AnimationController _morphController;

  late Animation<double> _rotationAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _bounceAnimation;
  late Animation<BorderRadius?> _borderAnimation;
  late Animation<Color?> _colorAnimation;

  bool _isExpanded = false;
  bool _showPage2 = false;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _morphController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.linear,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));

    _bounceAnimation = Tween<double>(
      begin: 1,
      end: 1.3,
    ).animate(CurvedAnimation(
      parent: _bounceController,
      curve: Curves.elasticOut,
    ));

    _borderAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(8),
      end: BorderRadius.circular(50),
    ).animate(CurvedAnimation(
      parent: _morphController,
      curve: Curves.fastOutSlowIn,
    ));

    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.purple,
    ).animate(CurvedAnimation(
      parent: _morphController,
      curve: Curves.fastOutSlowIn,
    ));
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _slideController.dispose();
    _bounceController.dispose();
    _morphController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Animations'),
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
            content: 'Rotation Animations',
            components: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RotationTransition(
                    turns: _rotationAnimation,
                    child: const Icon(
                      Icons.refresh,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  Roulette(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(Icons.star, color: Colors.white),
                    ),
                  ),
                  Spin(
                    infinite: true,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.purple, Colors.pink],
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(Icons.favorite, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Slide Animations',
            components: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_slideController.isCompleted) {
                        _slideController.reverse();
                      } else {
                        _slideController.forward();
                      }
                    },
                    child: const Text('Trigger Slide'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Sliding Element',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Bounce & Scale Animations',
            components: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _bounceController.forward().then((_) {
                        _bounceController.reverse();
                      });
                    },
                    child: ScaleTransition(
                      scale: _bounceAnimation,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Icons.touch_app, color: Colors.white),
                      ),
                    ),
                  ),
                  Bounce(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.sports_basketball,
                          color: Colors.white),
                    ),
                  ),
                  Pulse(
                    infinite: true,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.favorite, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Morphing Animations',
            components: [
              Column(
                children: [
                  AnimatedBuilder(
                    animation: _morphController,
                    builder: (context, child) {
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: _colorAnimation.value,
                          borderRadius: _borderAnimation.value,
                        ),
                        child: const Icon(
                          Icons.transform,
                          color: Colors.white,
                          size: 30,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_morphController.isCompleted) {
                        _morphController.reverse();
                      } else {
                        _morphController.forward();
                      }
                    },
                    child: const Text('Morph'),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'AnimatedContainer',
            components: [
              Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: _isExpanded ? 200 : 100,
                    height: _isExpanded ? 100 : 50,
                    decoration: BoxDecoration(
                      color: _isExpanded ? Colors.purple : Colors.blue,
                      borderRadius: BorderRadius.circular(_isExpanded ? 20 : 8),
                    ),
                    child: Center(
                      child: Text(
                        _isExpanded ? 'Expanded!' : 'Tap me',
                        style: const TextStyle(color: Colors.white),
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
                    child: Text(_isExpanded ? 'Shrink' : 'Expand'),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Page Transitions',
            components: [
              Column(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                    child: _showPage2
                        ? Container(
                            key: const ValueKey('page2'),
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Page 2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            key: const ValueKey('page1'),
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Page 1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showPage2 = !_showPage2;
                      });
                    },
                    child: const Text('Switch Page'),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Staggered Animations',
            components: [
              StaggeredAnimationDemo(),
            ],
          ),
          CardComponents(
            content: 'AnimateDo Effects',
            components: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  FadeIn(
                    child: _buildAnimatedCard('Fade In', Colors.blue),
                  ),
                  SlideInLeft(
                    child: _buildAnimatedCard('Slide Left', Colors.green),
                  ),
                  SlideInRight(
                    child: _buildAnimatedCard('Slide Right', Colors.orange),
                  ),
                  SlideInUp(
                    child: _buildAnimatedCard('Slide Up', Colors.purple),
                  ),
                  ZoomIn(
                    child: _buildAnimatedCard('Zoom In', Colors.red),
                  ),
                  FlipInX(
                    child: _buildAnimatedCard('Flip X', Colors.teal),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Hero Animations',
            components: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: 'hero1',
                    child: GestureDetector(
                      onTap: () =>
                          _showHeroDialog(context, 'hero1', Colors.blue),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Icons.star, color: Colors.white),
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'hero2',
                    child: GestureDetector(
                      onTap: () =>
                          _showHeroDialog(context, 'hero2', Colors.red),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Icons.favorite, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }

  Widget _buildAnimatedCard(String text, Color color) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _showHeroDialog(BuildContext context, String tag, Color color) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Hero(
          tag: tag,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 60,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Hero Animation!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Close',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StaggeredAnimationDemo extends StatefulWidget {
  @override
  State<StaggeredAnimationDemo> createState() => _StaggeredAnimationDemoState();
}

class _StaggeredAnimationDemoState extends State<StaggeredAnimationDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _animations = List.generate(4, (index) {
      return Tween<double>(
        begin: 0,
        end: 1,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          index * 0.2,
          (index * 0.2) + 0.6,
          curve: Curves.elasticOut,
        ),
      ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return AnimatedBuilder(
              animation: _animations[index],
              builder: (context, child) {
                return Transform.scale(
                  scale: _animations[index].value,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: const Text('Staggered Animation'),
        ),
      ],
    );
  }
}
