import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/theme/theme.controller.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({
    super.key,
    required ThemeController themeController,
  }) : _themeController = themeController;

  final ThemeController _themeController;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Color>(
      icon: const Icon(Icons.color_lens),
      onSelected: (Color color) {
        _themeController.changePrimaryColor(color);
      },
      itemBuilder: (BuildContext context) => const <PopupMenuEntry<Color>>[
        PopupMenuItem<Color>(
          value: Colors.blue,
          child: ListTile(
            leading: Icon(Icons.palette_outlined, color: Colors.blue),
            title: Text('Blue'),
          ),
        ),
        PopupMenuItem<Color>(
          value: Colors.red,
          child: ListTile(
            leading: Icon(Icons.palette_outlined, color: Colors.red),
            title: Text('Red'),
          ),
        ),
        PopupMenuItem<Color>(
          value: Colors.green,
          child: ListTile(
            leading: Icon(Icons.palette_outlined, color: Colors.green),
            title: Text('Green'),
          ),
        ),
        PopupMenuItem<Color>(
          value: Colors.yellow,
          child: ListTile(
            leading: Icon(Icons.palette_outlined, color: Colors.yellow),
            title: Text('Yellow'),
          ),
        ),
        PopupMenuItem<Color>(
          value: Colors.orange,
          child: ListTile(
            leading: Icon(Icons.palette_outlined, color: Colors.orange),
            title: Text('Orange'),
          ),
        ),
        PopupMenuItem<Color>(
          value: Colors.purple,
          child: ListTile(
            leading: Icon(Icons.palette_outlined, color: Colors.purple),
            title: Text('Purple'),
          ),
        ),
        PopupMenuItem<Color>(
          value: Colors.brown,
          child: ListTile(
            leading: Icon(Icons.palette_outlined, color: Colors.brown),
            title: Text('Brown'),
          ),
        ),
        PopupMenuItem<Color>(
          value: Colors.grey,
          child: ListTile(
            leading: Icon(Icons.palette_outlined, color: Colors.grey),
            title: Text('Grey'),
          ),
        ),
        PopupMenuItem<Color>(
          value: Colors.teal,
          child: ListTile(
            leading: Icon(Icons.palette_outlined, color: Colors.teal),
            title: Text('Teal'),
          ),
        ),
        PopupMenuItem<Color>(
          value: Colors.cyan,
          child: ListTile(
            leading: Icon(Icons.palette_outlined, color: Colors.cyan),
            title: Text('Cyan'),
          ),
        ),
        PopupMenuItem<Color>(
          value: Colors.indigo,
          child: ListTile(
            leading: Icon(Icons.palette_outlined, color: Colors.indigo),
            title: Text('Indigo'),
          ),
        ),
      ],
    );
  }
}
