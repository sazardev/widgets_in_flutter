import 'package:get/get.dart';

class GetSearchController extends GetxController {
  final RxList<Map<String, dynamic>> allWidgets = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredWidgets =
      <Map<String, dynamic>>[].obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadWidgets();
    filteredWidgets.assignAll(allWidgets);
  }

  void loadWidgets() {
    allWidgets.assignAll([
      // Actions widgets
      {
        'name': 'FilledButton',
        'category': 'actions',
        'route': '/components/actions'
      },
      {
        'name': 'OutlinedButton',
        'category': 'actions',
        'route': '/components/actions'
      },
      {
        'name': 'ElevatedButton',
        'category': 'actions',
        'route': '/components/actions'
      },
      {
        'name': 'TextButton',
        'category': 'actions',
        'route': '/components/actions'
      },
      {
        'name': 'IconButton',
        'category': 'actions',
        'route': '/components/actions'
      },
      {
        'name': 'FloatingActionButton',
        'category': 'actions',
        'route': '/components/actions'
      },
      {
        'name': 'DropdownButton',
        'category': 'actions',
        'route': '/components/actions'
      },
      {
        'name': 'PopupMenuButton',
        'category': 'actions',
        'route': '/components/actions'
      },
      {
        'name': 'MenuAnchor',
        'category': 'actions',
        'route': '/components/actions'
      },
      // Selection widgets
      {
        'name': 'Checkbox',
        'category': 'selections',
        'route': '/components/selections'
      },
      {
        'name': 'Radio',
        'category': 'selections',
        'route': '/components/selections'
      },
      {
        'name': 'Chip',
        'category': 'selections',
        'route': '/components/selections'
      },
      {
        'name': 'ActionChip',
        'category': 'selections',
        'route': '/components/selections'
      },
      {
        'name': 'FilterChip',
        'category': 'selections',
        'route': '/components/selections'
      },
      {
        'name': 'ChoiceChip',
        'category': 'selections',
        'route': '/components/selections'
      },
      {
        'name': 'Dialog',
        'category': 'selections',
        'route': '/components/selections'
      },
      {
        'name': 'DatePicker',
        'category': 'selections',
        'route': '/components/selections'
      },
      {
        'name': 'TimePicker',
        'category': 'selections',
        'route': '/components/selections'
      },
      // Input widgets
      {
        'name': 'TextField',
        'category': 'inputs',
        'route': '/components/inputs'
      },
      {
        'name': 'TextFormField',
        'category': 'inputs',
        'route': '/components/inputs'
      },
      {'name': 'Switch', 'category': 'inputs', 'route': '/components/inputs'},
      {'name': 'Slider', 'category': 'inputs', 'route': '/components/inputs'},
      {
        'name': 'RangeSlider',
        'category': 'inputs',
        'route': '/components/inputs'
      },
      {'name': 'Stepper', 'category': 'inputs', 'route': '/components/inputs'},
      // Navigation widgets
      {
        'name': 'AppBar',
        'category': 'navigation',
        'route': '/components/navigation'
      },
      {
        'name': 'BottomNavigationBar',
        'category': 'navigation',
        'route': '/components/navigation'
      },
      {
        'name': 'NavigationBar',
        'category': 'navigation',
        'route': '/components/navigation'
      },
      {
        'name': 'TabBar',
        'category': 'navigation',
        'route': '/components/navigation'
      },
      {
        'name': 'Drawer',
        'category': 'navigation',
        'route': '/components/navigation'
      },
      {
        'name': 'PageView',
        'category': 'navigation',
        'route': '/components/navigation'
      },
      {
        'name': 'NavigationRail',
        'category': 'navigation',
        'route': '/components/navigation'
      },
      // Text widgets
      {'name': 'Text', 'category': 'text', 'route': '/components/text'},
      {'name': 'RichText', 'category': 'text', 'route': '/components/text'},
      {
        'name': 'SelectableText',
        'category': 'text',
        'route': '/components/text'
      },
      // Image widgets
      {'name': 'Image', 'category': 'images', 'route': '/components/images'},
      {'name': 'Icon', 'category': 'images', 'route': '/components/images'},
      {
        'name': 'CircleAvatar',
        'category': 'images',
        'route': '/components/images'
      },
      {
        'name': 'NetworkImage',
        'category': 'images',
        'route': '/components/images'
      },
      // Layout widgets
      {
        'name': 'Container',
        'category': 'layout',
        'route': '/components/layout'
      },
      {'name': 'Column', 'category': 'layout', 'route': '/components/layout'},
      {'name': 'Row', 'category': 'layout', 'route': '/components/layout'},
      {'name': 'Stack', 'category': 'layout', 'route': '/components/layout'},
      {'name': 'Padding', 'category': 'layout', 'route': '/components/layout'},
      {'name': 'Center', 'category': 'layout', 'route': '/components/layout'},
      {'name': 'Wrap', 'category': 'layout', 'route': '/components/layout'},
      {'name': 'Expanded', 'category': 'layout', 'route': '/components/layout'},
      {'name': 'Flexible', 'category': 'layout', 'route': '/components/layout'},
      {'name': 'SizedBox', 'category': 'layout', 'route': '/components/layout'},
      // Lists widgets
      {'name': 'ListView', 'category': 'lists', 'route': '/components/lists'},
      {'name': 'GridView', 'category': 'lists', 'route': '/components/lists'},
      {'name': 'ListTile', 'category': 'lists', 'route': '/components/lists'},
      {
        'name': 'ReorderableListView',
        'category': 'lists',
        'route': '/components/lists'
      },
      {
        'name': 'ExpansionTile',
        'category': 'lists',
        'route': '/components/lists'
      },
      // Animation widgets
      {
        'name': 'AnimatedContainer',
        'category': 'animations',
        'route': '/components/animations'
      },
      {
        'name': 'AnimatedOpacity',
        'category': 'animations',
        'route': '/components/animations'
      },
      {
        'name': 'Hero',
        'category': 'animations',
        'route': '/components/animations'
      },
      {
        'name': 'SlideTransition',
        'category': 'animations',
        'route': '/components/animations'
      },
      {
        'name': 'AnimatedSwitcher',
        'category': 'animations',
        'route': '/components/animations'
      },
      // Forms widgets
      {'name': 'Form', 'category': 'forms', 'route': '/components/forms'},
      {'name': 'FormField', 'category': 'forms', 'route': '/components/forms'},
      {
        'name': 'TextFormField',
        'category': 'forms',
        'route': '/components/forms'
      },
      {'name': 'Validator', 'category': 'forms', 'route': '/components/forms'},
      // Material widgets
      {'name': 'Card', 'category': 'material', 'route': '/components/material'},
      {
        'name': 'Surface',
        'category': 'material',
        'route': '/components/material'
      },
      {
        'name': 'Material',
        'category': 'material',
        'route': '/components/material'
      },
      {
        'name': 'Scaffold',
        'category': 'material',
        'route': '/components/material'
      },
      {
        'name': 'BottomSheet',
        'category': 'material',
        'route': '/components/material'
      },
      // Gestures widgets
      {
        'name': 'GestureDetector',
        'category': 'gestures',
        'route': '/components/gestures'
      },
      {
        'name': 'InkWell',
        'category': 'gestures',
        'route': '/components/gestures'
      },
      {
        'name': 'Draggable',
        'category': 'gestures',
        'route': '/components/gestures'
      },
      {
        'name': 'LongPressDraggable',
        'category': 'gestures',
        'route': '/components/gestures'
      },
      // Scrolling widgets
      {
        'name': 'SingleChildScrollView',
        'category': 'scrolling',
        'route': '/components/scrolling'
      },
      {
        'name': 'CustomScrollView',
        'category': 'scrolling',
        'route': '/components/scrolling'
      },
      {
        'name': 'NestedScrollView',
        'category': 'scrolling',
        'route': '/components/scrolling'
      },
      {
        'name': 'RefreshIndicator',
        'category': 'scrolling',
        'route': '/components/scrolling'
      },
      // Media widgets
      {'name': 'MediaQuery', 'category': 'media', 'route': '/components/media'},
      {
        'name': 'LayoutBuilder',
        'category': 'media',
        'route': '/components/media'
      },
      {
        'name': 'OrientationBuilder',
        'category': 'media',
        'route': '/components/media'
      },
      {
        'name': 'AspectRatio',
        'category': 'media',
        'route': '/components/media'
      },
      // Platform widgets
      {
        'name': 'Theme',
        'category': 'platform',
        'route': '/components/platform'
      },
      {
        'name': 'Platform',
        'category': 'platform',
        'route': '/components/platform'
      },
      {
        'name': 'CupertinoButton',
        'category': 'platform',
        'route': '/components/platform'
      },
      {
        'name': 'AdaptiveIcon',
        'category': 'platform',
        'route': '/components/platform'
      },
      // Sensors widgets
      {
        'name': 'Battery',
        'category': 'sensors',
        'route': '/components/sensors'
      },
      {
        'name': 'Location',
        'category': 'sensors',
        'route': '/components/sensors'
      },
      {
        'name': 'Connectivity',
        'category': 'sensors',
        'route': '/components/sensors'
      },
      {
        'name': 'DeviceInfo',
        'category': 'sensors',
        'route': '/components/sensors'
      },
      {
        'name': 'Accelerometer',
        'category': 'sensors',
        'route': '/components/sensors'
      },
      // Accessibility widgets
      {
        'name': 'Semantics',
        'category': 'accessibility',
        'route': '/components/accessibility'
      },
      {
        'name': 'ExcludeSemantics',
        'category': 'accessibility',
        'route': '/components/accessibility'
      },
      {
        'name': 'MergeSemantics',
        'category': 'accessibility',
        'route': '/components/accessibility'
      },
      {
        'name': 'Tooltip',
        'category': 'accessibility',
        'route': '/components/accessibility'
      },
      // Performance widgets
      {
        'name': 'ListView.builder',
        'category': 'performance',
        'route': '/components/performance'
      },
      {
        'name': 'GridView.builder',
        'category': 'performance',
        'route': '/components/performance'
      },
      {
        'name': 'RepaintBoundary',
        'category': 'performance',
        'route': '/components/performance'
      },
      {
        'name': 'AutomaticKeepAlive',
        'category': 'performance',
        'route': '/components/performance'
      },
      // Advanced Animations widgets
      {
        'name': 'TweenAnimationBuilder',
        'category': 'advanced_animations',
        'route': '/components/advanced_animations'
      },
      {
        'name': 'AnimationController',
        'category': 'advanced_animations',
        'route': '/components/advanced_animations'
      },
      {
        'name': 'CustomTween',
        'category': 'advanced_animations',
        'route': '/components/advanced_animations'
      },
      {
        'name': 'Physics',
        'category': 'advanced_animations',
        'route': '/components/advanced_animations'
      },
      // Paint widgets
      {
        'name': 'CustomPaint',
        'category': 'paint',
        'route': '/components/paint'
      },
      {
        'name': 'CustomPainter',
        'category': 'paint',
        'route': '/components/paint'
      },
      {'name': 'Canvas', 'category': 'paint', 'route': '/components/paint'},
      {'name': 'Paint', 'category': 'paint', 'route': '/components/paint'},
      // State Management widgets
      {'name': 'GetX', 'category': 'state', 'route': '/components/state'},
      {'name': 'Obx', 'category': 'state', 'route': '/components/state'},
      {'name': 'GetBuilder', 'category': 'state', 'route': '/components/state'},
      {'name': 'Provider', 'category': 'state', 'route': '/components/state'},
    ]);
  }

  void search(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredWidgets.assignAll(allWidgets);
    } else {
      filteredWidgets.assignAll(allWidgets.where((widget) {
        return widget['name'].toLowerCase().contains(query.toLowerCase()) ||
            widget['category'].toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }
}
