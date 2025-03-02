import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

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
    return FadeIn(
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    content,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (onPressedTooltip != null)
                    ElevatedButton.icon(
                      onPressed: onPressedTooltip,
                      icon: const Icon(Icons.code),
                      label: const Text('View Code'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        foregroundColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                ],
              ),
              const Divider(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.start,
                children: components,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
