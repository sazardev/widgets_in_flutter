import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text'),
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
            content: 'Basic Text',
            components: [
              const Text('Simple Text'),
              Text(
                'Text with Style',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Colored Text',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'This is a very long text that will wrap to multiple lines when it reaches the edge of the container. This demonstrates text wrapping behavior.',
                textAlign: TextAlign.justify,
              ),
              Text(
                'Overflow Example: This text is designed to overflow and show ellipsis when it gets too long for its container',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          CardComponents(
            content: 'Rich Text',
            components: [
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const [
                    TextSpan(text: 'This is '),
                    TextSpan(
                      text: 'bold',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' and this is '),
                    TextSpan(
                      text: 'italic',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    TextSpan(text: ' text.'),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    const TextSpan(text: 'Different '),
                    TextSpan(
                      text: 'colored',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                      ),
                    ),
                    const TextSpan(text: ' words in '),
                    TextSpan(
                      text: 'one sentence',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const [
                    TextSpan(
                      text: '🎉 ',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextSpan(text: 'Text with '),
                    TextSpan(
                      text: 'emojis',
                      style: TextStyle(
                        backgroundColor: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: ' and background! '),
                    TextSpan(
                      text: '✨',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Selectable Text',
            components: [
              const SelectableText(
                'This text can be selected and copied. Try selecting this text with your cursor!',
              ),
              SelectableText(
                'Styled Selectable Text',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SelectableText.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'This is '),
                    TextSpan(
                      text: 'selectable rich text',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(text: ' with different styles!'),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Text Themes',
            components: [
              Text(
                'Display Large',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'Display Medium',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                'Display Small',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                'Headline Large',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Headline Medium',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Headline Small',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Title Large',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Title Medium',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Title Small',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                'Body Large',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Body Medium',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'Body Small',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                'Label Large',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'Label Medium',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Label Small',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          CardComponents(
            content: 'Text Decorations',
            components: [
              const Text(
                'Underlined Text',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              const Text(
                'Overlined Text',
                style: TextStyle(decoration: TextDecoration.overline),
              ),
              const Text(
                'Strikethrough Text',
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
              Text(
                'Combined Decorations',
                style: TextStyle(
                  decoration: TextDecoration.combine([
                    TextDecoration.underline,
                    TextDecoration.overline,
                  ]),
                  decorationColor: Theme.of(context).colorScheme.primary,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Text Alignment',
            components: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Left Aligned Text',
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Center Aligned Text',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Right Aligned Text',
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Justified Text: This is a longer text that demonstrates justified alignment. It will spread out the words evenly across the line.',
                      textAlign: TextAlign.justify,
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
}
