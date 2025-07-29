Map<String, String> gestureSourceCodes = {
  // GestureDetector codes
  'GestureDetector-Basic': '''
GestureDetector(
  onTap: () {
    print('Tapped!');
  },
  onDoubleTap: () {
    print('Double tapped!');
  },
  onLongPress: () {
    print('Long pressed!');
  },
  child: Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
      child: Text(
        'Tap, Double Tap, or Long Press',
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    ),
  ),
)''',

  'GestureDetector-Pan': '''
// In your StatefulWidget:
Offset _position = Offset.zero;

GestureDetector(
  onPanUpdate: (details) {
    setState(() {
      _position += details.delta;
    });
  },
  onPanEnd: (details) {
    print('Pan ended at: \$_position');
  },
  child: Transform.translate(
    offset: _position,
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          'Drag me!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  ),
)''',

  'GestureDetector-Scale': '''
// In your StatefulWidget:
double _scale = 1.0;
double _rotation = 0.0;

GestureDetector(
  onScaleStart: (details) {
    print('Scale started');
  },
  onScaleUpdate: (details) {
    setState(() {
      _scale = details.scale;
      _rotation = details.rotation;
    });
  },
  onScaleEnd: (details) {
    print('Scale ended');
  },
  child: Transform.scale(
    scale: _scale,
    child: Transform.rotate(
      angle: _rotation,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Pinch to scale\\nRotate to turn',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  ),
)''',

  // Draggable codes
  'Draggable-Basic': '''
Column(
  children: [
    Draggable<String>(
      data: 'Dragged item',
      feedback: Material(
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Dragging...',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      childWhenDragging: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text('Empty'),
        ),
      ),
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'Drag me',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
    SizedBox(height: 100),
    DragTarget<String>(
      onAccept: (data) {
        print('Accepted: \$data');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Dropped: \$data')),
        );
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: candidateData.isNotEmpty ? Colors.green[200] : Colors.grey[200],
            border: Border.all(
              color: candidateData.isNotEmpty ? Colors.green : Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              candidateData.isNotEmpty ? 'Release to drop' : 'Drop here',
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    ),
  ],
)''',

  // LongPressDraggable codes
  'LongPressDraggable-Basic': '''
// In your StatefulWidget:
List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
String? _draggedItem;

Column(
  children: [
    ..._items.map((item) => Container(
      margin: EdgeInsets.all(8),
      child: LongPressDraggable<String>(
        data: item,
        feedback: Material(
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                item,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        childWhenDragging: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text('Dragging...'),
          ),
        ),
        child: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              item,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    )).toList(),
    SizedBox(height: 50),
    DragTarget<String>(
      onAccept: (data) {
        setState(() {
          _items.remove(data);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Removed: \$data')),
        );
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 200,
          height: 80,
          decoration: BoxDecoration(
            color: candidateData.isNotEmpty ? Colors.red[200] : Colors.grey[200],
            border: Border.all(
              color: candidateData.isNotEmpty ? Colors.red : Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              candidateData.isNotEmpty ? 'Release to delete' : 'Delete zone',
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    ),
  ],
)''',

  // Dismissible codes
  'Dismissible-Basic': '''
// In your StatefulWidget:
List<String> _items = List.generate(10, (index) => 'Item \$index');

ListView.builder(
  itemCount: _items.length,
  itemBuilder: (context, index) {
    final item = _items[index];
    return Dismissible(
      key: ValueKey(item),
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        child: Icon(Icons.check, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        setState(() {
          _items.removeAt(index);
        });
        
        String action = direction == DismissDirection.startToEnd 
            ? 'completed' : 'deleted';
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('\$item \$action')),
        );
      },
      child: ListTile(
        title: Text(item),
        leading: Icon(Icons.list),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  },
)''',

  // RawGestureDetector codes
  'RawGestureDetector-Basic': '''
// Custom gesture recognizer example
class CustomTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    print('Gesture rejected');
    super.rejectGesture(pointer);
  }

  @override
  void acceptGesture(int pointer) {
    print('Gesture accepted');
    super.acceptGesture(pointer);
  }
}

// In your StatefulWidget:
Map<Type, GestureRecognizerFactory> _gestures = {};

@override
void initState() {
  super.initState();
  _gestures = {
    CustomTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<CustomTapGestureRecognizer>(
      () => CustomTapGestureRecognizer(),
      (CustomTapGestureRecognizer instance) {
        instance.onTap = () {
          print('Custom tap detected!');
        };
      },
    ),
  };
}

RawGestureDetector(
  gestures: _gestures,
  child: Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
      child: Text(
        'Custom Gesture Detector',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  ),
)''',

  // Listener codes
  'Listener-Basic': '''
// In your StatefulWidget:
String _lastEvent = 'No events yet';

Listener(
  onPointerDown: (event) {
    setState(() {
      _lastEvent = 'Pointer down at \${event.localPosition}';
    });
  },
  onPointerMove: (event) {
    setState(() {
      _lastEvent = 'Pointer move at \${event.localPosition}';
    });
  },
  onPointerUp: (event) {
    setState(() {
      _lastEvent = 'Pointer up at \${event.localPosition}';
    });
  },
  child: Container(
    width: 300,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.blue[100],
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Touch Area',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Text(
          _lastEvent,
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
)''',

  // AbsorbPointer codes
  'AbsorbPointer-Basic': '''
// In your StatefulWidget:
bool _absorbing = true;

Column(
  children: [
    SwitchListTile(
      title: Text('Absorb Pointer'),
      value: _absorbing,
      onChanged: (value) {
        setState(() {
          _absorbing = value;
        });
      },
    ),
    SizedBox(height: 20),
    AbsorbPointer(
      absorbing: _absorbing,
      child: ElevatedButton(
        onPressed: () {
          print('Button pressed!');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Button was pressed!')),
          );
        },
        child: Text('Try to press me'),
      ),
    ),
    SizedBox(height: 20),
    Text(
      _absorbing 
          ? 'Pointer events are being absorbed' 
          : 'Pointer events are not absorbed',
      style: TextStyle(fontSize: 16),
    ),
  ],
)''',

  // IgnorePointer codes
  'IgnorePointer-Basic': '''
// In your StatefulWidget:
bool _ignoring = true;

Column(
  children: [
    SwitchListTile(
      title: Text('Ignore Pointer'),
      value: _ignoring,
      onChanged: (value) {
        setState(() {
          _ignoring = value;
        });
      },
    ),
    SizedBox(height: 20),
    Stack(
      children: [
        Container(
          width: 200,
          height: 100,
          color: Colors.green[200],
          child: Center(
            child: Text('Background (always tappable)'),
          ),
        ),
        IgnorePointer(
          ignoring: _ignoring,
          child: GestureDetector(
            onTap: () {
              print('Foreground tapped!');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Foreground was tapped!')),
              );
            },
            child: Container(
              width: 150,
              height: 80,
              margin: EdgeInsets.all(10),
              color: Colors.blue[200],
              child: Center(
                child: Text('Foreground'),
              ),
            ),
          ),
        ),
      ],
    ),
    SizedBox(height: 20),
    Text(
      _ignoring 
          ? 'Foreground ignores pointer events' 
          : 'Foreground receives pointer events',
      style: TextStyle(fontSize: 16),
    ),
  ],
)''',
};
