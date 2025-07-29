Map<String, String> selectionSourceCodes = {
  // Checkbox codes
  'Checkbox-Basic': '''
// In your StatefulWidget:
bool isChecked = false;

Checkbox(
  value: isChecked,
  onChanged: (bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  },
)''',

  'Checkbox-WithLabel': '''
// In your StatefulWidget:
bool isChecked = false;

CheckboxListTile(
  title: const Text('Checkbox with label'),
  value: isChecked,
  onChanged: (bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  },
  controlAffinity: ListTileControlAffinity.leading,
)''',

  'Checkbox-Tristate': '''
// In your StatefulWidget:
bool? isChecked = false;

Checkbox(
  tristate: true,
  value: isChecked,
  onChanged: (bool? value) {
    setState(() {
      isChecked = value;
    });
  },
)''',

  // Radio codes
  'Radio-Basic': '''
enum SingingCharacter { lafayette, jefferson }

// In your StatefulWidget:
SingingCharacter? _character = SingingCharacter.lafayette;

Column(
  children: <Widget>[
    ListTile(
      title: const Text('Lafayette'),
      leading: Radio<SingingCharacter>(
        value: SingingCharacter.lafayette,
        groupValue: _character,
        onChanged: (SingingCharacter? value) {
          setState(() {
            _character = value;
          });
        },
      ),
    ),
    ListTile(
      title: const Text('Jefferson'),
      leading: Radio<SingingCharacter>(
        value: SingingCharacter.jefferson,
        groupValue: _character,
        onChanged: (SingingCharacter? value) {
          setState(() {
            _character = value;
          });
        },
      ),
    ),
  ],
)''',

  'RadioListTile-Basic': '''
enum SingingCharacter { lafayette, jefferson }

// In your StatefulWidget:
SingingCharacter? _character = SingingCharacter.lafayette;

Column(
  children: <Widget>[
    RadioListTile<SingingCharacter>(
      title: const Text('Lafayette'),
      value: SingingCharacter.lafayette,
      groupValue: _character,
      onChanged: (SingingCharacter? value) {
        setState(() {
          _character = value;
        });
      },
    ),
    RadioListTile<SingingCharacter>(
      title: const Text('Jefferson'),
      value: SingingCharacter.jefferson,
      groupValue: _character,
      onChanged: (SingingCharacter? value) {
        setState(() {
          _character = value;
        });
      },
    ),
  ],
)''',

  // Switch codes
  'Switch-Basic': '''
// In your StatefulWidget:
bool light = true;

Switch(
  value: light,
  onChanged: (bool value) {
    setState(() {
      light = value;
    });
  },
)''',

  'SwitchListTile-Basic': '''
// In your StatefulWidget:
bool light = true;

SwitchListTile(
  title: const Text('Toggle feature'),
  value: light,
  onChanged: (bool value) {
    setState(() {
      light = value;
    });
  },
  secondary: const Icon(Icons.lightbulb_outline),
)''',

  // Slider codes
  'Slider-Basic': '''
// In your StatefulWidget:
double _currentSliderValue = 20;

Slider(
  value: _currentSliderValue,
  max: 100,
  divisions: 5,
  label: _currentSliderValue.round().toString(),
  onChanged: (double value) {
    setState(() {
      _currentSliderValue = value;
    });
  },
)''',

  'RangeSlider-Basic': '''
// In your StatefulWidget:
RangeValues _currentRangeValues = const RangeValues(40, 80);

RangeSlider(
  values: _currentRangeValues,
  max: 100,
  divisions: 5,
  labels: RangeLabels(
    _currentRangeValues.start.round().toString(),
    _currentRangeValues.end.round().toString(),
  ),
  onChanged: (RangeValues values) {
    setState(() {
      _currentRangeValues = values;
    });
  },
)''',

  // Chip codes
  'Chip-Basic': '''
Chip(
  avatar: CircleAvatar(
    backgroundColor: Colors.grey.shade800,
    child: const Text('AB'),
  ),
  label: const Text('Aaron Burr'),
)''',

  'ActionChip-Basic': '''
ActionChip(
  avatar: CircleAvatar(
    backgroundColor: Colors.grey.shade800,
    child: const Text('AB'),
  ),
  label: const Text('Aaron Burr'),
  onPressed: () {
    print('Action chip pressed');
  },
)''',

  'FilterChip-Basic': '''
// In your StatefulWidget:
bool isSelected = false;

FilterChip(
  label: const Text('Filter'),
  selected: isSelected,
  onSelected: (bool value) {
    setState(() {
      isSelected = value;
    });
  },
)''',

  'ChoiceChip-Basic': '''
// In your StatefulWidget:
int? selectedChoice = 0;

Wrap(
  spacing: 8.0,
  children: List<Widget>.generate(
    3,
    (int index) {
      return ChoiceChip(
        label: Text('Choice \${index + 1}'),
        selected: selectedChoice == index,
        onSelected: (bool selected) {
          setState(() {
            selectedChoice = selected ? index : null;
          });
        },
      );
    },
  ).toList(),
)''',

  'InputChip-Basic': '''
InputChip(
  avatar: CircleAvatar(
    backgroundColor: Colors.grey.shade800,
    child: const Text('AB'),
  ),
  label: const Text('Aaron Burr'),
  onDeleted: () {
    print('Chip deleted');
  },
  onPressed: () {
    print('Chip pressed');
  },
)''',

  // Date and Time Picker codes
  'DatePicker-Basic': '''
Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );
  if (picked != null) {
    print('Selected date: \$picked');
  }
}

// Usage in button:
ElevatedButton(
  onPressed: () => _selectDate(context),
  child: const Text('Select Date'),
)''',

  'TimePicker-Basic': '''
Future<void> _selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null) {
    print('Selected time: \$picked');
  }
}

// Usage in button:
ElevatedButton(
  onPressed: () => _selectTime(context),
  child: const Text('Select Time'),
)''',

  // MenuBar codes
  'MenuBar-Basic': '''
MenuBar(
  children: <Widget>[
    SubmenuButton(
      menuChildren: <Widget>[
        MenuItemButton(
          onPressed: () {
            print('About pressed');
          },
          child: const MenuAcceleratorLabel('&About'),
        ),
        MenuItemButton(
          onPressed: () {
            print('Show Message pressed');
          },
          child: const MenuAcceleratorLabel('&Show Message'),
        ),
      ],
      child: const MenuAcceleratorLabel('&File'),
    ),
    SubmenuButton(
      menuChildren: <Widget>[
        MenuItemButton(
          onPressed: () {
            print('Bold pressed');
          },
          child: const MenuAcceleratorLabel('&Bold'),
        ),
        MenuItemButton(
          onPressed: () {
            print('Italic pressed');
          },
          child: const MenuAcceleratorLabel('&Italic'),
        ),
      ],
      child: const MenuAcceleratorLabel('&Style'),
    ),
  ],
)''',

  // Autocomplete codes
  'Autocomplete-Basic': '''
Autocomplete<String>(
  optionsBuilder: (TextEditingValue textEditingValue) {
    if (textEditingValue.text == '') {
      return const Iterable<String>.empty();
    }
    return <String>['aardvark', 'bobcat', 'chameleon']
        .where((String option) {
      return option.contains(textEditingValue.text.toLowerCase());
    });
  },
  onSelected: (String selection) {
    print('You just selected \$selection');
  },
)''',
};
