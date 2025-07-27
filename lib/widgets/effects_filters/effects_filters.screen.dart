import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class EffectsFiltersScreen extends StatefulWidget {
  const EffectsFiltersScreen({super.key});

  @override
  State<EffectsFiltersScreen> createState() => _EffectsFiltersScreenState();
}

class _EffectsFiltersScreenState extends State<EffectsFiltersScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  double _blurValue = 0.0;
  double _opacityValue = 1.0;
  bool _isTransformed = false;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _pulseController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Effects & Filters'),
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
            content: 'Opacity Effects',
            components: [
              Column(
                children: [
                  Text('Opacity: ${_opacityValue.toStringAsFixed(2)}'),
                  Slider(
                    value: _opacityValue,
                    onChanged: (value) => setState(() => _opacityValue = value),
                  ),
                  Opacity(
                    opacity: _opacityValue,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Opacity',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Transform Effects',
            components: [
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        setState(() => _isTransformed = !_isTransformed),
                    child: Text(_isTransformed ? 'Reset' : 'Transform'),
                  ),
                  const SizedBox(height: 16),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transform: _isTransformed
                        ? (Matrix4.rotationZ(0.2)
                          ..scale(1.2)
                          ..translate(20.0, 10.0))
                        : Matrix4.identity(),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.purple, Colors.blue],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Transform',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Blur Effects',
            components: [
              Column(
                children: [
                  Text('Blur: ${_blurValue.toStringAsFixed(1)}'),
                  Slider(
                    value: _blurValue,
                    max: 10.0,
                    onChanged: (value) => setState(() => _blurValue = value),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/icon.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.image),
                          ),
                        ),
                        if (_blurValue > 0)
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: _blurValue,
                                sigmaY: _blurValue,
                              ),
                              child: Container(color: Colors.transparent),
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
            content: 'Shadow Effects',
            components: [
              Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Center(child: Text('Box Shadow')),
              ),
              const SizedBox(width: 16),
              PhysicalModel(
                color: Colors.white,
                elevation: 8,
                shadowColor: Colors.purple,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 120,
                  height: 80,
                  child: const Center(child: Text('Physical Model')),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Clip Effects',
            components: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.red,
                      child: const Center(
                        child: Text('ClipRRect',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.green,
                      child: const Center(
                        child: Text('ClipOval',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: _TriangleClipper(),
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.orange,
                      child: const Center(
                        child: Text('Triangle',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Animated Rotations',
            components: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedBuilder(
                    animation: _rotationController,
                    builder: (context, child) => Transform.rotate(
                      angle: _rotationController.value * 2 * math.pi,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.refresh, color: Colors.white),
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _pulseController,
                    builder: (context, child) => Transform.scale(
                      scale: 0.8 + (_pulseController.value * 0.4),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.favorite, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Gradient Effects',
            components: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.pink, Colors.orange, Colors.yellow],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Linear Gradient',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  gradient: const RadialGradient(
                    colors: [Colors.blue, Colors.purple, Colors.indigo],
                    center: Alignment.center,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Radial Gradient',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  gradient: const SweepGradient(
                    colors: [
                      Colors.red,
                      Colors.orange,
                      Colors.yellow,
                      Colors.green,
                      Colors.blue,
                      Colors.purple,
                      Colors.red
                    ],
                    center: Alignment.center,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Sweep Gradient',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Shader Mask Effects',
            components: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.red, Colors.blue],
                ).createShader(bounds),
                child: const Text(
                  'Gradient Text',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ShaderMask(
                shaderCallback: (bounds) => const RadialGradient(
                  colors: [Colors.transparent, Colors.black],
                  stops: [0.5, 1.0],
                ).createShader(bounds),
                blendMode: BlendMode.dstIn,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(Icons.star, size: 40, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Custom Paint Effects',
            components: [
              CustomPaint(
                size: const Size(200, 100),
                painter: _WavePainter(),
              ),
              const SizedBox(height: 16),
              CustomPaint(
                size: const Size(100, 100),
                painter: _CirclePainter(),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.blue, Colors.purple],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height / 2);

    for (double x = 0; x < size.width; x++) {
      final y = size.height / 2 + math.sin(x / 20) * 20;
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 3,
      paint,
    );

    final strokePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 3,
      strokePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
