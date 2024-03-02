import 'package:flutter/material.dart';

class CardComponents extends StatelessWidget {
  const CardComponents({
    super.key,
    required this.content,
    required this.components,
  });

  final String content;
  final List<Widget> components;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              content,
              style: const TextStyle(
                fontSize: 18,
              ),
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
