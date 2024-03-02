// theme-selector.widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_in_flutter/theme/theme.controller.dart';

final Map<Color, String> colorList = {
  Colors.blue: 'Blue',
  Colors.red: 'Red',
  Colors.green: 'Green',
  Colors.orange: 'Orange',
  Colors.purple: 'Purple',
  Colors.brown: 'Brown',
  Colors.grey: 'Grey',
  Colors.teal: 'Teal',
  Colors.cyan: 'Cyan',
  Colors.indigo: 'Indigo',
};

class ThemeSelector extends StatelessWidget {
  ThemeSelector({
    super.key,
    required this.isLandscape,
  });

  final ThemeController themeController = Get.put(ThemeController());
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    return isLandscape
        ? SizedBox(
            height: 200,
            child: GridView.count(
              crossAxisCount: 5,
              children: colorList.entries.map((entry) {
                return Radio<Color>(
                  value: entry.key,
                  groupValue: themeController.primaryColor.value,
                  onChanged: (Color? color) {
                    themeController.changePrimaryColor(color!);
                  },
                  activeColor: entry.key,
                  hoverColor: entry.key.withOpacity(0.1),
                  focusColor: entry.key,
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return entry.key.withOpacity(.32);
                    }
                    return entry.key;
                  }),
                );
              }).toList(),
            ),
          )
        : PopupMenuButton<Color>(
            icon: const Icon(Icons.color_lens),
            onSelected: (Color color) {
              themeController.changePrimaryColor(color);
            },
            itemBuilder: (BuildContext context) {
              return colorList.entries.map((entry) {
                return PopupMenuItem<Color>(
                  value: entry.key,
                  child: ListTile(
                    leading: Icon(Icons.circle, color: entry.key),
                    title: Text(entry.value),
                  ),
                );
              }).toList();
            },
          );
  }

  bool useWhiteForeground(Color color) {
    return 1.05 / (color.computeLuminance() + 0.05) > 4.5;
  }
}
