import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class DialogsOverlaysScreen extends StatefulWidget {
  const DialogsOverlaysScreen({super.key});

  @override
  State<DialogsOverlaysScreen> createState() => _DialogsOverlaysScreenState();
}

class _DialogsOverlaysScreenState extends State<DialogsOverlaysScreen> {
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogs & Overlays'),
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
            content: 'Alert Dialogs',
            components: [
              ElevatedButton(
                onPressed: _showAlertDialog,
                child: const Text('Alert Dialog'),
              ),
              ElevatedButton(
                onPressed: _showConfirmDialog,
                child: const Text('Confirm Dialog'),
              ),
              ElevatedButton(
                onPressed: _showCustomDialog,
                child: const Text('Custom Dialog'),
              ),
            ],
          ),
          CardComponents(
            content: 'Simple Dialogs',
            components: [
              ElevatedButton(
                onPressed: _showSimpleDialog,
                child: const Text('Simple Dialog'),
              ),
              ElevatedButton(
                onPressed: _showAboutDialog,
                child: const Text('About Dialog'),
              ),
            ],
          ),
          CardComponents(
            content: 'Bottom Sheets',
            components: [
              ElevatedButton(
                onPressed: _showBottomSheet,
                child: const Text('Bottom Sheet'),
              ),
              ElevatedButton(
                onPressed: _showModalBottomSheet,
                child: const Text('Modal Bottom Sheet'),
              ),
              ElevatedButton(
                onPressed: _showDraggableBottomSheet,
                child: const Text('Draggable Sheet'),
              ),
            ],
          ),
          CardComponents(
            content: 'Snack Bars',
            components: [
              ElevatedButton(
                onPressed: _showSnackBar,
                child: const Text('Snack Bar'),
              ),
              ElevatedButton(
                onPressed: _showActionSnackBar,
                child: const Text('Action Snack Bar'),
              ),
              ElevatedButton(
                onPressed: _showFloatingSnackBar,
                child: const Text('Floating Snack Bar'),
              ),
            ],
          ),
          CardComponents(
            content: 'Tooltips',
            components: [
              Tooltip(
                message: 'This is a tooltip',
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.help),
                ),
              ),
              Tooltip(
                key: _tooltipKey,
                message:
                    'Custom tooltip with long text that wraps to multiple lines',
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(color: Colors.white),
                child: ElevatedButton(
                  onPressed: () =>
                      _tooltipKey.currentState?.ensureTooltipVisible(),
                  child: const Text('Show Tooltip'),
                ),
              ),
              Tooltip(
                message: 'Rich tooltip',
                richMessage: const TextSpan(
                  children: [
                    TextSpan(text: 'Rich '),
                    TextSpan(
                      text: 'Tooltip',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                child: const Icon(Icons.star, color: Colors.amber),
              ),
            ],
          ),
          CardComponents(
            content: 'Popup Menus',
            components: [
              PopupMenuButton<String>(
                onSelected: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected: $value')),
                  );
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'copy', child: Text('Copy')),
                  const PopupMenuItem(value: 'paste', child: Text('Paste')),
                  const PopupMenuItem(value: 'delete', child: Text('Delete')),
                ],
                child: const Icon(Icons.more_vert),
              ),
              PopupMenuButton<String>(
                position: PopupMenuPosition.under,
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'share',
                    child: ListTile(
                      leading: Icon(Icons.share),
                      title: Text('Share'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: ListTile(
                      leading: Icon(Icons.delete, color: Colors.red),
                      title:
                          Text('Delete', style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ],
                child: ElevatedButton(
                  onPressed: null,
                  child: const Text('Rich Popup'),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Banners',
            components: [
              ElevatedButton(
                onPressed: _showMaterialBanner,
                child: const Text('Show Banner'),
              ),
            ],
          ),
          CardComponents(
            content: 'Custom Overlays',
            components: [
              ElevatedButton(
                onPressed: _showCustomOverlay,
                child: const Text('Custom Overlay'),
              ),
              ElevatedButton(
                onPressed: _showLoadingOverlay,
                child: const Text('Loading Overlay'),
              ),
            ],
          ),
          CardComponents(
            content: 'Date & Time Pickers',
            components: [
              ElevatedButton(
                onPressed: _showDatePicker,
                child: const Text('Date Picker'),
              ),
              ElevatedButton(
                onPressed: _showTimePicker,
                child: const Text('Time Picker'),
              ),
              ElevatedButton(
                onPressed: _showDateRangePicker,
                child: const Text('Date Range Picker'),
              ),
            ],
          ),
          CardComponents(
            content: 'Expansion Panels',
            components: [
              _buildExpansionPanelList(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }

  Widget _buildExpansionPanelList() {
    return ExpansionPanelList(
      expandedHeaderPadding: const EdgeInsets.all(0),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) => const ListTile(
            title: Text('Panel 1'),
            leading: Icon(Icons.info),
          ),
          body: const ListTile(
            title: Text('This is the content of panel 1'),
            subtitle: Text('You can put any widget here'),
          ),
          isExpanded: true,
        ),
        ExpansionPanel(
          headerBuilder: (context, isExpanded) => const ListTile(
            title: Text('Panel 2'),
            leading: Icon(Icons.settings),
          ),
          body: const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(decoration: InputDecoration(labelText: 'Setting 1')),
                TextField(decoration: InputDecoration(labelText: 'Setting 2')),
              ],
            ),
          ),
          isExpanded: false,
        ),
      ],
    );
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert'),
        content: const Text('This is an alert dialog.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item deleted')),
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showCustomDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.blue.shade300, Colors.purple.shade300],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, size: 64, color: Colors.white),
              const SizedBox(height: 16),
              const Text(
                'Custom Dialog',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'This is a custom styled dialog',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSimpleDialog() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Choose an option'),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'Option 1'),
            child: const Text('Option 1'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'Option 2'),
            child: const Text('Option 2'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'Option 3'),
            child: const Text('Option 3'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'Flutter Widgets Gallery',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.flutter_dash),
      children: [
        const Text('This is a comprehensive Flutter widgets gallery.'),
      ],
    );
  }

  void _showBottomSheet() {
    showBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Bottom Sheet',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('This is a persistent bottom sheet.'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Modal Bottom Sheet',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Delete', style: TextStyle(color: Colors.red)),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showDraggableBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: ListView.builder(
            controller: scrollController,
            itemCount: 20,
            itemBuilder: (context, index) => ListTile(
              title: Text('Item $index'),
              leading: const Icon(Icons.drag_handle),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('This is a snack bar')),
    );
  }

  void _showActionSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Action snack bar'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Undo performed')),
            );
          },
        ),
      ),
    );
  }

  void _showFloatingSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Floating snack bar'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _showMaterialBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text('This is a material banner'),
        leading: const Icon(Icons.info),
        actions: [
          TextButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            child: const Text('DISMISS'),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Action performed')),
              );
            },
            child: const Text('ACTION'),
          ),
        ],
      ),
    );
  }

  void _showCustomOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height / 2 - 100,
        left: MediaQuery.of(context).size.width / 2 - 100,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, size: 64, color: Colors.white),
                const SizedBox(height: 16),
                const Text(
                  'Custom Overlay',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _overlayEntry?.remove();
                    _overlayEntry = null;
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _showLoadingOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) => Container(
        color: Colors.black54,
        child: const Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading...'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(const Duration(seconds: 3), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  void _showDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Selected date: ${date.toString().split(' ')[0]}')),
      );
    }
  }

  void _showTimePicker() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selected time: ${time.format(context)}')),
      );
    }
  }

  void _showDateRangePicker() async {
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (range != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Selected range: ${range.start.toString().split(' ')[0]} - ${range.end.toString().split(' ')[0]}'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }
}
