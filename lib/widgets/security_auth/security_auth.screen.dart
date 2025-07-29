import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class SecurityAuthScreen extends StatefulWidget {
  const SecurityAuthScreen({super.key});

  @override
  State<SecurityAuthScreen> createState() => _SecurityAuthScreenState();
}

class _SecurityAuthScreenState extends State<SecurityAuthScreen>
    with TickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _pinController = TextEditingController();
  final _otpController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isBiometricEnabled = false;
  bool _isTwoFactorEnabled = false;
  bool _isAuthenticated = false;
  String _authMethod = 'password';
  String _securityLevel = 'medium';
  int _loginAttempts = 0;
  late AnimationController _shakeController;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _progressController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security & Authentication'),
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
            content: 'Authentication Forms',
            components: [
              Column(
                children: [
                  AnimatedBuilder(
                    animation: _shakeController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          10 * math.sin(_shakeController.value * math.pi * 4),
                          0,
                        ),
                        child: child,
                      );
                    },
                    child: Column(
                      children: [
                        TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _authenticate,
                      child: const Text('Login'),
                    ),
                  ),
                  if (_loginAttempts > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Failed attempts: $_loginAttempts/5',
                        style: TextStyle(
                          color:
                              _loginAttempts >= 3 ? Colors.red : Colors.orange,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Biometric Authentication',
            components: [
              Column(
                children: [
                  SwitchListTile(
                    title: const Text('Biometric Login'),
                    subtitle: const Text('Use fingerprint or face recognition'),
                    value: _isBiometricEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isBiometricEnabled = value;
                      });
                    },
                    secondary: const Icon(Icons.fingerprint),
                  ),
                  if (_isBiometricEnabled) ...[
                    const Divider(),
                    ListTile(
                      title: const Text('Setup Biometric'),
                      subtitle:
                          const Text('Configure fingerprint authentication'),
                      leading: const Icon(Icons.fingerprint),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: _setupBiometric,
                    ),
                    ListTile(
                      title: const Text('Face Recognition'),
                      subtitle: const Text('Setup face unlock'),
                      leading: const Icon(Icons.face),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: _setupFaceRecognition,
                    ),
                  ],
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Two-Factor Authentication',
            components: [
              Column(
                children: [
                  SwitchListTile(
                    title: const Text('Two-Factor Authentication'),
                    subtitle: const Text('Extra security with SMS or app'),
                    value: _isTwoFactorEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isTwoFactorEnabled = value;
                      });
                    },
                    secondary: const Icon(Icons.security),
                  ),
                  if (_isTwoFactorEnabled) ...[
                    const SizedBox(height: 16),
                    TextField(
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                      decoration: const InputDecoration(
                        labelText: 'Enter OTP',
                        hintText: '123456',
                        border: OutlineInputBorder(),
                        counterText: '',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _resendOTP,
                            child: const Text('Resend OTP'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _verifyOTP,
                            child: const Text('Verify'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'PIN Security',
            components: [
              Column(
                children: [
                  Text(
                    'Enter PIN',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  _buildPinInput(),
                  const SizedBox(height: 24),
                  _buildPinKeypad(),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Security Level Indicator',
            components: [
              Column(
                children: [
                  Row(
                    children: [
                      const Text('Security Level: '),
                      Expanded(
                        child: DropdownButton<String>(
                          value: _securityLevel,
                          isExpanded: true,
                          items:
                              ['low', 'medium', 'high', 'maximum'].map((level) {
                            return DropdownMenuItem(
                              value: level,
                              child: Text(level.toUpperCase()),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _securityLevel = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildSecurityIndicator(),
                  const SizedBox(height: 16),
                  _buildSecurityFeatures(),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Session Management',
            components: [
              Column(
                children: [
                  ListTile(
                    title: const Text('Active Sessions'),
                    subtitle: const Text('Manage logged in devices'),
                    leading: const Icon(Icons.devices),
                    trailing: const Badge(
                      label: Text('3'),
                      child: Icon(Icons.arrow_forward),
                    ),
                    onTap: _showActiveSessions,
                  ),
                  ListTile(
                    title: const Text('Auto Logout'),
                    subtitle: const Text('Logout after 15 minutes'),
                    leading: const Icon(Icons.timer),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  ListTile(
                    title: const Text('Secure Logout'),
                    subtitle: const Text('Clear all data and sessions'),
                    leading: const Icon(Icons.logout),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: _secureLogout,
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Encryption & Data Protection',
            components: [
              Column(
                children: [
                  AnimatedBuilder(
                    animation: _progressController,
                    builder: (context, child) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.lock),
                              const SizedBox(width: 8),
                              const Text('Encryption Status: '),
                              Text(
                                _progressController.value < 1.0
                                    ? 'Encrypting...'
                                    : 'Secured',
                                style: TextStyle(
                                  color: _progressController.value < 1.0
                                      ? Colors.orange
                                      : Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: _progressController.value,
                            backgroundColor: Colors.grey.shade300,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              _progressController.value < 1.0
                                  ? Colors.orange
                                  : Colors.green,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    title: const Text('Data Encryption'),
                    subtitle: const Text('AES-256 encryption enabled'),
                    leading: const Icon(Icons.enhanced_encryption),
                    trailing:
                        const Icon(Icons.check_circle, color: Colors.green),
                  ),
                  ListTile(
                    title: const Text('Secure Storage'),
                    subtitle: const Text('Encrypted local storage'),
                    leading: const Icon(Icons.storage),
                    trailing:
                        const Icon(Icons.check_circle, color: Colors.green),
                  ),
                  ListTile(
                    title: const Text('SSL/TLS'),
                    subtitle: const Text('Secure network communication'),
                    leading: const Icon(Icons.https),
                    trailing:
                        const Icon(Icons.check_circle, color: Colors.green),
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

  Widget _buildPinInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              index < _pinController.text.length ? '●' : '',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildPinKeypad() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 1.5,
      children: [
        ...List.generate(9, (index) {
          final number = index + 1;
          return _buildKeypadButton(number.toString());
        }),
        _buildKeypadButton(''),
        _buildKeypadButton('0'),
        _buildKeypadButton('⌫', isDelete: true),
      ],
    );
  }

  Widget _buildKeypadButton(String text, {bool isDelete = false}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: text.isEmpty
            ? null
            : () {
                if (isDelete) {
                  if (_pinController.text.isNotEmpty) {
                    _pinController.text = _pinController.text
                        .substring(0, _pinController.text.length - 1);
                    setState(() {});
                  }
                } else {
                  if (_pinController.text.length < 4) {
                    _pinController.text += text;
                    setState(() {});

                    if (_pinController.text.length == 4) {
                      _verifyPin();
                    }
                  }
                }
              },
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildSecurityIndicator() {
    final colors = {
      'low': Colors.red,
      'medium': Colors.orange,
      'high': Colors.blue,
      'maximum': Colors.green,
    };

    final levels = ['low', 'medium', 'high', 'maximum'];
    final currentIndex = levels.indexOf(_securityLevel);

    return Row(
      children: levels.asMap().entries.map((entry) {
        final index = entry.key;
        final level = entry.value;
        final isActive = index <= currentIndex;

        return Expanded(
          child: Container(
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: isActive ? colors[level] : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSecurityFeatures() {
    final features = {
      'low': ['Basic password'],
      'medium': ['Password', 'Session timeout'],
      'high': ['Password', 'Two-factor auth', 'Encryption'],
      'maximum': [
        'Password',
        'Biometric',
        'Two-factor',
        'Encryption',
        'Advanced monitoring'
      ],
    };

    return Column(
      children: features[_securityLevel]!.map((feature) {
        return ListTile(
          dense: true,
          leading: const Icon(Icons.check, color: Colors.green, size: 16),
          title: Text(feature, style: const TextStyle(fontSize: 14)),
        );
      }).toList(),
    );
  }

  void _authenticate() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      _shakeController.forward().then((_) => _shakeController.reset());
      setState(() {
        _loginAttempts++;
      });
      return;
    }

    // Simulate authentication
    if (_usernameController.text == 'demo' &&
        _passwordController.text == 'password') {
      setState(() {
        _isAuthenticated = true;
        _loginAttempts = 0;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Authentication successful!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      _shakeController.forward().then((_) => _shakeController.reset());
      setState(() {
        _loginAttempts++;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid credentials'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _setupBiometric() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Setup Biometric'),
        content: const Text('Place your finger on the sensor to register.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Biometric setup completed')),
              );
            },
            child: const Text('Complete'),
          ),
        ],
      ),
    );
  }

  void _setupFaceRecognition() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Face Recognition'),
        content: const Text('Position your face in the camera frame.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Face recognition setup completed')),
              );
            },
            child: const Text('Complete'),
          ),
        ],
      ),
    );
  }

  void _resendOTP() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP sent to your device')),
    );
  }

  void _verifyOTP() {
    if (_otpController.text.length == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP verified successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid OTP'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _verifyPin() {
    if (_pinController.text == '1234') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('PIN verified!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      _shakeController.forward().then((_) => _shakeController.reset());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect PIN'),
          backgroundColor: Colors.red,
        ),
      );
    }
    _pinController.clear();
    setState(() {});
  }

  void _showActiveSessions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Active Sessions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.phone_android),
              title: const Text('Mobile App'),
              subtitle: const Text('Last active: 2 minutes ago'),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Web Browser'),
              subtitle: const Text('Last active: 1 hour ago'),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.tablet),
              title: const Text('Tablet'),
              subtitle: const Text('Last active: 1 day ago'),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _secureLogout() {
    _progressController.forward();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Secure Logout'),
        content: const Text(
            'This will clear all local data and log you out from all devices.'),
        actions: [
          TextButton(
            onPressed: () {
              _progressController.reset();
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Secure logout completed')),
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _pinController.dispose();
    _otpController.dispose();
    _shakeController.dispose();
    _progressController.dispose();
    super.dispose();
  }
}
