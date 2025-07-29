Map<String, String> dialogsOverlaysSourceCodes = {
  // AlertDialog codes
  'AlertDialog-Basic': '''
showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: const Text('Alert Dialog'),
      content: const Text('This is the content of the alert dialog.'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  },
)''',

  'AlertDialog-Custom': '''
showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          Icon(Icons.warning, color: Colors.orange),
          SizedBox(width: 8),
          Text('Warning'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Are you sure you want to delete this item?'),
          SizedBox(height: 16),
          Image.asset('assets/warning.png', height: 50),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () => Navigator.pop(context),
          child: Text('Delete'),
        ),
      ],
    );
  },
)''',

  // SimpleDialog codes
  'SimpleDialog-Basic': '''
showDialog(
  context: context,
  builder: (BuildContext context) {
    return SimpleDialog(
      title: const Text('Select Option'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Option 1');
          },
          child: const Text('Option 1'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Option 2');
          },
          child: const Text('Option 2'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Option 3');
          },
          child: const Text('Option 3'),
        ),
      ],
    );
  },
)''',

  // BottomSheet codes
  'BottomSheet-Modal': '''
showModalBottomSheet<void>(
  context: context,
  builder: (BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Modal BottomSheet'),
            ElevatedButton(
              child: const Text('Close BottomSheet'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  },
)''',

  'BottomSheet-Persistent': '''
// In your Scaffold:
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// To show:
_scaffoldKey.currentState!.showBottomSheet<void>(
  (BuildContext context) {
    return Container(
      height: 200,
      color: Colors.lightBlue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Persistent BottomSheet'),
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  },
)''',

  // Snackbar codes
  'SnackBar-Basic': '''
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text('This is a basic snackbar'),
    duration: Duration(seconds: 2),
  ),
)''',

  'SnackBar-Action': '''
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: const Text('Item deleted'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Undo the deletion
        print('Undo pressed');
      },
    ),
    duration: const Duration(seconds: 4),
    backgroundColor: Colors.red,
  ),
)''',

  'SnackBar-Floating': '''
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Row(
      children: [
        Icon(Icons.check_circle, color: Colors.white),
        SizedBox(width: 8),
        Text('Success! Data saved.'),
      ],
    ),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(16),
    duration: Duration(seconds: 3),
  ),
)''',

  // Banner codes
  'Banner-Basic': '''
Banner(
  message: 'DEBUG',
  location: BannerLocation.topEnd,
  color: Colors.red,
  child: Container(
    width: 200,
    height: 200,
    color: Colors.blue,
    child: const Center(
      child: Text('App Content'),
    ),
  ),
)''',

  // Tooltip codes
  'Tooltip-Basic': '''
Tooltip(
  message: 'This is a tooltip',
  child: IconButton(
    icon: Icon(Icons.info),
    onPressed: () {},
  ),
)''',

  'Tooltip-Custom': '''
Tooltip(
  message: 'Custom styled tooltip',
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  textStyle: TextStyle(
    color: Colors.white,
    fontSize: 16,
  ),
  padding: EdgeInsets.all(12),
  margin: EdgeInsets.all(8),
  showDuration: Duration(seconds: 3),
  child: Container(
    padding: EdgeInsets.all(16),
    color: Colors.grey[300],
    child: Text('Hover or long press me'),
  ),
)''',

  // Overlay codes
  'Overlay-Basic': '''
// To show an overlay entry:
OverlayEntry overlayEntry = OverlayEntry(
  builder: (context) => Positioned(
    top: 100,
    left: 50,
    child: Material(
      child: Container(
        width: 200,
        height: 100,
        color: Colors.red,
        child: Center(
          child: Column(
            children: [
              Text('Overlay Content'),
              TextButton(
                onPressed: () {
                  overlayEntry.remove();
                },
                child: Text('Close'),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);

Overlay.of(context).insert(overlayEntry);''',

  // AboutDialog codes
  'AboutDialog-Basic': '''
showAboutDialog(
  context: context,
  applicationName: 'My Flutter App',
  applicationVersion: '1.0.0',
  applicationIcon: Icon(Icons.flutter_dash),
  children: [
    Text('This is a sample Flutter application.'),
    Text('Built with love using Flutter.'),
  ],
)''',

  // DatePickerDialog codes
  'DatePicker-Basic': '''
showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2000),
  lastDate: DateTime(2100),
).then((selectedDate) {
  if (selectedDate != null) {
    print('Selected date: \$selectedDate');
  }
});''',

  // TimePickerDialog codes
  'TimePicker-Basic': '''
showTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
).then((selectedTime) {
  if (selectedTime != null) {
    print('Selected time: \$selectedTime');
  }
});''',

  // General Dialog codes
  'GeneralDialog-Custom': '''
showGeneralDialog(
  context: context,
  barrierDismissible: true,
  barrierLabel: 'Dismiss',
  barrierColor: Colors.black54,
  transitionDuration: Duration(milliseconds: 300),
  pageBuilder: (context, animation1, animation2) {
    return Container();
  },
  transitionBuilder: (context, animation1, animation2, widget) {
    return Transform.scale(
      scale: animation1.value,
      child: Opacity(
        opacity: animation1.value,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Custom Dialog'),
          content: Text('This dialog has custom animations'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  },
)''',

  // PopupMenuButton codes
  'PopupMenuButton-Basic': '''
PopupMenuButton<String>(
  onSelected: (String value) {
    print('Selected: \$value');
  },
  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    const PopupMenuItem<String>(
      value: 'option1',
      child: Text('Option 1'),
    ),
    const PopupMenuItem<String>(
      value: 'option2',
      child: Text('Option 2'),
    ),
    const PopupMenuDivider(),
    const PopupMenuItem<String>(
      value: 'option3',
      child: Row(
        children: [
          Icon(Icons.delete, color: Colors.red),
          SizedBox(width: 8),
          Text('Delete'),
        ],
      ),
    ),
  ],
)''',
};
