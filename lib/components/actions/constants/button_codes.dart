Map<String, String> buttonSourceCodes = {
  // FilledButton codes
  'FilledButton-Filled': '''
FilledButton(
  onPressed: () {
    print('Filled button pressed');
  },
  child: const Text('Filled'),
)''',

  'FilledButton-Disabled': '''
const FilledButton(
  onPressed: null,
  child: Text('Disabled'),
)''',

  'FilledButton-Icon': '''
FilledButton.icon(
  onPressed: () {
    print('Filled icon button pressed');
  },
  icon: const Icon(Icons.add),
  label: const Text('Icon'),
)''',

  'FilledButton-Tonal': '''
FilledButton.tonal(
  onPressed: () {
    print('Tonal button pressed');
  },
  child: const Text('Tonal'),
)''',

  'FilledButton-TonalIcon': '''
FilledButton.tonalIcon(
  onPressed: () {
    print('Tonal icon button pressed');
  },
  icon: const Icon(Icons.add),
  label: const Text('Tonal Icon'),
)''',

  // OutlinedButton codes
  'OutlinedButton-Basic': '''
OutlinedButton(
  onPressed: () {
    print('Outlined button pressed');
  },
  child: const Text('Outlined'),
)''',

  'OutlinedButton-Disabled': '''
const OutlinedButton(
  onPressed: null,
  child: Text('Disabled'),
)''',

  'OutlinedButton-Icon': '''
OutlinedButton.icon(
  onPressed: () {
    print('Outlined icon button pressed');
  },
  icon: const Icon(Icons.add),
  label: const Text('Icon'),
)''',

  // ElevatedButton codes
  'ElevatedButton-Basic': '''
ElevatedButton(
  onPressed: () {
    print('Elevated button pressed');
  },
  child: const Text('Elevated'),
)''',

  'ElevatedButton-Disabled': '''
const ElevatedButton(
  onPressed: null,
  child: Text('Disabled'),
)''',

  'ElevatedButton-Icon': '''
ElevatedButton.icon(
  onPressed: () {
    print('Elevated icon button pressed');
  },
  icon: const Icon(Icons.add),
  label: const Text('Icon'),
)''',

  // TextButton codes
  'TextButton-Basic': '''
TextButton(
  onPressed: () {
    print('Text button pressed');
  },
  child: const Text('Text'),
)''',

  'TextButton-Disabled': '''
const TextButton(
  onPressed: null,
  child: Text('Disabled'),
)''',

  'TextButton-Icon': '''
TextButton.icon(
  onPressed: () {
    print('Text icon button pressed');
  },
  icon: const Icon(Icons.add),
  label: const Text('Icon'),
)''',

  // IconButton codes
  'IconButton-Basic': '''
IconButton(
  onPressed: () {
    print('Icon button pressed');
  },
  icon: const Icon(Icons.add),
  tooltip: 'Add',
)''',

  'IconButton-Disabled': '''
const IconButton(
  onPressed: null,
  icon: Icon(Icons.add),
  tooltip: 'Add (disabled)',
)''',

  'IconButton-Filled': '''
IconButton.filled(
  onPressed: () {
    print('Filled icon button pressed');
  },
  icon: const Icon(Icons.add),
  tooltip: 'Add',
)''',

  'IconButton-FilledTonal': '''
IconButton.filledTonal(
  onPressed: () {
    print('Filled tonal icon button pressed');
  },
  icon: const Icon(Icons.add),
  tooltip: 'Add',
)''',

  'IconButton-Outlined': '''
IconButton.outlined(
  onPressed: () {
    print('Outlined icon button pressed');
  },
  icon: const Icon(Icons.add),
  tooltip: 'Add',
)''',

  // FloatingActionButton codes
  'FloatingActionButton-Basic': '''
FloatingActionButton(
  onPressed: () {
    print('FAB pressed');
  },
  child: const Icon(Icons.add),
  tooltip: 'Add',
)''',

  'FloatingActionButton-Mini': '''
FloatingActionButton(
  onPressed: () {
    print('Mini FAB pressed');
  },
  mini: true,
  child: const Icon(Icons.add),
  tooltip: 'Add',
)''',

  'FloatingActionButton-Extended': '''
FloatingActionButton.extended(
  onPressed: () {
    print('Extended FAB pressed');
  },
  icon: const Icon(Icons.add),
  label: const Text('Create'),
)''',

  'FloatingActionButton-Large': '''
FloatingActionButton.large(
  onPressed: () {
    print('Large FAB pressed');
  },
  child: const Icon(Icons.add),
  tooltip: 'Add',
)''',

  'FloatingActionButton-Small': '''
FloatingActionButton.small(
  onPressed: () {
    print('Small FAB pressed');
  },
  child: const Icon(Icons.add),
  tooltip: 'Add',
)''',

  // SegmentedButton codes
  'SegmentedButton-Basic': '''
enum Calendar { day, week, month, year }

// In your StatefulWidget:
Calendar calendarView = Calendar.day;

SegmentedButton<Calendar>(
  segments: const <ButtonSegment<Calendar>>[
    ButtonSegment<Calendar>(
      value: Calendar.day,
      label: Text('Day'),
      icon: Icon(Icons.calendar_view_day),
    ),
    ButtonSegment<Calendar>(
      value: Calendar.week,
      label: Text('Week'),
      icon: Icon(Icons.calendar_view_week),
    ),
    ButtonSegment<Calendar>(
      value: Calendar.month,
      label: Text('Month'),
      icon: Icon(Icons.calendar_view_month),
    ),
    ButtonSegment<Calendar>(
      value: Calendar.year,
      label: Text('Year'),
      icon: Icon(Icons.calendar_today),
    ),
  ],
  selected: <Calendar>{calendarView},
  onSelectionChanged: (Set<Calendar> newSelection) {
    setState(() {
      calendarView = newSelection.first;
    });
  },
)''',

  'SegmentedButton-Multi': '''
enum Sizes { extraSmall, small, medium, large, extraLarge }

// In your StatefulWidget:
Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

SegmentedButton<Sizes>(
  segments: const <ButtonSegment<Sizes>>[
    ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
    ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
    ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
    ButtonSegment<Sizes>(value: Sizes.large, label: Text('L')),
    ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
  ],
  selected: selection,
  onSelectionChanged: (Set<Sizes> newSelection) {
    setState(() {
      selection = newSelection;
    });
  },
  multiSelectionEnabled: true,
)''',
};
