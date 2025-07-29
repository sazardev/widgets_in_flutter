Map<String, String> cupertinoSourceCodes = {
  // CupertinoButton codes
  'CupertinoButton-Basic': '''
CupertinoButton(
  onPressed: () {
    print('Cupertino button pressed');
  },
  child: const Text('Cupertino Button'),
)''',

  'CupertinoButton-Filled': '''
CupertinoButton.filled(
  onPressed: () {
    print('Filled Cupertino button pressed');
  },
  child: const Text('Filled Button'),
)''',

  // CupertinoSwitch codes
  'CupertinoSwitch-Basic': '''
bool switchValue = false;

CupertinoSwitch(
  value: switchValue,
  onChanged: (bool value) {
    setState(() {
      switchValue = value;
    });
  },
)''',

  // CupertinoSlider codes
  'CupertinoSlider-Basic': '''
double sliderValue = 0.5;

CupertinoSlider(
  value: sliderValue,
  onChanged: (double value) {
    setState(() {
      sliderValue = value;
    });
  },
)''',

  // CupertinoTextField codes
  'CupertinoTextField-Basic': '''
const CupertinoTextField(
  placeholder: 'Enter text here',
  padding: EdgeInsets.all(12),
)''',

  'CupertinoTextField-WithPrefix': '''
CupertinoTextField(
  prefix: const Icon(CupertinoIcons.search),
  placeholder: 'Search',
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: CupertinoColors.systemGrey6,
    borderRadius: BorderRadius.circular(8),
  ),
)''',

  // CupertinoNavigationBar codes
  'CupertinoNavigationBar-Basic': '''
CupertinoNavigationBar(
  leading: CupertinoNavigationBarBackButton(
    onPressed: () => Navigator.pop(context),
  ),
  middle: const Text('Navigation Bar'),
  trailing: CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: () {},
    child: const Icon(CupertinoIcons.add),
  ),
)''',

  // CupertinoTabBar codes
  'CupertinoTabBar-Basic': '''
CupertinoTabBar(
  items: const [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: 'Profile',
    ),
  ],
  currentIndex: 0,
  onTap: (index) {
    // Handle tab selection
  },
)''',

  // CupertinoAlertDialog codes
  'CupertinoAlertDialog-Basic': '''
showCupertinoDialog(
  context: context,
  builder: (context) => CupertinoAlertDialog(
    title: const Text('Alert'),
    content: const Text('This is a Cupertino-style dialog.'),
    actions: [
      CupertinoDialogAction(
        child: const Text('Cancel'),
        onPressed: () => Navigator.pop(context),
      ),
      CupertinoDialogAction(
        isDefaultAction: true,
        child: const Text('OK'),
        onPressed: () => Navigator.pop(context),
      ),
    ],
  ),
)''',

  // CupertinoActionSheet codes
  'CupertinoActionSheet-Basic': '''
showCupertinoModalPopup(
  context: context,
  builder: (context) => CupertinoActionSheet(
    title: const Text('Action Sheet'),
    message: const Text('Choose an action'),
    actions: [
      CupertinoActionSheetAction(
        onPressed: () => Navigator.pop(context),
        child: const Text('Save'),
      ),
      CupertinoActionSheetAction(
        onPressed: () => Navigator.pop(context),
        child: const Text('Delete'),
      ),
    ],
    cancelButton: CupertinoActionSheetAction(
      onPressed: () => Navigator.pop(context),
      child: const Text('Cancel'),
    ),
  ),
)''',

  // CupertinoListSection codes
  'CupertinoListSection-Basic': '''
CupertinoListSection(
  header: const Text('Settings'),
  children: [
    CupertinoListTile(
      title: const Text('Wi-Fi'),
      leading: const Icon(CupertinoIcons.wifi),
      trailing: const CupertinoListTileChevron(),
    ),
    CupertinoListTile(
      title: const Text('Bluetooth'),
      leading: const Icon(CupertinoIcons.bluetooth),
      trailing: CupertinoSwitch(
        value: true,
        onChanged: (value) {},
      ),
    ),
  ],
)''',

  // CupertinoContextMenu codes
  'CupertinoContextMenu-Basic': '''
CupertinoContextMenu(
  actions: [
    CupertinoContextMenuAction(
      child: const Text('Copy'),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    CupertinoContextMenuAction(
      child: const Text('Paste'),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    CupertinoContextMenuAction(
      isDestructiveAction: true,
      child: const Text('Delete'),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ],
  child: Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: CupertinoColors.systemGrey5,
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Text('Long press for context menu'),
  ),
)''',

  // CupertinoSegmentedControl codes
  'CupertinoSegmentedControl-Basic': '''
String selectedSegment = 'first';

CupertinoSegmentedControl<String>(
  children: const {
    'first': Text('First'),
    'second': Text('Second'),
    'third': Text('Third'),
  },
  groupValue: selectedSegment,
  onValueChanged: (String value) {
    setState(() {
      selectedSegment = value;
    });
  },
)''',

  // CupertinoDatePicker codes
  'CupertinoDatePicker-Basic': '''
DateTime selectedDate = DateTime.now();

CupertinoDatePicker(
  mode: CupertinoDatePickerMode.date,
  initialDateTime: selectedDate,
  onDateTimeChanged: (DateTime dateTime) {
    setState(() {
      selectedDate = dateTime;
    });
  },
)''',

  // CupertinoTimerPicker codes
  'CupertinoTimerPicker-Basic': '''
Duration selectedDuration = const Duration(minutes: 5);

CupertinoTimerPicker(
  mode: CupertinoTimerPickerMode.hms,
  initialTimerDuration: selectedDuration,
  onTimerDurationChanged: (Duration duration) {
    setState(() {
      selectedDuration = duration;
    });
  },
)''',

  // CupertinoPicker codes
  'CupertinoPicker-Basic': '''
int selectedIndex = 0;
List<String> items = ['Option 1', 'Option 2', 'Option 3'];

Container(
  height: 200,
  child: CupertinoPicker(
    itemExtent: 32.0,
    onSelectedItemChanged: (int index) {
      setState(() {
        selectedIndex = index;
      });
    },
    children: items.map((item) => Text(item)).toList(),
  ),
)''',

  // CupertinoActivityIndicator codes
  'CupertinoActivityIndicator-Basic': '''
const CupertinoActivityIndicator()''',

  'CupertinoActivityIndicator-Large': '''
const CupertinoActivityIndicator(
  radius: 20.0,
)''',
};
