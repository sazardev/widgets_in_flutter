import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class InternationalizationScreen extends StatefulWidget {
  const InternationalizationScreen({super.key});

  @override
  State<InternationalizationScreen> createState() =>
      _InternationalizationScreenState();
}

class _InternationalizationScreenState
    extends State<InternationalizationScreen> {
  Locale _currentLocale = const Locale('en', 'US');
  TextDirection _textDirection = TextDirection.ltr;
  String _selectedCurrency = 'USD';
  DateTime _selectedDate = DateTime.now();

  final Map<String, Map<String, String>> _translations = {
    'en': {
      'hello': 'Hello',
      'welcome': 'Welcome',
      'language': 'Language',
      'settings': 'Settings',
      'save': 'Save',
      'cancel': 'Cancel',
      'number': '1,234.56',
      'currency': '\$1,234.56',
    },
    'es': {
      'hello': 'Hola',
      'welcome': 'Bienvenido',
      'language': 'Idioma',
      'settings': 'Configuración',
      'save': 'Guardar',
      'cancel': 'Cancelar',
      'number': '1.234,56',
      'currency': '1.234,56 €',
    },
    'fr': {
      'hello': 'Bonjour',
      'welcome': 'Bienvenue',
      'language': 'Langue',
      'settings': 'Paramètres',
      'save': 'Sauvegarder',
      'cancel': 'Annuler',
      'number': '1 234,56',
      'currency': '1 234,56 €',
    },
    'ar': {
      'hello': 'مرحبا',
      'welcome': 'أهلا وسهلا',
      'language': 'اللغة',
      'settings': 'الإعدادات',
      'save': 'حفظ',
      'cancel': 'إلغاء',
      'number': '١٬٢٣٤٫٥٦',
      'currency': '١٬٢٣٤٫٥٦ ر.س',
    },
    'ja': {
      'hello': 'こんにちは',
      'welcome': 'ようこそ',
      'language': '言語',
      'settings': '設定',
      'save': '保存',
      'cancel': 'キャンセル',
      'number': '1,234.56',
      'currency': '¥1,234',
    },
    'zh': {
      'hello': '你好',
      'welcome': '欢迎',
      'language': '语言',
      'settings': '设置',
      'save': '保存',
      'cancel': '取消',
      'number': '1,234.56',
      'currency': '¥1,234.56',
    },
  };

  final List<Map<String, dynamic>> _supportedLocales = [
    {'code': 'en', 'name': 'English', 'flag': '🇺🇸', 'rtl': false},
    {'code': 'es', 'name': 'Español', 'flag': '🇪🇸', 'rtl': false},
    {'code': 'fr', 'name': 'Français', 'flag': '🇫🇷', 'rtl': false},
    {'code': 'ar', 'name': 'العربية', 'flag': '🇸🇦', 'rtl': true},
    {'code': 'ja', 'name': '日本語', 'flag': '🇯🇵', 'rtl': false},
    {'code': 'zh', 'name': '中文', 'flag': '🇨🇳', 'rtl': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _textDirection,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_translate('language')),
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
              content: 'Locale Selection',
              components: [
                Column(
                  children: [
                    Text(
                      '${_translate('hello')}! ${_translate('welcome')}',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _supportedLocales.map((locale) {
                        final isSelected =
                            _currentLocale.languageCode == locale['code'];
                        return ChoiceChip(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(locale['flag']),
                              const SizedBox(width: 4),
                              Text(locale['name']),
                            ],
                          ),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) {
                              setState(() {
                                _currentLocale = Locale(locale['code']);
                                _textDirection = locale['rtl']
                                    ? TextDirection.rtl
                                    : TextDirection.ltr;
                              });
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
            CardComponents(
              content: 'Text Direction & RTL Support',
              components: [
                Column(
                  children: [
                    ListTile(
                      title: Text(_translate('settings')),
                      subtitle:
                          const Text('Text direction changes with locale'),
                      leading: Icon(_textDirection == TextDirection.rtl
                          ? Icons.format_textdirection_r_to_l
                          : Icons.format_textdirection_l_to_r),
                      trailing: Switch(
                        value: _textDirection == TextDirection.rtl,
                        onChanged: (value) {
                          setState(() {
                            _textDirection =
                                value ? TextDirection.rtl : TextDirection.ltr;
                          });
                        },
                      ),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(_translate('save')),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(_translate('cancel')),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            CardComponents(
              content: 'Number & Currency Formatting',
              components: [
                Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Number Format:',
                                style: Theme.of(context).textTheme.titleMedium),
                            Text(_translate('number'),
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(height: 8),
                            Text('Currency Format:',
                                style: Theme.of(context).textTheme.titleMedium),
                            Text(_translate('currency'),
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedCurrency,
                      decoration: const InputDecoration(
                        labelText: 'Currency',
                        border: OutlineInputBorder(),
                      ),
                      items: ['USD', 'EUR', 'GBP', 'JPY', 'CNY', 'SAR']
                          .map((currency) {
                        return DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCurrency = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            CardComponents(
              content: 'Date & Time Formatting',
              components: [
                Column(
                  children: [
                    ListTile(
                      title: const Text('Date Format'),
                      subtitle: Text(_formatDate(_selectedDate)),
                      leading: const Icon(Icons.calendar_today),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2030),
                        );
                        if (date != null) {
                          setState(() {
                            _selectedDate = date;
                          });
                        }
                      },
                    ),
                    ListTile(
                      title: const Text('Time Format'),
                      subtitle: Text(_formatTime(TimeOfDay.now())),
                      leading: const Icon(Icons.access_time),
                      onTap: () async {
                        await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            CardComponents(
              content: 'Input Methods & Keyboards',
              components: [
                Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: _translate('hello'),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.keyboard),
                          onPressed: () {
                            // Change keyboard type
                          },
                        ),
                      ),
                      textDirection: _textDirection,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: 'Numbers only',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.numbers),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CardComponents(
              content: 'Text Scaling & Accessibility',
              components: [
                Column(
                  children: [
                    Text(
                      'Font Scale Demo',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'This text scales with system settings',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Small text for detailed information',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.accessibility),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Accessibility features enabled',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            CardComponents(
              content: 'Platform-Specific Widgets',
              components: [
                Column(
                  children: [
                    SwitchListTile.adaptive(
                      title: const Text('Adaptive Switch'),
                      subtitle: const Text('Changes style per platform'),
                      value: true,
                      onChanged: (value) {},
                    ),
                    CheckboxListTile.adaptive(
                      title: const Text('Adaptive Checkbox'),
                      subtitle: const Text('Platform-specific styling'),
                      value: true,
                      onChanged: (value) {},
                    ),
                    ListTile(
                      title: const Text('Show Platform Dialog'),
                      subtitle: const Text('Adaptive dialog design'),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog.adaptive(
                            title: Text(_translate('hello')),
                            content: Text(_translate('welcome')),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(_translate('cancel')),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(_translate('save')),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: const NavigationBarWidget(),
      ),
    );
  }

  String _translate(String key) {
    return _translations[_currentLocale.languageCode]?[key] ??
        _translations['en']?[key] ??
        key;
  }

  String _formatDate(DateTime date) {
    switch (_currentLocale.languageCode) {
      case 'en':
        return '${date.month}/${date.day}/${date.year}';
      case 'es':
      case 'fr':
        return '${date.day}/${date.month}/${date.year}';
      case 'ar':
        return '${date.year}/${date.month}/${date.day}';
      case 'ja':
        return '${date.year}年${date.month}月${date.day}日';
      case 'zh':
        return '${date.year}年${date.month}月${date.day}日';
      default:
        return '${date.month}/${date.day}/${date.year}';
    }
  }

  String _formatTime(TimeOfDay time) {
    switch (_currentLocale.languageCode) {
      case 'en':
        final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
        final period = time.period == DayPeriod.am ? 'AM' : 'PM';
        return '$hour:${time.minute.toString().padLeft(2, '0')} $period';
      case 'ar':
        return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
      default:
        return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    }
  }
}
