import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class StateManagementScreen extends StatefulWidget {
  const StateManagementScreen({super.key});

  @override
  State<StateManagementScreen> createState() => _StateManagementScreenState();
}

class _StateManagementScreenState extends State<StateManagementScreen> {
  final CounterController _counterController = Get.put(CounterController());
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced State Management'),
        actions: [
          ThemeMaterial(isLandscape: false),
          ThemeBrightness(isLandscape: false),
          ThemeSelector(isLandscape: false),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        children: [
          CardComponents(
            content: 'GetX Observable (Reactive)',
            components: [
              Obx(() => Column(
                    children: [
                      Text(
                        'Counter: ${_counterController.count}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _counterController.decrement,
                            child: const Icon(Icons.remove),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: _counterController.increment,
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _counterController.reset,
                        child: const Text('Reset'),
                      ),
                    ],
                  )),
            ],
          ),
          CardComponents(
            content: 'GetBuilder (Selective Rebuilding)',
            components: [
              GetBuilder<CounterController>(
                id: 'special-counter',
                builder: (controller) => Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Special Counter: ${controller.specialCount}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: controller.incrementSpecial,
                        child: const Text('Increment Special'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'User State Management',
            components: [
              Obx(() => Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: _userController.user.value.isLoggedIn
                            ? Colors.green
                            : Colors.grey,
                        child: Icon(
                          _userController.user.value.isLoggedIn
                              ? Icons.person
                              : Icons.person_outline,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _userController.user.value.isLoggedIn
                            ? 'Welcome, ${_userController.user.value.name}!'
                            : 'Not logged in',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _userController.user.value.isLoggedIn
                            ? _userController.logout
                            : _userController.login,
                        child: Text(
                          _userController.user.value.isLoggedIn
                              ? 'Logout'
                              : 'Login',
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          CardComponents(
            content: 'Form State with GetX',
            components: [
              GetBuilder<FormController>(
                init: FormController(),
                builder: (controller) => Column(
                  children: [
                    TextField(
                      onChanged: controller.updateEmail,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: controller.emailError,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: controller.updatePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: controller.passwordError,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: controller.isValid ? controller.submit : null,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Shopping Cart State',
            components: [
              GetBuilder<CartController>(
                init: CartController(),
                builder: (controller) => Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cart Items: ${controller.itemCount}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Total: \$${controller.total.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => controller.addItem('Item 1', 10.99),
                          child: const Text('Add Item 1'),
                        ),
                        ElevatedButton(
                          onPressed: () => controller.addItem('Item 2', 15.50),
                          child: const Text('Add Item 2'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: controller.clearCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Clear Cart'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Theme Controller',
            components: [
              GetBuilder<ThemeController>(
                init: ThemeController(),
                builder: (controller) => Column(
                  children: [
                    Row(
                      children: [
                        const Text('Dark Mode: '),
                        Switch(
                          value: controller.isDarkMode,
                          onChanged: controller.toggleTheme,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      children: [
                        _buildColorChip(controller, Colors.blue, 'Blue'),
                        _buildColorChip(controller, Colors.red, 'Red'),
                        _buildColorChip(controller, Colors.green, 'Green'),
                        _buildColorChip(controller, Colors.purple, 'Purple'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Network State Management',
            components: [
              GetBuilder<NetworkController>(
                init: NetworkController(),
                builder: (controller) => Column(
                  children: [
                    if (controller.isLoading)
                      const CircularProgressIndicator()
                    else if (controller.data.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(controller.data),
                      )
                    else
                      const Text('No data loaded'),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: controller.fetchData,
                          child: const Text('Fetch Data'),
                        ),
                        ElevatedButton(
                          onPressed: controller.clearData,
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }

  Widget _buildColorChip(
      ThemeController controller, Color color, String label) {
    return FilterChip(
      label: Text(label),
      selected: controller.primaryColor.value == color.value,
      onSelected: (_) => controller.setPrimaryColor(color),
      backgroundColor: color.withOpacity(0.2),
      selectedColor: color.withOpacity(0.5),
    );
  }
}

// Controllers
class CounterController extends GetxController {
  final _count = 0.obs;
  int get count => _count.value;

  final _specialCount = 0.obs;
  int get specialCount => _specialCount.value;

  void increment() => _count.value++;
  void decrement() => _count.value--;
  void reset() => _count.value = 0;

  void incrementSpecial() {
    _specialCount.value++;
    update(['special-counter']);
  }
}

class User {
  final String name;
  final bool isLoggedIn;

  User({required this.name, required this.isLoggedIn});
}

class UserController extends GetxController {
  final user = User(name: '', isLoggedIn: false).obs;

  void login() {
    user.value = User(name: 'John Doe', isLoggedIn: true);
  }

  void logout() {
    user.value = User(name: '', isLoggedIn: false);
  }
}

class FormController extends GetxController {
  String _email = '';
  String _password = '';
  String? emailError;
  String? passwordError;

  bool get isValid =>
      _email.isNotEmpty &&
      _password.isNotEmpty &&
      emailError == null &&
      passwordError == null;

  void updateEmail(String value) {
    _email = value;
    emailError = _validateEmail(value);
    update();
  }

  void updatePassword(String value) {
    _password = value;
    passwordError = _validatePassword(value);
    update();
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';
    if (!email.contains('@')) return 'Invalid email format';
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  void submit() {
    if (isValid) {
      Get.snackbar('Success', 'Form submitted successfully!');
    }
  }
}

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});
}

class CartController extends GetxController {
  final List<CartItem> _items = [];

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  double get total =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addItem(String name, double price) {
    final existingItem = _items.firstWhere(
      (item) => item.name == name,
      orElse: () => CartItem(name: name, price: price, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      _items.add(CartItem(name: name, price: price));
    } else {
      existingItem.quantity++;
    }
    update();
  }

  void clearCart() {
    _items.clear();
    update();
  }
}

class ThemeController extends GetxController {
  final _isDarkMode = false.obs;
  final _primaryColor = Colors.blue.value.obs;

  bool get isDarkMode => _isDarkMode.value;
  RxInt get primaryColor => _primaryColor;

  void toggleTheme(bool value) {
    _isDarkMode.value = value;
    update();
  }

  void setPrimaryColor(Color color) {
    _primaryColor.value = color.value;
    update();
  }
}

class NetworkController extends GetxController {
  bool isLoading = false;
  String data = '';

  Future<void> fetchData() async {
    isLoading = true;
    update();

    // Simulate network call
    await Future.delayed(const Duration(seconds: 2));

    data = 'Data loaded at ${DateTime.now().toString()}';
    isLoading = false;
    update();
  }

  void clearData() {
    data = '';
    update();
  }
}
