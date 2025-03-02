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
