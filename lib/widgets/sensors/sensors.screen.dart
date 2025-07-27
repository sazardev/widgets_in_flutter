import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class SensorsScreen extends StatefulWidget {
  const SensorsScreen({super.key});

  @override
  State<SensorsScreen> createState() => _SensorsScreenState();
}

class _SensorsScreenState extends State<SensorsScreen>
    with TickerProviderStateMixin {
  late AnimationController _batteryController;
  late AnimationController _wifiController;
  late AnimationController _locationController;

  final double _batteryLevel = 0.75;
  bool _isCharging = false;
  String _connectionType = 'WiFi';
  int _signalStrength = 4;
  bool _locationEnabled = true;
  String _deviceInfo = 'Loading...';
  bool _biometricAvailable = false;
  String _accelerometerData = '0.0, 0.0, 0.0';
  String _gyroscopeData = '0.0, 0.0, 0.0';
  double _brightness = 0.5;

  @override
  void initState() {
    super.initState();
    _batteryController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _wifiController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();

    _locationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _initializeDeviceInfo();
  }

  @override
  void dispose() {
    _batteryController.dispose();
    _wifiController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _initializeDeviceInfo() {
    // Simulate device info loading
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _deviceInfo = 'Flutter Web Device';
          _biometricAvailable = true;
        });
      }
    });

    // Simulate sensor data updates
    _startSensorSimulation();
  }

  void _startSensorSimulation() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        setState(() {
          _accelerometerData =
              '${((-10 + (20 * (DateTime.now().millisecond / 1000))).toStringAsFixed(2))}, '
              '${((-5 + (10 * (DateTime.now().second / 60))).toStringAsFixed(2))}, '
              '${((9.8 + (2 * (DateTime.now().minute / 60))).toStringAsFixed(2))}';

          _gyroscopeData =
              '${((-2 + (4 * (DateTime.now().millisecond / 1000))).toStringAsFixed(2))}, '
              '${((-1 + (2 * (DateTime.now().second / 60))).toStringAsFixed(2))}, '
              '${((-0.5 + (1 * (DateTime.now().minute / 60))).toStringAsFixed(2))}';
        });
      }
      return mounted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensors & Device Info'),
        actions: [
          ThemeMaterial(isLandscape: false),
          ThemeBrightness(isLandscape: false),
          ThemeSelector(isLandscape: false),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        children: [
          // Battery Information
          CardComponents(
            content: 'Battery & Power',
            components: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade100, Colors.green.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Battery Level',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          '${(_batteryLevel * 100).toInt()}%',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade700,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _batteryController,
                          builder: (context, child) {
                            return Container(
                              width: MediaQuery.of(context).size.width *
                                  0.7 *
                                  _batteryLevel,
                              height: 20,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green.shade400,
                                    Colors.green.shade600,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          _isCharging
                              ? Icons.battery_charging_full
                              : Icons.battery_std,
                          color: Colors.green.shade600,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _isCharging ? 'Charging' : 'On Battery',
                          style: TextStyle(color: Colors.green.shade700),
                        ),
                        const Spacer(),
                        Switch(
                          value: _isCharging,
                          onChanged: (value) =>
                              setState(() => _isCharging = value),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Network Information
          CardComponents(
            content: 'Network & Connectivity',
            components: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade100, Colors.blue.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade300),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AnimatedBuilder(
                          animation: _wifiController,
                          builder: (context, child) {
                            return Icon(
                              Icons.wifi,
                              color: Colors.blue.withOpacity(
                                  0.5 + 0.5 * _wifiController.value),
                              size: 32,
                            );
                          },
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _connectionType,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Signal Strength: $_signalStrength/5',
                              style: TextStyle(color: Colors.blue.shade700),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: List.generate(5, (index) {
                            return Container(
                              width: 4,
                              height: 8 + (index * 4),
                              margin: const EdgeInsets.only(right: 2),
                              decoration: BoxDecoration(
                                color: index < _signalStrength
                                    ? Colors.blue.shade600
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButton<String>(
                            value: _connectionType,
                            isExpanded: true,
                            items: ['WiFi', '4G', '5G', 'Ethernet', 'Offline']
                                .map((type) => DropdownMenuItem(
                                      value: type,
                                      child: Text(type),
                                    ))
                                .toList(),
                            onChanged: (value) =>
                                setState(() => _connectionType = value!),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Slider(
                            value: _signalStrength.toDouble(),
                            min: 0,
                            max: 5,
                            divisions: 5,
                            label: '$_signalStrength',
                            onChanged: (value) =>
                                setState(() => _signalStrength = value.toInt()),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Location Services
          CardComponents(
            content: 'Location Services',
            components: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange.shade100, Colors.orange.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange.shade300),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AnimatedBuilder(
                          animation: _locationController,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: 1.0 + 0.1 * _locationController.value,
                              child: Icon(
                                Icons.location_on,
                                color: _locationEnabled
                                    ? Colors.orange.shade600
                                    : Colors.grey,
                                size: 32,
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location Services',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                _locationEnabled ? 'Enabled' : 'Disabled',
                                style: TextStyle(
                                  color: _locationEnabled
                                      ? Colors.orange.shade700
                                      : Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: _locationEnabled,
                          onChanged: (value) =>
                              setState(() => _locationEnabled = value),
                        ),
                      ],
                    ),
                    if (_locationEnabled) ...[
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.orange.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Location:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange.shade700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Lat: 37.7749, Lng: -122.4194',
                              style: TextStyle(color: Colors.orange.shade600),
                            ),
                            Text(
                              'San Francisco, CA',
                              style: TextStyle(color: Colors.orange.shade600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),

          // Device Sensors
          CardComponents(
            content: 'Device Sensors',
            components: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade100, Colors.purple.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.purple.shade300),
                ),
                child: Column(
                  children: [
                    // Accelerometer
                    Row(
                      children: [
                        Icon(Icons.vibration, color: Colors.purple.shade600),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Accelerometer (m/s²)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple.shade700,
                                ),
                              ),
                              Text(
                                'X: ${_accelerometerData.split(', ')[0]}',
                                style: TextStyle(color: Colors.purple.shade600),
                              ),
                              Text(
                                'Y: ${_accelerometerData.split(', ')[1]}',
                                style: TextStyle(color: Colors.purple.shade600),
                              ),
                              Text(
                                'Z: ${_accelerometerData.split(', ')[2]}',
                                style: TextStyle(color: Colors.purple.shade600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Gyroscope
                    Row(
                      children: [
                        Icon(Icons.threesixty, color: Colors.purple.shade600),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gyroscope (rad/s)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple.shade700,
                                ),
                              ),
                              Text(
                                'X: ${_gyroscopeData.split(', ')[0]}',
                                style: TextStyle(color: Colors.purple.shade600),
                              ),
                              Text(
                                'Y: ${_gyroscopeData.split(', ')[1]}',
                                style: TextStyle(color: Colors.purple.shade600),
                              ),
                              Text(
                                'Z: ${_gyroscopeData.split(', ')[2]}',
                                style: TextStyle(color: Colors.purple.shade600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Device Settings
          CardComponents(
            content: 'Device Settings',
            components: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade100, Colors.teal.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.teal.shade300),
                ),
                child: Column(
                  children: [
                    // Brightness Control
                    Row(
                      children: [
                        Icon(Icons.brightness_6, color: Colors.teal.shade600),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Screen Brightness',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal.shade700,
                                ),
                              ),
                              Slider(
                                value: _brightness,
                                onChanged: (value) =>
                                    setState(() => _brightness = value),
                                activeColor: Colors.teal.shade600,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${(_brightness * 100).toInt()}%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Biometric Authentication
                    Row(
                      children: [
                        Icon(
                          Icons.fingerprint,
                          color: _biometricAvailable
                              ? Colors.teal.shade600
                              : Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Biometric Authentication',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal.shade700,
                                ),
                              ),
                              Text(
                                _biometricAvailable
                                    ? 'Available'
                                    : 'Not Available',
                                style: TextStyle(
                                  color: _biometricAvailable
                                      ? Colors.teal.shade600
                                      : Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_biometricAvailable)
                          ElevatedButton.icon(
                            onPressed: () {
                              // Simulate biometric authentication
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Biometric Authentication'),
                                  content: const Text(
                                      'Touch the sensor to authenticate'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel'),
                                    ),
                                    FilledButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Authentication successful!'),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                      },
                                      child: const Text('Authenticate'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.touch_app),
                            label: const Text('Test'),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Device Information
          CardComponents(
            content: 'Device Information',
            components: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo.shade100, Colors.indigo.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.indigo.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.phone_android,
                            color: Colors.indigo.shade600),
                        const SizedBox(width: 12),
                        Text(
                          'Device Information',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo.shade700,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Device Model', _deviceInfo),
                    _buildInfoRow('Platform', 'Flutter Web'),
                    _buildInfoRow('Screen Resolution',
                        '${MediaQuery.of(context).size.width.toInt()} x ${MediaQuery.of(context).size.height.toInt()}'),
                    _buildInfoRow('Pixel Ratio',
                        '${MediaQuery.of(context).devicePixelRatio}x'),
                    _buildInfoRow(
                        'Text Scale', '${MediaQuery.of(context).textScaler}'),
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.indigo.shade700,
            ),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.indigo.shade600),
          ),
        ],
      ),
    );
  }
}
