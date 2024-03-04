import 'package:flutter/material.dart';

class CardComponents extends StatelessWidget {
  const CardComponents({
    super.key,
    required this.content,
    required this.components,
    this.tooltip,
    this.onPressedTooltip,
  });

  final String content;
  final List<Widget> components;
  final String? tooltip;
  final Function()? onPressedTooltip;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                if (onPressedTooltip != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: IconButton(
                      tooltip: '',
                      onPressed: onPressedTooltip,
                      icon: const Icon(Icons.info_outline),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: components,
            )
          ],
        ),
      ),
    );
  }
}
