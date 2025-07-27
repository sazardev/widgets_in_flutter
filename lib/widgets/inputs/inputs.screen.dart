import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  bool _switchValue = false;
  double _sliderValue = 20.0;
  double _rangeStart = 20.0;
  double _rangeEnd = 80.0;
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _formController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    _formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs'),
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
            content: 'Text Fields',
            components: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'Basic TextField',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'With Icon',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.visibility),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Filled',
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Multiline',
                    hintText: 'Enter multiple lines...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Form Fields',
            components: [
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: _formController,
                  decoration: const InputDecoration(
                    labelText: 'TextFormField',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Number',
                    prefixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Switches',
            components: [
              Switch(
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
              Switch.adaptive(
                value: !_switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = !value;
                  });
                },
              ),
              const Switch(
                value: false,
                onChanged: null,
              ),
              SwitchListTile(
                title: const Text('Switch List Tile'),
                subtitle: const Text('With description'),
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
            ],
          ),
          CardComponents(
            content: 'Sliders',
            components: [
              Column(
                children: [
                  Text('Value: ${_sliderValue.round()}'),
                  Slider(
                    value: _sliderValue,
                    min: 0.0,
                    max: 100.0,
                    divisions: 10,
                    label: _sliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Text('Range: ${_rangeStart.round()} - ${_rangeEnd.round()}'),
                  RangeSlider(
                    values: RangeValues(_rangeStart, _rangeEnd),
                    min: 0.0,
                    max: 100.0,
                    divisions: 10,
                    labels: RangeLabels(
                      _rangeStart.round().toString(),
                      _rangeEnd.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _rangeStart = values.start;
                        _rangeEnd = values.end;
                      });
                    },
                  ),
                ],
              ),
              const Slider(
                value: 50,
                min: 0.0,
                max: 100.0,
                onChanged: null,
              ),
            ],
          ),
          CardComponents(
            content: 'Other Inputs',
            components: [
              Stepper(
                currentStep: 1,
                controlsBuilder: (context, details) {
                  return Row(
                    children: [
                      if (details.stepIndex < 2)
                        ElevatedButton(
                          onPressed: details.onStepCancel,
                          child: const Text('Next'),
                        ),
                      const SizedBox(width: 8),
                      if (details.stepIndex > 0)
                        TextButton(
                          onPressed: details.onStepCancel,
                          child: const Text('Back'),
                        ),
                    ],
                  );
                },
                steps: const [
                  Step(
                    title: Text('Step 1'),
                    content: Text('This is the first step'),
                    isActive: true,
                  ),
                  Step(
                    title: Text('Step 2'),
                    content: Text('This is the second step'),
                    isActive: true,
                  ),
                  Step(
                    title: Text('Step 3'),
                    content: Text('This is the third step'),
                    isActive: false,
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
}
