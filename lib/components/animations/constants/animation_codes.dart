Map<String, String> animationSourceCodes = {
  // AnimatedContainer codes
  'AnimatedContainer-Basic': '''
// In your StatefulWidget:
bool _isExpanded = false;

AnimatedContainer(
  duration: Duration(seconds: 1),
  width: _isExpanded ? 200 : 100,
  height: _isExpanded ? 200 : 100,
  decoration: BoxDecoration(
    color: _isExpanded ? Colors.blue : Colors.red,
    borderRadius: BorderRadius.circular(_isExpanded ? 50 : 10),
  ),
  child: Center(
    child: GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Text(
        'Tap me!',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  ),
)''',

  'AnimatedContainer-Complex': '''
// In your StatefulWidget:
bool _isAnimated = false;

AnimatedContainer(
  duration: Duration(milliseconds: 800),
  curve: Curves.bounceInOut,
  width: _isAnimated ? 300 : 150,
  height: _isAnimated ? 150 : 300,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: _isAnimated 
        ? [Colors.purple, Colors.blue]
        : [Colors.orange, Colors.red],
    ),
    borderRadius: BorderRadius.circular(_isAnimated ? 75 : 20),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: _isAnimated ? 20 : 10,
        offset: Offset(0, _isAnimated ? 10 : 5),
      ),
    ],
  ),
  child: Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        setState(() {
          _isAnimated = !_isAnimated;
        });
      },
      child: Center(
        child: Text(
          'Animated!',
          style: TextStyle(
            color: Colors.white,
            fontSize: _isAnimated ? 24 : 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ),
)''',

  // AnimatedOpacity codes
  'AnimatedOpacity-Basic': '''
// In your StatefulWidget:
bool _isVisible = true;

Column(
  children: [
    AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Fade me!',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    ),
    SizedBox(height: 20),
    ElevatedButton(
      onPressed: () {
        setState(() {
          _isVisible = !_isVisible;
        });
      },
      child: Text(_isVisible ? 'Hide' : 'Show'),
    ),
  ],
)''',

  // AnimatedAlign codes
  'AnimatedAlign-Basic': '''
// In your StatefulWidget:
bool _isAligned = false;

Container(
  width: 300,
  height: 300,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(10),
  ),
  child: AnimatedAlign(
    alignment: _isAligned ? Alignment.topRight : Alignment.bottomLeft,
    duration: Duration(seconds: 1),
    curve: Curves.easeInOut,
    child: GestureDetector(
      onTap: () {
        setState(() {
          _isAligned = !_isAligned;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.touch_app, color: Colors.white),
      ),
    ),
  ),
)''',

  // AnimatedPositioned codes
  'AnimatedPositioned-Basic': '''
// In your StatefulWidget:
bool _isMoved = false;

Container(
  width: 300,
  height: 300,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Stack(
    children: [
      AnimatedPositioned(
        duration: Duration(seconds: 1),
        curve: Curves.bounceInOut,
        top: _isMoved ? 200 : 50,
        left: _isMoved ? 200 : 50,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isMoved = !_isMoved;
            });
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.play_arrow, color: Colors.white),
          ),
        ),
      ),
    ],
  ),
)''',

  // Hero animation codes
  'Hero-Basic': '''
// First Page
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
          child: Hero(
            tag: 'hero-rectangle',
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('Tap me!', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Second Page
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Destination')),
      body: Center(
        child: Hero(
          tag: 'hero-rectangle',
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'Hero!',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}''',

  // AnimatedBuilder codes
  'AnimatedBuilder-Basic': '''
// In your StatefulWidget:
late AnimationController _controller;
late Animation<double> _animation;

@override
void initState() {
  super.initState();
  _controller = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  );
  _animation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  ));
  _controller.repeat(reverse: true);
}

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

AnimatedBuilder(
  animation: _animation,
  builder: (context, child) {
    return Transform.scale(
      scale: 0.5 + (_animation.value * 0.5),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Color.lerp(Colors.red, Colors.blue, _animation.value),
          borderRadius: BorderRadius.circular(_animation.value * 100),
        ),
        child: Center(
          child: Text(
            'Animated!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  },
)''',

  // TweenAnimationBuilder codes
  'TweenAnimationBuilder-Basic': '''
// In your StatefulWidget:
double _targetValue = 0;

Column(
  children: [
    TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: _targetValue),
      duration: Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value * 6.3, // 2 * pi
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(value * 50),
            ),
            child: Icon(
              Icons.star,
              color: Colors.white,
              size: 50,
            ),
          ),
        );
      },
    ),
    SizedBox(height: 20),
    ElevatedButton(
      onPressed: () {
        setState(() {
          _targetValue = _targetValue == 0 ? 1 : 0;
        });
      },
      child: Text('Animate'),
    ),
  ],
)''',

  // FadeTransition codes
  'FadeTransition-Basic': '''
// In your StatefulWidget with TickerProviderStateMixin:
late AnimationController _fadeController;
late Animation<double> _fadeAnimation;

@override
void initState() {
  super.initState();
  _fadeController = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  );
  _fadeAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(_fadeController);
  _fadeController.repeat(reverse: true);
}

@override
void dispose() {
  _fadeController.dispose();
  super.dispose();
}

FadeTransition(
  opacity: _fadeAnimation,
  child: Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(
        'Fading!',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  ),
)''',

  // SlideTransition codes
  'SlideTransition-Basic': '''
// In your StatefulWidget with TickerProviderStateMixin:
late AnimationController _slideController;
late Animation<Offset> _slideAnimation;

@override
void initState() {
  super.initState();
  _slideController = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  );
  _slideAnimation = Tween<Offset>(
    begin: Offset(-1.0, 0.0),
    end: Offset(1.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _slideController,
    curve: Curves.easeInOut,
  ));
  _slideController.repeat(reverse: true);
}

@override
void dispose() {
  _slideController.dispose();
  super.dispose();
}

SlideTransition(
  position: _slideAnimation,
  child: Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.purple,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(
        'Slide!',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
)''',

  // ScaleTransition codes
  'ScaleTransition-Basic': '''
// In your StatefulWidget with TickerProviderStateMixin:
late AnimationController _scaleController;
late Animation<double> _scaleAnimation;

@override
void initState() {
  super.initState();
  _scaleController = AnimationController(
    duration: Duration(seconds: 1),
    vsync: this,
  );
  _scaleAnimation = Tween<double>(
    begin: 0.5,
    end: 1.5,
  ).animate(CurvedAnimation(
    parent: _scaleController,
    curve: Curves.elasticInOut,
  ));
  _scaleController.repeat(reverse: true);
}

@override
void dispose() {
  _scaleController.dispose();
  super.dispose();
}

ScaleTransition(
  scale: _scaleAnimation,
  child: Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.orange,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Text(
        'Scale!',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
)''',

  // RotationTransition codes
  'RotationTransition-Basic': '''
// In your StatefulWidget with TickerProviderStateMixin:
late AnimationController _rotationController;

@override
void initState() {
  super.initState();
  _rotationController = AnimationController(
    duration: Duration(seconds: 3),
    vsync: this,
  );
  _rotationController.repeat();
}

@override
void dispose() {
  _rotationController.dispose();
  super.dispose();
}

RotationTransition(
  turns: _rotationController,
  child: Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Icon(
        Icons.refresh,
        color: Colors.white,
        size: 40,
      ),
    ),
  ),
)''',

  // AnimatedList codes
  'AnimatedList-Basic': '''
class AnimatedListExample extends StatefulWidget {
  @override
  _AnimatedListExampleState createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  void _addItem() {
    final newIndex = _items.length;
    _items.insert(newIndex, 'Item \${newIndex + 1}');
    _listKey.currentState!.insertItem(newIndex);
  }

  void _removeItem(int index) {
    final removedItem = _items.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildItem(removedItem, animation),
    );
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(begin: Offset(1, 0), end: Offset.zero),
      ),
      child: Card(
        child: ListTile(
          title: Text(item),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _removeItem(_items.indexOf(item)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _addItem,
          child: Text('Add Item'),
        ),
        Expanded(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: _items.length,
            itemBuilder: (context, index, animation) {
              return _buildItem(_items[index], animation);
            },
          ),
        ),
      ],
    );
  }
}''',
};
