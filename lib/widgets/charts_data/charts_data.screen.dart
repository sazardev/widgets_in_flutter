import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class ChartsDataScreen extends StatefulWidget {
  const ChartsDataScreen({super.key});

  @override
  State<ChartsDataScreen> createState() => _ChartsDataScreenState();
}

class _ChartsDataScreenState extends State<ChartsDataScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  double _progressValue = 0.7;
  List<double> _chartData = [30, 50, 20, 80, 40, 70, 60];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charts & Data Visualization'),
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
            content: 'Progress Indicators',
            components: [
              Column(
                children: [
                  Text('Progress: ${(_progressValue * 100).round()}%'),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: _progressValue),
                  const SizedBox(height: 16),
                  CircularProgressIndicator(value: _progressValue),
                  const SizedBox(height: 16),
                  Slider(
                    value: _progressValue,
                    onChanged: (value) =>
                        setState(() => _progressValue = value),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Custom Progress Charts',
            components: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCircularChart(),
                  _buildSemiCircularChart(),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Bar Charts',
            components: [
              SizedBox(
                height: 200,
                child: CustomPaint(
                  size: const Size(double.infinity, 200),
                  painter: _BarChartPainter(_chartData),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _randomizeData,
                    child: const Text('Randomize'),
                  ),
                  ElevatedButton(
                    onPressed: _resetData,
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Line Charts',
            components: [
              SizedBox(
                height: 200,
                child: CustomPaint(
                  size: const Size(double.infinity, 200),
                  painter: _LineChartPainter(_chartData),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Pie Charts',
            components: [
              SizedBox(
                height: 200,
                width: 200,
                child: CustomPaint(
                  size: const Size(200, 200),
                  painter: _PieChartPainter(_chartData),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Data Tables',
            components: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Age')),
                    DataColumn(label: Text('Score')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: [
                    DataRow(cells: [
                      const DataCell(Text('Alice')),
                      const DataCell(Text('25')),
                      DataCell(Text('${_chartData[0].round()}')),
                      const DataCell(Icon(Icons.check, color: Colors.green)),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Bob')),
                      const DataCell(Text('30')),
                      DataCell(Text('${_chartData[1].round()}')),
                      const DataCell(Icon(Icons.close, color: Colors.red)),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Charlie')),
                      const DataCell(Text('28')),
                      DataCell(Text('${_chartData[2].round()}')),
                      const DataCell(Icon(Icons.check, color: Colors.green)),
                    ]),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Gauge Charts',
            components: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildGaugeChart(),
                  _buildSpeedometer(),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Animated Charts',
            components: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return SizedBox(
                    height: 150,
                    child: CustomPaint(
                      size: const Size(double.infinity, 150),
                      painter: _AnimatedBarChartPainter(
                        _chartData,
                        _animationController.value,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          CardComponents(
            content: 'Heat Map',
            components: [
              _buildHeatMap(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }

  Widget _buildCircularChart() {
    return SizedBox(
      width: 100,
      height: 100,
      child: CustomPaint(
        painter: _CircularChartPainter(_progressValue),
      ),
    );
  }

  Widget _buildSemiCircularChart() {
    return SizedBox(
      width: 100,
      height: 100,
      child: CustomPaint(
        painter: _SemiCircularChartPainter(_progressValue),
      ),
    );
  }

  Widget _buildGaugeChart() {
    return SizedBox(
      width: 120,
      height: 120,
      child: CustomPaint(
        painter: _GaugeChartPainter(_progressValue),
      ),
    );
  }

  Widget _buildSpeedometer() {
    return SizedBox(
      width: 120,
      height: 120,
      child: CustomPaint(
        painter: _SpeedometerPainter(_progressValue),
      ),
    );
  }

  Widget _buildHeatMap() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: 35,
        itemBuilder: (context, index) {
          final intensity = (math.sin(index * 0.5) + 1) / 2;
          return Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(intensity),
              borderRadius: BorderRadius.circular(4),
            ),
          );
        },
      ),
    );
  }

  void _randomizeData() {
    setState(() {
      _chartData =
          List.generate(7, (index) => math.Random().nextDouble() * 100);
    });
  }

  void _resetData() {
    setState(() {
      _chartData = [30, 50, 20, 80, 40, 70, 60];
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _CircularChartPainter extends CustomPainter {
  final double progress;

  _CircularChartPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _SemiCircularChartPainter extends CustomPainter {
  final double progress;

  _SemiCircularChartPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height - 10);
    final radius = size.width / 2 - 10;

    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      backgroundPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _BarChartPainter extends CustomPainter {
  final List<double> data;

  _BarChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final barWidth = size.width / data.length - 10;
    final maxValue = data.reduce(math.max);

    for (int i = 0; i < data.length; i++) {
      final barHeight = (data[i] / maxValue) * (size.height - 40);
      final x = i * (barWidth + 10) + 5;
      final y = size.height - barHeight - 20;

      paint.color = Colors.primaries[i % Colors.primaries.length];
      canvas.drawRect(
        Rect.fromLTWH(x, y, barWidth, barHeight),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _LineChartPainter extends CustomPainter {
  final List<double> data;

  _LineChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    final stepX = size.width / (data.length - 1);
    final maxValue = data.reduce(math.max);

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final y = size.height - (data[i] / maxValue) * (size.height - 40) - 20;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      // Draw points
      canvas.drawCircle(Offset(x, y), 4, Paint()..color = Colors.red);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _PieChartPainter extends CustomPainter {
  final List<double> data;

  _PieChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;
    final total = data.reduce((a, b) => a + b);

    double startAngle = -math.pi / 2;

    for (int i = 0; i < data.length; i++) {
      final sweepAngle = (data[i] / total) * 2 * math.pi;
      final paint = Paint()
        ..color = Colors.primaries[i % Colors.primaries.length]
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _GaugeChartPainter extends CustomPainter {
  final double value;

  _GaugeChartPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Background arc
    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      backgroundPaint,
    );

    // Progress arc
    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.red, Colors.yellow, Colors.green],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi * value,
      false,
      progressPaint,
    );

    // Needle
    final needleAngle = math.pi + (math.pi * value);
    final needleEnd = Offset(
      center.dx + radius * 0.8 * math.cos(needleAngle),
      center.dy + radius * 0.8 * math.sin(needleAngle),
    );

    final needlePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3;

    canvas.drawLine(center, needleEnd, needlePaint);
    canvas.drawCircle(center, 6, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _SpeedometerPainter extends CustomPainter {
  final double value;

  _SpeedometerPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 15;

    // Outer ring
    final outerPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, outerPaint);

    // Speed segments
    final segmentPaint = Paint()
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    for (int i = 0; i <= 10; i++) {
      final angle = math.pi + (math.pi * i / 10);
      final color = i <= (value * 10) ? Colors.blue : Colors.grey.shade300;
      segmentPaint.color = color;

      final startRadius = radius - 10;
      final endRadius = radius - 20;

      final start = Offset(
        center.dx + startRadius * math.cos(angle),
        center.dy + startRadius * math.sin(angle),
      );
      final end = Offset(
        center.dx + endRadius * math.cos(angle),
        center.dy + endRadius * math.sin(angle),
      );

      canvas.drawLine(start, end, segmentPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _AnimatedBarChartPainter extends CustomPainter {
  final List<double> data;
  final double animation;

  _AnimatedBarChartPainter(this.data, this.animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final barWidth = size.width / data.length - 10;
    final maxValue = data.reduce(math.max);

    for (int i = 0; i < data.length; i++) {
      final animatedHeight =
          (data[i] / maxValue) * (size.height - 40) * animation;
      final x = i * (barWidth + 10) + 5;
      final y = size.height - animatedHeight - 20;

      paint.color = Colors.primaries[i % Colors.primaries.length];
      canvas.drawRect(
        Rect.fromLTWH(x, y, barWidth, animatedHeight),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
