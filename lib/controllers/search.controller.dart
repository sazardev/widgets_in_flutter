import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetSearchController extends GetxController {
  final RxList<Map<String, dynamic>> allWidgets = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredWidgets =
      <Map<String, dynamic>>[].obs;
  final RxString searchQuery = ''.obs;
  final RxString selectedCategory = 'all'.obs;
  final RxList<String> searchHistory = <String>[].obs;
  final RxList<String> popularSearches = <String>[].obs;
  final RxBool isAdvancedSearch = false.obs;
  final RxString sortBy = 'name'.obs; // name, category, popularity
  final RxBool sortAscending = true.obs;
  final RxList<String> availableCategories = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadWidgets();
    loadSearchHistory();
    loadPopularSearches();
    filteredWidgets.assignAll(allWidgets);
    _updateAvailableCategories();

    // Escuchar cambios para actualizar filtros
    ever(searchQuery, (_) => _updateFilteredWidgets());
    ever(selectedCategory, (_) => _updateFilteredWidgets());
    ever(sortBy, (_) => _updateFilteredWidgets());
    ever(sortAscending, (_) => _updateFilteredWidgets());
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
      // Cupertino widgets
      {
        'name': 'CupertinoButton',
        'category': 'cupertino',
        'route': '/components/cupertino'
      },
      {
        'name': 'CupertinoSwitch',
        'category': 'cupertino',
        'route': '/components/cupertino'
      },
      {
        'name': 'CupertinoSlider',
        'category': 'cupertino',
        'route': '/components/cupertino'
      },
      {
        'name': 'CupertinoTextField',
        'category': 'cupertino',
        'route': '/components/cupertino'
      },
      {
        'name': 'CupertinoDatePicker',
        'category': 'cupertino',
        'route': '/components/cupertino'
      },
      {
        'name': 'CupertinoActivityIndicator',
        'category': 'cupertino',
        'route': '/components/cupertino'
      },
      {
        'name': 'CupertinoAlertDialog',
        'category': 'cupertino',
        'route': '/components/cupertino'
      },
      {
        'name': 'CupertinoActionSheet',
        'category': 'cupertino',
        'route': '/components/cupertino'
      },
      // Slivers widgets
      {
        'name': 'SliverAppBar',
        'category': 'slivers',
        'route': '/components/slivers'
      },
      {
        'name': 'SliverList',
        'category': 'slivers',
        'route': '/components/slivers'
      },
      {
        'name': 'SliverGrid',
        'category': 'slivers',
        'route': '/components/slivers'
      },
      {
        'name': 'SliverToBoxAdapter',
        'category': 'slivers',
        'route': '/components/slivers'
      },
      {
        'name': 'SliverPersistentHeader',
        'category': 'slivers',
        'route': '/components/slivers'
      },
      {
        'name': 'CustomScrollView',
        'category': 'slivers',
        'route': '/components/slivers'
      },
      // Dialogs & Overlays widgets
      {
        'name': 'AlertDialog',
        'category': 'dialogs_overlays',
        'route': '/components/dialogs_overlays'
      },
      {
        'name': 'SimpleDialog',
        'category': 'dialogs_overlays',
        'route': '/components/dialogs_overlays'
      },
      {
        'name': 'BottomSheet',
        'category': 'dialogs_overlays',
        'route': '/components/dialogs_overlays'
      },
      {
        'name': 'SnackBar',
        'category': 'dialogs_overlays',
        'route': '/components/dialogs_overlays'
      },
      {
        'name': 'Tooltip',
        'category': 'dialogs_overlays',
        'route': '/components/dialogs_overlays'
      },
      {
        'name': 'PopupMenuButton',
        'category': 'dialogs_overlays',
        'route': '/components/dialogs_overlays'
      },
      {
        'name': 'MaterialBanner',
        'category': 'dialogs_overlays',
        'route': '/components/dialogs_overlays'
      },
      // Effects & Filters widgets
      {
        'name': 'Opacity',
        'category': 'effects_filters',
        'route': '/components/effects_filters'
      },
      {
        'name': 'Transform',
        'category': 'effects_filters',
        'route': '/components/effects_filters'
      },
      {
        'name': 'BackdropFilter',
        'category': 'effects_filters',
        'route': '/components/effects_filters'
      },
      {
        'name': 'ShaderMask',
        'category': 'effects_filters',
        'route': '/components/effects_filters'
      },
      {
        'name': 'ClipPath',
        'category': 'effects_filters',
        'route': '/components/effects_filters'
      },
      {
        'name': 'ClipRRect',
        'category': 'effects_filters',
        'route': '/components/effects_filters'
      },
      // Testing & Debug widgets
      {
        'name': 'DebugPrint',
        'category': 'testing_debug',
        'route': '/components/testing_debug'
      },
      {
        'name': 'Assert',
        'category': 'testing_debug',
        'route': '/components/testing_debug'
      },
      {
        'name': 'Key',
        'category': 'testing_debug',
        'route': '/components/testing_debug'
      },
      {
        'name': 'ValueKey',
        'category': 'testing_debug',
        'route': '/components/testing_debug'
      },
      {
        'name': 'WidgetTester',
        'category': 'testing_debug',
        'route': '/components/testing_debug'
      },

      // Charts & Data Visualization
      {
        'name': 'LinearProgressIndicator',
        'category': 'charts_data',
        'route': '/components/charts_data'
      },
      {
        'name': 'CircularProgressIndicator',
        'category': 'charts_data',
        'route': '/components/charts_data'
      },
      {
        'name': 'DataTable',
        'category': 'charts_data',
        'route': '/components/charts_data'
      },
      {
        'name': 'CustomPaint',
        'category': 'charts_data',
        'route': '/components/charts_data'
      },
      {
        'name': 'BarChart',
        'category': 'charts_data',
        'route': '/components/charts_data'
      },
      {
        'name': 'LineChart',
        'category': 'charts_data',
        'route': '/components/charts_data'
      },
      {
        'name': 'PieChart',
        'category': 'charts_data',
        'route': '/components/charts_data'
      },
      {
        'name': 'GaugeChart',
        'category': 'charts_data',
        'route': '/components/charts_data'
      },

      // Internationalization
      {
        'name': 'Directionality',
        'category': 'internationalization',
        'route': '/components/internationalization'
      },
      {
        'name': 'Localizations',
        'category': 'internationalization',
        'route': '/components/internationalization'
      },
      {
        'name': 'TextDirection',
        'category': 'internationalization',
        'route': '/components/internationalization'
      },
      {
        'name': 'DatePicker',
        'category': 'internationalization',
        'route': '/components/internationalization'
      },
      {
        'name': 'NumberFormat',
        'category': 'internationalization',
        'route': '/components/internationalization'
      },
      {
        'name': 'InputMethod',
        'category': 'internationalization',
        'route': '/components/internationalization'
      },

      // Security & Authentication
      {
        'name': 'TextField',
        'category': 'security_auth',
        'route': '/components/security_auth'
      },
      {
        'name': 'BiometricAuth',
        'category': 'security_auth',
        'route': '/components/security_auth'
      },
      {
        'name': 'TwoFactorAuth',
        'category': 'security_auth',
        'route': '/components/security_auth'
      },
      {
        'name': 'PinInput',
        'category': 'security_auth',
        'route': '/components/security_auth'
      },
      {
        'name': 'Encryption',
        'category': 'security_auth',
        'route': '/components/security_auth'
      },
      {
        'name': 'SessionManager',
        'category': 'security_auth',
        'route': '/components/security_auth'
      },
    ]);
  }

  void search(String query) {
    searchQuery.value = query;
    if (query.isNotEmpty) {
      _addToSearchHistory(query);
      _updatePopularSearches(query);
    }
    _updateFilteredWidgets();
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
  }

  void setSortBy(String sort) {
    if (sortBy.value == sort) {
      sortAscending.value = !sortAscending.value;
    } else {
      sortBy.value = sort;
      sortAscending.value = true;
    }
  }

  void toggleAdvancedSearch() {
    isAdvancedSearch.value = !isAdvancedSearch.value;
  }

  void clearSearch() {
    searchQuery.value = '';
    selectedCategory.value = 'all';
    sortBy.value = 'name';
    sortAscending.value = true;
  }

  List<Map<String, dynamic>> getSearchSuggestions(String query) {
    if (query.isEmpty) return [];

    return allWidgets
        .where((widget) =>
            widget['name'].toLowerCase().startsWith(query.toLowerCase()))
        .take(5)
        .toList();
  }

  void _updateFilteredWidgets() {
    var filtered = allWidgets.where((widget) {
      final matchesSearch = searchQuery.value.isEmpty ||
          widget['name']
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()) ||
          widget['category']
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase());

      final matchesCategory = selectedCategory.value == 'all' ||
          widget['category'] == selectedCategory.value;

      return matchesSearch && matchesCategory;
    }).toList();

    // Aplicar ordenamiento
    filtered.sort((a, b) {
      int comparison = 0;

      switch (sortBy.value) {
        case 'category':
          comparison = a['category'].compareTo(b['category']);
          break;
        case 'popularity':
          // Simulamos popularidad basada en si está en búsquedas populares
          final aPopular = popularSearches.contains(a['name']) ? 1 : 0;
          final bPopular = popularSearches.contains(b['name']) ? 1 : 0;
          comparison = aPopular.compareTo(bPopular);
          break;
        case 'name':
        default:
          comparison = a['name'].compareTo(b['name']);
          break;
      }

      return sortAscending.value ? comparison : -comparison;
    });

    filteredWidgets.assignAll(filtered);
  }

  void _updateAvailableCategories() {
    final categories = allWidgets
        .map((widget) => widget['category'] as String)
        .toSet()
        .toList();
    categories.sort();
    availableCategories.assignAll(['all', ...categories]);
  }

  Future<void> loadSearchHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final history = prefs.getStringList('search_history') ?? [];
      searchHistory.assignAll(history);
    } catch (e) {
      print('Error loading search history: $e');
    }
  }

  Future<void> _addToSearchHistory(String query) async {
    if (query.trim().isEmpty) return;

    // Remover si ya existe
    searchHistory.remove(query);
    // Agregar al inicio
    searchHistory.insert(0, query);
    // Mantener solo los últimos 10
    if (searchHistory.length > 10) {
      searchHistory.removeRange(10, searchHistory.length);
    }

    // Guardar en SharedPreferences
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('search_history', searchHistory.toList());
    } catch (e) {
      print('Error saving search history: $e');
    }
  }

  Future<void> loadPopularSearches() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final popular = prefs.getStringList('popular_searches') ?? [];
      popularSearches.assignAll(popular);
    } catch (e) {
      print('Error loading popular searches: $e');
    }
  }

  Future<void> _updatePopularSearches(String query) async {
    if (query.trim().isEmpty) return;

    // Incrementar contador (simulado)
    if (!popularSearches.contains(query)) {
      popularSearches.add(query);
      // Mantener solo los 5 más populares
      if (popularSearches.length > 5) {
        popularSearches.removeAt(0);
      }

      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setStringList('popular_searches', popularSearches.toList());
      } catch (e) {
        print('Error saving popular searches: $e');
      }
    }
  }

  void clearSearchHistory() async {
    searchHistory.clear();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('search_history');
    } catch (e) {
      print('Error clearing search history: $e');
    }
  }

  List<String> getAvailableCategories() {
    return availableCategories.toList();
  }
}
