Map<String, String> performanceSourceCodes = {
  // ListView.builder Performance codes
  'ListView-Performance': '''
// Efficient ListView with builder
ListView.builder(
  itemCount: 10000, // Large list
  itemExtent: 80.0, // Fixed height for better performance
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('\$index'),
      ),
      title: Text('Item \$index'),
      subtitle: Text('Subtitle for item \$index'),
    );
  },
)

// Use itemExtent when items have the same height
// Use prototypeItem when items have variable heights''',

  'GridView-Performance': '''
// Efficient GridView with builder
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 1.0,
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
  ),
  itemCount: 1000,
  itemBuilder: (BuildContext context, int index) {
    return Card(
      child: Center(
        child: Text('Grid Item \$index'),
      ),
    );
  },
)''',

  // Widget Optimization codes
  'Widget-Optimization': '''
// Use const constructors when possible
const Text('Static text')

// Extract widgets to avoid rebuilds
class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      // Expensive widget content
    );
  }
}

// Use it in parent widget
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int counter = 0;
  
  // Define expensive widget as const to prevent rebuilds
  static const ExpensiveWidget _expensiveWidget = ExpensiveWidget();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: \$counter'),
        ElevatedButton(
          onPressed: () => setState(() => counter++),
          child: Text('Increment'),
        ),
        _expensiveWidget, // Won't rebuild when counter changes
      ],
    );
  }
}''',

  // Image Optimization codes
  'Image-Optimization': '''
// Optimize images with caching
Image.network(
  'https://example.com/image.jpg',
  cacheWidth: 300, // Resize to specific width
  cacheHeight: 200, // Resize to specific height
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded / 
            loadingProgress.expectedTotalBytes!
          : null,
    );
  },
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error);
  },
)

// Use CachedNetworkImage for better caching
CachedNetworkImage(
  imageUrl: 'https://example.com/image.jpg',
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
  memCacheWidth: 300,
  memCacheHeight: 200,
)''',

  // Animation Performance codes
  'Animation-Performance': '''
// Use AnimatedBuilder for complex animations
class PerformantAnimation extends StatefulWidget {
  @override
  _PerformantAnimationState createState() => _PerformantAnimationState();
}

class _PerformantAnimationState extends State<PerformantAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      // Child won't rebuild on every frame
      child: ExpensiveChildWidget(),
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 + (_animation.value * 0.2),
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}''',

  // Memory Management codes
  'Memory-Management': '''
// Proper disposal of resources
class ResourcefulWidget extends StatefulWidget {
  @override
  _ResourcefulWidgetState createState() => _ResourcefulWidgetState();
}

class _ResourcefulWidgetState extends State<ResourcefulWidget> {
  late StreamSubscription _subscription;
  late Timer _timer;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Periodic task
    });
    
    _subscription = someStream.listen((data) {
      // Handle stream data
    });
  }

  @override
  void dispose() {
    // Always dispose resources to prevent memory leaks
    _animationController.dispose();
    _timer.cancel();
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(/* widget content */);
  }
}''',

  // Lazy Loading codes
  'Lazy-Loading': '''
// Lazy loading with AutomaticKeepAliveClientMixin
class LazyListView extends StatefulWidget {
  @override
  _LazyListViewState createState() => _LazyListViewState();
}

class _LazyListViewState extends State<LazyListView> {
  final List<String> items = List.generate(10000, (i) => 'Item \$i');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return LazyListItem(
          key: ValueKey(items[index]),
          title: items[index],
        );
      },
    );
  }
}

class LazyListItem extends StatefulWidget {
  final String title;
  
  const LazyListItem({Key? key, required this.title}) : super(key: key);

  @override
  _LazyListItemState createState() => _LazyListItemState();
}

class _LazyListItemState extends State<LazyListItem>
    with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true; // Keep widget alive when scrolled out

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    
    return Card(
      child: ListTile(
        title: Text(widget.title),
        subtitle: Text('Expensive computation result'),
      ),
    );
  }
}''',

  // Build Optimization codes
  'Build-Optimization': '''
// Use Builder widget to limit rebuild scope
class OptimizedWidget extends StatefulWidget {
  @override
  _OptimizedWidgetState createState() => _OptimizedWidgetState();
}

class _OptimizedWidgetState extends State<OptimizedWidget> {
  int _counter = 0;
  String _text = 'Hello';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // This part rebuilds when counter changes
        Builder(
          builder: (context) {
            return Text('Counter: \$_counter');
          },
        ),
        
        // This part doesn't rebuild when counter changes
        const ExpensiveStaticWidget(),
        
        // Only rebuilds when text changes
        Builder(
          builder: (context) {
            return Text('Text: \$_text');
          },
        ),
        
        Row(
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _counter++),
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _text = 'Updated'),
              child: Text('Update Text'),
            ),
          ],
        ),
      ],
    );
  }
}''',

  // RepaintBoundary codes
  'RepaintBoundary-Optimization': '''
// Use RepaintBoundary to isolate repaints
class RepaintOptimizedWidget extends StatefulWidget {
  @override
  _RepaintOptimizedWidgetState createState() => _RepaintOptimizedWidgetState();
}

class _RepaintOptimizedWidgetState extends State<RepaintOptimizedWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Static content - won't repaint
        RepaintBoundary(
          child: Container(
            height: 200,
            color: Colors.blue,
            child: Center(child: Text('Static Content')),
          ),
        ),
        
        // Animated content - isolated repaints
        RepaintBoundary(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animationController.value * 2 * 3.14159,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}''',

  // Profile Performance codes
  'Performance-Profiling': '''
import 'dart:developer' as developer;

// Performance timing
void performanceExample() {
  final stopwatch = Stopwatch()..start();
  
  // Mark the start of a performance section
  developer.Timeline.startSync('ExpensiveOperation');
  
  try {
    // Expensive operation here
    expensiveFunction();
    
    stopwatch.stop();
    print('Operation took: \${stopwatch.elapsedMilliseconds}ms');
    
  } finally {
    developer.Timeline.finishSync();
  }
}

// Custom performance markers for Timeline
Widget buildWithProfiling(BuildContext context) {
  developer.Timeline.startSync('WidgetBuild');
  
  final widget = Column(
    children: [
      // Widget content
    ],
  );
  
  developer.Timeline.finishSync();
  return widget;
}''',

  // FutureBuilder Optimization codes
  'FutureBuilder-Optimization': '''
class OptimizedFutureBuilder extends StatefulWidget {
  @override
  _OptimizedFutureBuilderState createState() => _OptimizedFutureBuilderState();
}

class _OptimizedFutureBuilderState extends State<OptimizedFutureBuilder> {
  late Future<String> _future;

  @override
  void initState() {
    super.initState();
    // Initialize future once, not in build method
    _future = fetchData();
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Data loaded';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _future, // Use the cached future
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: \${snapshot.error}');
        } else {
          return Text('Result: \${snapshot.data}');
        }
      },
    );
  }
}''',
};
