import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class AccessibilityScreen extends StatefulWidget {
  const AccessibilityScreen({super.key});

  @override
  State<AccessibilityScreen> createState() => _AccessibilityScreenState();
}

class _AccessibilityScreenState extends State<AccessibilityScreen> {
  bool _isEnabled = true;
  double _sliderValue = 50;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility & Semantics'),
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
            content: 'Semantics Widget',
            components: [
              Semantics(
                label: 'Profile picture',
                hint: 'Double tap to view full size',
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile picture tapped')),
                    );
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Screen Reader Labels',
            components: [
              Row(
                children: [
                  Semantics(
                    label: 'Favorite button',
                    hint: 'Add to favorites',
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ),
                  Semantics(
                    label: 'Share button',
                    hint: 'Share this content',
                    child: IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ),
                  Semantics(
                    label: 'Settings button',
                    hint: 'Open settings menu',
                    child: IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Form Accessibility',
            components: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                textInputAction: TextInputAction.done,
              ),
            ],
          ),
          CardComponents(
            content: 'Accessible Switches & Sliders',
            components: [
              Row(
                children: [
                  const Text('Enable notifications'),
                  const Spacer(),
                  Semantics(
                    label: 'Notification toggle',
                    hint:
                        _isEnabled ? 'Currently enabled' : 'Currently disabled',
                    child: Switch(
                      value: _isEnabled,
                      onChanged: (value) {
                        setState(() => _isEnabled = value);
                        // Announce state change
                        SemanticsService.announce(
                          _isEnabled
                              ? 'Notifications enabled'
                              : 'Notifications disabled',
                          TextDirection.ltr,
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Volume Level'),
                  Semantics(
                    label: 'Volume slider',
                    value: '${_sliderValue.round()} percent',
                    hint: 'Adjust volume level',
                    child: Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      onChanged: (value) {
                        setState(() => _sliderValue = value);
                      },
                      onChangeEnd: (value) {
                        SemanticsService.announce(
                          'Volume set to ${value.round()} percent',
                          TextDirection.ltr,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Accessible Navigation',
            components: [
              Container(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: Semantics(
                        selected: _selectedIndex == 0,
                        button: true,
                        label: 'Home tab',
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedIndex = 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedIndex == 0
                                  ? Colors.blue.shade100
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.home),
                                Text('Home'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Semantics(
                        selected: _selectedIndex == 1,
                        button: true,
                        label: 'Search tab',
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedIndex = 1),
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedIndex == 1
                                  ? Colors.blue.shade100
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.search),
                                Text('Search'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Semantics(
                        selected: _selectedIndex == 2,
                        button: true,
                        label: 'Profile tab',
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedIndex = 2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedIndex == 2
                                  ? Colors.blue.shade100
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person),
                                Text('Profile'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Mergeable Semantics',
            components: [
              MergeSemantics(
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.check, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Task completed'),
                          Text(
                            'Successfully finished the task',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Exclude from Semantics',
            components: [
              Row(
                children: [
                  const Text('Important content'),
                  const SizedBox(width: 16),
                  ExcludeSemantics(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text('Decorative text'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Live Regions',
            components: [
              Semantics(
                liveRegion: true,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.amber),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status Update',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text('This content will be announced when it changes'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Focus Management',
            components: [
              FocusableActionWidget(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}

class FocusableActionWidget extends StatefulWidget {
  @override
  State<FocusableActionWidget> createState() => _FocusableActionWidgetState();
}

class _FocusableActionWidgetState extends State<FocusableActionWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: GestureDetector(
        onTap: () {
          _focusNode.requestFocus();
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _isFocused ? Colors.blue.shade100 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isFocused ? Colors.blue : Colors.grey,
              width: _isFocused ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.touch_app,
                color: _isFocused ? Colors.blue : Colors.grey,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Focusable Widget',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isFocused ? Colors.blue : Colors.black,
                      ),
                    ),
                    Text(
                      'Tap to focus, shows visual focus indicator',
                      style: TextStyle(
                        color: _isFocused ? Colors.blue.shade700 : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
