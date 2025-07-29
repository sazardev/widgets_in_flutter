Map<String, String> inputSourceCodes = {
  // TextField codes
  'TextField-Basic': '''
TextField(
  decoration: const InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Enter your name',
  ),
  onChanged: (String value) {
    print('Text changed: \$value');
  },
)''',

  'TextField-WithController': '''
// In your StatefulWidget:
final TextEditingController _controller = TextEditingController();

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

TextField(
  controller: _controller,
  decoration: const InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Enter your name',
    helperText: 'Your full name',
  ),
  onSubmitted: (String value) {
    print('Submitted: \$value');
  },
)''',

  'TextField-Password': '''
// In your StatefulWidget:
bool _obscureText = true;

TextField(
  obscureText: _obscureText,
  decoration: InputDecoration(
    border: const OutlineInputBorder(),
    labelText: 'Password',
    suffixIcon: IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility : Icons.visibility_off,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    ),
  ),
)''',

  'TextField-Multiline': '''
TextField(
  maxLines: 4,
  decoration: const InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Enter your message',
    alignLabelWithHint: true,
  ),
)''',

  // TextFormField codes
  'TextFormField-Basic': '''
TextFormField(
  decoration: const InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Enter your email',
  ),
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  },
)''',

  'TextFormField-WithValidation': '''
// Wrap in Form widget with GlobalKey
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Name',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print('Form is valid');
          }
        },
        child: const Text('Submit'),
      ),
    ],
  ),
)''',

  // SearchBar codes
  'SearchBar-Basic': '''
SearchBar(
  hintText: 'Search...',
  onChanged: (String value) {
    print('Search query: \$value');
  },
  leading: const Icon(Icons.search),
)''',

  'SearchAnchor-Basic': '''
SearchAnchor(
  builder: (BuildContext context, SearchController controller) {
    return IconButton(
      onPressed: () {
        controller.openView();
      },
      icon: const Icon(Icons.search),
    );
  },
  suggestionsBuilder: (BuildContext context, SearchController controller) {
    return List<ListTile>.generate(5, (int index) {
      final String item = 'item \$index';
      return ListTile(
        title: Text(item),
        onTap: () {
          controller.closeView(item);
        },
      );
    });
  },
)''',

  // Form components
  'Form-Complete': '''
class MyFormWidget extends StatefulWidget {
  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}''',

  // Dropdown codes
  'DropdownButton-Basic': '''
// In your StatefulWidget:
String dropdownValue = 'One';

DropdownButton<String>(
  value: dropdownValue,
  icon: const Icon(Icons.arrow_downward),
  elevation: 16,
  style: const TextStyle(color: Colors.deepPurple),
  underline: Container(
    height: 2,
    color: Colors.deepPurpleAccent,
  ),
  onChanged: (String? value) {
    setState(() {
      dropdownValue = value!;
    });
  },
  items: <String>['One', 'Two', 'Free', 'Four']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
)''',

  'DropdownButtonFormField-Basic': '''
// In your StatefulWidget:
String? selectedValue;

DropdownButtonFormField<String>(
  decoration: const InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Select an option',
  ),
  value: selectedValue,
  onChanged: (String? newValue) {
    setState(() {
      selectedValue = newValue;
    });
  },
  items: <String>['Option 1', 'Option 2', 'Option 3']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select an option';
    }
    return null;
  },
)''',

  // Stepper codes
  'Stepper-Basic': '''
// In your StatefulWidget:
int currentStep = 0;

Stepper(
  currentStep: currentStep,
  onStepTapped: (step) => setState(() => currentStep = step),
  onStepContinue: () {
    if (currentStep < 2) {
      setState(() => currentStep++);
    }
  },
  onStepCancel: () {
    if (currentStep > 0) {
      setState(() => currentStep--);
    }
  },
  steps: [
    Step(
      title: const Text('Step 1'),
      content: const Text('This is the first step.'),
      isActive: currentStep >= 0,
    ),
    Step(
      title: const Text('Step 2'),
      content: const Text('This is the second step.'),
      isActive: currentStep >= 1,
    ),
    Step(
      title: const Text('Step 3'),
      content: const Text('This is the third step.'),
      isActive: currentStep >= 2,
    ),
  ],
)''',
};
