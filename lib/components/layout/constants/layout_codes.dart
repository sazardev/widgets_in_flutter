Map<String, String> layoutSourceCodes = {
  // Container codes
  'Container-Basic': '''
Container(
  width: 200,
  height: 100,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10),
  ),
  child: const Center(
    child: Text(
      'Container',
      style: TextStyle(color: Colors.white),
    ),
  ),
)''',

  'Container-WithPadding': '''
Container(
  padding: const EdgeInsets.all(16),
  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  decoration: BoxDecoration(
    color: Colors.blue.shade100,
    border: Border.all(color: Colors.blue, width: 2),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  child: const Text('Container with padding and decoration'),
)''',

  // Row codes
  'Row-Basic': '''
Row(
  children: [
    Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: const Center(child: Text('1')),
    ),
    Container(
      width: 50,
      height: 50,
      color: Colors.green,
      child: const Center(child: Text('2')),
    ),
    Container(
      width: 50,
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text('3')),
    ),
  ],
)''',

  'Row-WithAlignment': '''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: const Center(child: Text('1')),
    ),
    Container(
      width: 50,
      height: 80,
      color: Colors.green,
      child: const Center(child: Text('2')),
    ),
    Container(
      width: 50,
      height: 60,
      color: Colors.blue,
      child: const Center(child: Text('3')),
    ),
  ],
)''',

  // Column codes
  'Column-Basic': '''
Column(
  children: [
    Container(
      width: 100,
      height: 50,
      color: Colors.red,
      child: const Center(child: Text('1')),
    ),
    Container(
      width: 100,
      height: 50,
      color: Colors.green,
      child: const Center(child: Text('2')),
    ),
    Container(
      width: 100,
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text('3')),
    ),
  ],
)''',

  'Column-WithAlignment': '''
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      width: 80,
      height: 50,
      color: Colors.red,
      child: const Center(child: Text('1')),
    ),
    Container(
      width: 120,
      height: 50,
      color: Colors.green,
      child: const Center(child: Text('2')),
    ),
    Container(
      width: 100,
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text('3')),
    ),
  ],
)''',

  // Stack codes
  'Stack-Basic': '''
Stack(
  children: [
    Container(
      width: 200,
      height: 200,
      color: Colors.blue.shade100,
    ),
    Positioned(
      top: 20,
      left: 20,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
        child: const Center(child: Text('1')),
      ),
    ),
    Positioned(
      bottom: 20,
      right: 20,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.green,
        child: const Center(child: Text('2')),
      ),
    ),
  ],
)''',

  'Stack-WithAlignment': '''
Stack(
  alignment: Alignment.center,
  children: [
    Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red.shade200,
        borderRadius: BorderRadius.circular(50),
      ),
    ),
    Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  ],
)''',

  // Wrap codes
  'Wrap-Basic': '''
Wrap(
  spacing: 8.0,
  runSpacing: 4.0,
  children: <Widget>[
    Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('AH')),
      label: const Text('Hamilton'),
    ),
    Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('ML')),
      label: const Text('Lafayette'),
    ),
    Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('HM')),
      label: const Text('Mulligan'),
    ),
    Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('JL')),
      label: const Text('Laurens'),
    ),
  ],
)''',

  // Expanded and Flexible codes
  'Expanded-Basic': '''
Row(
  children: [
    Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: const Center(child: Text('Fixed')),
    ),
    Expanded(
      child: Container(
        height: 50,
        color: Colors.green,
        child: const Center(child: Text('Expanded')),
      ),
    ),
    Container(
      width: 50,
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text('Fixed')),
    ),
  ],
)''',

  'Flexible-Basic': '''
Row(
  children: [
    Flexible(
      flex: 1,
      child: Container(
        height: 50,
        color: Colors.red,
        child: const Center(child: Text('Flex 1')),
      ),
    ),
    Flexible(
      flex: 2,
      child: Container(
        height: 50,
        color: Colors.green,
        child: const Center(child: Text('Flex 2')),
      ),
    ),
    Flexible(
      flex: 1,
      child: Container(
        height: 50,
        color: Colors.blue,
        child: const Center(child: Text('Flex 1')),
      ),
    ),
  ],
)''',

  // Padding codes
  'Padding-Basic': '''
Padding(
  padding: const EdgeInsets.all(16.0),
  child: Container(
    color: Colors.blue.shade100,
    child: const Text('Padded content'),
  ),
)''',

  'Padding-Different': '''
Padding(
  padding: const EdgeInsets.only(
    left: 20.0,
    top: 10.0,
    right: 20.0,
    bottom: 30.0,
  ),
  child: Container(
    color: Colors.green.shade100,
    child: const Text('Custom padding'),
  ),
)''',

  // Center codes
  'Center-Basic': '''
Center(
  child: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
    child: const Center(
      child: Text(
        'Centered',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
)''',

  // Align codes
  'Align-Basic': '''
Container(
  height: 200,
  width: double.infinity,
  color: Colors.grey.shade200,
  child: Align(
    alignment: Alignment.topRight,
    child: Container(
      width: 50,
      height: 50,
      color: Colors.blue,
      child: const Center(
        child: Text('TR', style: TextStyle(color: Colors.white)),
      ),
    ),
  ),
)''',

  // SizedBox codes
  'SizedBox-Basic': '''
Column(
  children: [
    Container(
      width: 100,
      height: 50,
      color: Colors.red,
      child: const Center(child: Text('Box 1')),
    ),
    const SizedBox(height: 20), // Spacing
    Container(
      width: 100,
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text('Box 2')),
    ),
  ],
)''',

  // Spacer codes
  'Spacer-Basic': '''
Row(
  children: [
    Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: const Center(child: Text('1')),
    ),
    const Spacer(), // Takes available space
    Container(
      width: 50,
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text('2')),
    ),
    const Spacer(flex: 2), // Takes 2x space
    Container(
      width: 50,
      height: 50,
      color: Colors.green,
      child: const Center(child: Text('3')),
    ),
  ],
)''',
};
