Map<String, String> textSourceCodes = {
  // Text codes
  'Text-Basic': '''
Text(
  'Hello, World!',
  style: TextStyle(
    fontSize: 18,
    color: Colors.black,
  ),
)''',

  'Text-Styled': '''
Text(
  'Styled Text',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    letterSpacing: 2.0,
    decoration: TextDecoration.underline,
  ),
)''',

  'Text-WithTheme': '''
Text(
  'Text with Theme',
  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
    color: Colors.purple,
    fontWeight: FontWeight.w600,
  ),
)''',

  // RichText codes
  'RichText-Basic': '''
RichText(
  text: TextSpan(
    text: 'Hello ',
    style: DefaultTextStyle.of(context).style,
    children: const <TextSpan>[
      TextSpan(
        text: 'bold',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(text: ' world!'),
    ],
  ),
)''',

  'RichText-Complex': '''
RichText(
  text: TextSpan(
    style: DefaultTextStyle.of(context).style,
    children: <TextSpan>[
      const TextSpan(
        text: 'This is ',
        style: TextStyle(color: Colors.black),
      ),
      const TextSpan(
        text: 'bold',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
      const TextSpan(
        text: ' and this is ',
        style: TextStyle(color: Colors.black),
      ),
      const TextSpan(
        text: 'italic',
        style: TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.blue,
        ),
      ),
      const TextSpan(
        text: ' text.',
        style: TextStyle(color: Colors.black),
      ),
    ],
  ),
)''',

  // SelectableText codes
  'SelectableText-Basic': '''
SelectableText(
  'This text is selectable. You can copy and paste it.',
  style: TextStyle(fontSize: 16),
)''',

  'SelectableText-Rich': '''
SelectableText.rich(
  TextSpan(
    text: 'You can select this ',
    style: TextStyle(color: Colors.black),
    children: <TextSpan>[
      TextSpan(
        text: 'rich text',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      TextSpan(text: ' and copy it.'),
    ],
  ),
)''',

  // Text with different fonts
  'Text-CustomFont': '''
Text(
  'Custom Font Text',
  style: GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.indigo,
  ),
)''',

  // Text alignment
  'Text-Aligned': '''
Container(
  width: double.infinity,
  padding: EdgeInsets.all(16),
  child: Column(
    children: [
      Text(
        'Left Aligned Text',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 8),
      Text(
        'Center Aligned Text',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 8),
      Text(
        'Right Aligned Text',
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 8),
      Text(
        'Justified text that spans multiple lines to demonstrate text justification in Flutter.',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 16),
      ),
    ],
  ),
)''',

  // Text overflow
  'Text-Overflow': '''
Container(
  width: 200,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'This is a very long text that will be clipped',
        overflow: TextOverflow.clip,
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 8),
      Text(
        'This is a very long text that will show ellipsis',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 8),
      Text(
        'This is a very long text that will fade out at the end',
        overflow: TextOverflow.fade,
        style: TextStyle(fontSize: 16),
      ),
    ],
  ),
)''',

  // AutoSizeText (requires auto_size_text package)
  'AutoSizeText-Basic': '''
// Add to pubspec.yaml: auto_size_text: ^3.0.0

Container(
  width: 200,
  height: 50,
  child: AutoSizeText(
    'This text will automatically resize to fit the container',
    style: TextStyle(fontSize: 20),
    maxLines: 2,
  ),
)''',

  // Text with decoration
  'Text-Decorated': '''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Underlined Text',
      style: TextStyle(
        fontSize: 18,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationThickness: 2,
      ),
    ),
    SizedBox(height: 8),
    Text(
      'Strikethrough Text',
      style: TextStyle(
        fontSize: 18,
        decoration: TextDecoration.lineThrough,
        decorationColor: Colors.blue,
        decorationThickness: 2,
      ),
    ),
    SizedBox(height: 8),
    Text(
      'Overlined Text',
      style: TextStyle(
        fontSize: 18,
        decoration: TextDecoration.overline,
        decorationColor: Colors.green,
        decorationThickness: 2,
      ),
    ),
  ],
)''',

  // Text with shadows
  'Text-WithShadow': '''
Text(
  'Text with Shadow',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: [
      Shadow(
        blurRadius: 10.0,
        color: Colors.black.withOpacity(0.5),
        offset: Offset(2.0, 2.0),
      ),
    ],
  ),
)''',

  // Text with gradient (requires custom implementation)
  'Text-Gradient': '''
// Custom Gradient Text Widget
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

// Usage:
GradientText(
  'Gradient Text',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
  gradient: LinearGradient(
    colors: [Colors.blue, Colors.purple, Colors.red],
  ),
)''',

  // DefaultTextStyle
  'DefaultTextStyle-Basic': '''
DefaultTextStyle(
  style: TextStyle(
    fontSize: 18,
    color: Colors.blue,
    fontWeight: FontWeight.w500,
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('This text uses default style'),
      Text('This text also uses default style'),
      Text(
        'This text overrides the default style',
        style: TextStyle(color: Colors.red),
      ),
    ],
  ),
)''',
};
