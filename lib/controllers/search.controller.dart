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
