Map<String, String> platformSourceCodes = {
  // Platform Detection codes
  'Platform-Detection': '''
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

Widget build(BuildContext context) {
  return Column(
    children: [
      Text('Current Platform: \${_getCurrentPlatform()}'),
      Text('Is Mobile: \${_isMobile()}'),
      Text('Is Desktop: \${_isDesktop()}'),
      Text('Is Web: \$kIsWeb'),
    ],
  );
}

String _getCurrentPlatform() {
  if (kIsWeb) return 'Web';
  if (Platform.isAndroid) return 'Android';
  if (Platform.isIOS) return 'iOS';
  if (Platform.isWindows) return 'Windows';
  if (Platform.isMacOS) return 'macOS';
  if (Platform.isLinux) return 'Linux';
  return 'Unknown';
}

bool _isMobile() {
  if (kIsWeb) return false;
  return Platform.isAndroid || Platform.isIOS;
}

bool _isDesktop() {
  if (kIsWeb) return false;
  return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
}''',

  // Adaptive Widgets codes
  'Switch-Adaptive': '''
bool switchValue = false;

Switch.adaptive(
  value: switchValue,
  onChanged: (bool value) {
    setState(() {
      switchValue = value;
    });
  },
)

// On iOS: Shows CupertinoSwitch
// On Android: Shows Material Switch''',

  'Slider-Adaptive': '''
double sliderValue = 0.5;

Slider.adaptive(
  value: sliderValue,
  onChanged: (double value) {
    setState(() {
      sliderValue = value;
    });
  },
)

// Automatically adapts to platform style''',

  'CircularProgressIndicator-Adaptive': '''
CircularProgressIndicator.adaptive()

// On iOS: Shows CupertinoActivityIndicator
// On Android: Shows Material CircularProgressIndicator''',

  // Theme-based Platform Adaptation codes
  'Theme-Platform-Adaptive': '''
Widget build(BuildContext context) {
  final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
  
  return Column(
    children: [
      if (isIOS)
        CupertinoButton(
          onPressed: () {},
          child: Text('iOS Button'),
        )
      else
        ElevatedButton(
          onPressed: () {},
          child: Text('Material Button'),
        ),
      
      if (isIOS)
        CupertinoTextField(
          placeholder: 'iOS Text Field',
        )
      else
        TextField(
          decoration: InputDecoration(
            labelText: 'Material Text Field',
          ),
        ),
    ],
  );
}''',

  // Platform-specific Icons codes
  'Icons-Platform-Specific': '''
Widget build(BuildContext context) {
  final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
  
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        children: [
          Icon(isIOS ? CupertinoIcons.heart : Icons.favorite),
          Text('Heart'),
        ],
      ),
      Column(
        children: [
          Icon(isIOS ? CupertinoIcons.share : Icons.share),
          Text('Share'),
        ],
      ),
      Column(
        children: [
          Icon(isIOS ? CupertinoIcons.settings : Icons.settings),
          Text('Settings'),
        ],
      ),
    ],
  );
}''',

  // SafeArea codes
  'SafeArea-Basic': '''
SafeArea(
  child: Scaffold(
    appBar: AppBar(
      title: Text('SafeArea Example'),
    ),
    body: Container(
      color: Colors.blue[100],
      child: Center(
        child: Text('Content inside SafeArea'),
      ),
    ),
  ),
)''',

  'SafeArea-Selective': '''
SafeArea(
  top: true,     // Avoid top notch/status bar
  bottom: false, // Allow content behind bottom indicator
  left: true,    // Avoid left edge
  right: true,   // Avoid right edge
  child: Container(
    color: Colors.green[100],
    child: Column(
      children: [
        Text('Top is safe'),
        Spacer(),
        Text('Bottom extends behind home indicator'),
      ],
    ),
  ),
)''',

  // Platform-specific Navigation codes
  'Navigation-Platform-Adaptive': '''
Widget build(BuildContext context) {
  final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
  
  if (isIOS) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) => _buildTabContent(index),
        );
      },
    );
  } else {
    return Scaffold(
      appBar: AppBar(title: Text('Material App')),
      body: _buildTabContent(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}''',

  // Device Info codes
  'Device-Info': '''
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> getDeviceInfo() async {
  final Map<String, dynamic> deviceInfo = {};
  
  try {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      deviceInfo['model'] = androidInfo.model;
      deviceInfo['version'] = androidInfo.version.release;
      deviceInfo['sdk'] = androidInfo.version.sdkInt;
    } else if (Platform.isIOS) {
      final iosInfo = await DeviceInfoPlugin().iosInfo;
      deviceInfo['model'] = iosInfo.model;
      deviceInfo['version'] = iosInfo.systemVersion;
      deviceInfo['name'] = iosInfo.name;
    }
  } on PlatformException {
    deviceInfo['error'] = 'Failed to get device info';
  }
  
  return deviceInfo;
}

// Usage:
FutureBuilder<Map<String, dynamic>>(
  future: getDeviceInfo(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Column(
        children: snapshot.data!.entries.map((entry) {
          return Text('\${entry.key}: \${entry.value}');
        }).toList(),
      );
    }
    return CircularProgressIndicator();
  },
)''',

  // Platform Channels codes
  'Platform-Channel': '''
import 'package:flutter/services.dart';

class PlatformChannel {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  
  Future<String> getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at \$result %.';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '\${e.message}'.";
    }
    return batteryLevel;
  }
}

// Usage:
ElevatedButton(
  onPressed: () async {
    final batteryLevel = await PlatformChannel().getBatteryLevel();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(batteryLevel)),
    );
  },
  child: Text('Get Battery Level'),
)''',

  // Responsive Design codes
  'Responsive-Breakpoints': '''
class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}

Widget build(BuildContext context) {
  return Scaffold(
    body: ResponsiveWidget(
      mobile: MobileLayout(),
      tablet: TabletLayout(),
      desktop: DesktopLayout(),
    ),
  );
}

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else if (constraints.maxWidth >= 650) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}''',

  // Haptic Feedback codes
  'Haptic-Feedback': '''
import 'package:flutter/services.dart';

Column(
  children: [
    ElevatedButton(
      onPressed: () {
        HapticFeedback.lightImpact();
      },
      child: Text('Light Haptic'),
    ),
    ElevatedButton(
      onPressed: () {
        HapticFeedback.mediumImpact();
      },
      child: Text('Medium Haptic'),
    ),
    ElevatedButton(
      onPressed: () {
        HapticFeedback.heavyImpact();
      },
      child: Text('Heavy Haptic'),
    ),
    ElevatedButton(
      onPressed: () {
        HapticFeedback.selectionClick();
      },
      child: Text('Selection Click'),
    ),
    ElevatedButton(
      onPressed: () {
        HapticFeedback.vibrate();
      },
      child: Text('Vibrate'),
    ),
  ],
)''',
};
