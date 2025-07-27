import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class CustomPaintScreen extends StatefulWidget {
  const CustomPaintScreen({super.key});

  @override
  State<CustomPaintScreen> createState() => _CustomPaintScreenState();
}

class _CustomPaintScreenState extends State<CustomPaintScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Paint & Graphics'),
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
            content: 'Basic Shapes',
            components: [
              CustomPaint(
                size: const Size(100, 100),
                painter: BasicShapesPainter(),
              ),
            ],
          ),
          CardComponents(
            content: 'Gradient Circle',
            components: [
              CustomPaint(
                size: const Size(120, 120),
                painter: GradientCirclePainter(),
              ),
            ],
          ),
          CardComponents(
            content: 'Line Chart',
            components: [
              CustomPaint(
                size: const Size(200, 100),
                painter: LineChartPainter(),
              ),
            ],
          ),
          CardComponents(
            content: 'Animated Wave',
            components: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return CustomPaint(
                    size: const Size(200, 80),
                    painter: WavePainter(_animation.value),
                  );
                },
              ),
            ],
          ),
          CardComponents(
            content: 'Progress Ring',
            components: [
              CustomPaint(
                size: const Size(100, 100),
                painter: ProgressRingPainter(0.7),
              ),
            ],
          ),
          CardComponents(
            content: 'Star Shape',
            components: [
              CustomPaint(
                size: const Size(100, 100),
                painter: StarPainter(),
              ),
            ],
          ),
          CardComponents(
            content: 'Interactive Canvas',
            components: [
              Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const InteractiveCanvas(),
              ),
            ],
          ),
          CardComponents(
            content: 'Clipper Examples',
            components: [
              ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Triangle',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 100,
                  height: 60,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'Rounded',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
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

class BasicShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Draw circle
    canvas.drawCircle(
      Offset(size.width * 0.25, size.height * 0.25),
      20,
      paint,
    );

    // Draw rectangle
    paint.color = Colors.red;
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.6, size.height * 0.1, 30, 30),
      paint,
    );

    // Draw line
    paint
      ..color = Colors.green
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(0, size.height * 0.7),
      Offset(size.width, size.height * 0.7),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GradientCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.purple, Colors.pink, Colors.orange],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ));

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final points = [
      Offset(0, size.height * 0.8),
      Offset(size.width * 0.2, size.height * 0.4),
      Offset(size.width * 0.4, size.height * 0.6),
      Offset(size.width * 0.6, size.height * 0.2),
      Offset(size.width * 0.8, size.height * 0.5),
      Offset(size.width, size.height * 0.3),
    ];

    final path = Path();
    path.moveTo(points[0].dx, points[0].dy);

    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(path, paint);

    // Draw points
    paint.style = PaintingStyle.fill;
    for (final point in points) {
      canvas.drawCircle(point, 3, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WavePainter extends CustomPainter {
  final double animationValue;

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final waveHeight = size.height * 0.3;
    final frequency = 2;

    path.moveTo(0, size.height / 2);

    for (double x = 0; x <= size.width; x++) {
      final y = size.height / 2 +
          waveHeight *
              math.sin(
                  (x / size.width * frequency * 2 * math.pi) + animationValue);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ProgressRingPainter extends CustomPainter {
  final double progress;

  ProgressRingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Background ring
    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress ring
    final progressPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );

    // Progress text
    final textPainter = TextPainter(
      text: TextSpan(
        text: '${(progress * 100).toInt()}%',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2 - 5;
    final innerRadius = outerRadius * 0.4;

    final path = Path();

    for (int i = 0; i < 5; i++) {
      final outerAngle = (i * 2 * math.pi / 5) - math.pi / 2;
      final innerAngle = ((i + 0.5) * 2 * math.pi / 5) - math.pi / 2;

      final outerPoint = Offset(
        center.dx + outerRadius * math.cos(outerAngle),
        center.dy + outerRadius * math.sin(outerAngle),
      );

      final innerPoint = Offset(
        center.dx + innerRadius * math.cos(innerAngle),
        center.dy + innerRadius * math.sin(innerAngle),
      );

      if (i == 0) {
        path.moveTo(outerPoint.dx, outerPoint.dy);
      } else {
        path.lineTo(outerPoint.dx, outerPoint.dy);
      }

      path.lineTo(innerPoint.dx, innerPoint.dy);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class InteractiveCanvas extends StatefulWidget {
  const InteractiveCanvas({super.key});

  @override
  State<InteractiveCanvas> createState() => _InteractiveCanvasState();
}

class _InteractiveCanvasState extends State<InteractiveCanvas> {
  List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          points.add(details.localPosition);
        });
      },
      onPanEnd: (details) {
        setState(() {
          points.add(Offset.infinite);
        });
      },
      child: CustomPaint(
        painter: DrawingPainter(points),
        size: Size.infinite,
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset> points;

  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.infinite && points[i + 1] != Offset.infinite) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class TriangleClipper extends CustomClipper<Path> {
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
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
