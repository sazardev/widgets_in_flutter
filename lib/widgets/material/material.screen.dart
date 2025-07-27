import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({super.key});

  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Design'),
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
            content: 'Cards & Surfaces',
            components: [
              Card(
                elevation: 4,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Elevated Card'),
                ),
              ),
              Card.outlined(
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Outlined Card'),
                ),
              ),
              Card.filled(
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Filled Card'),
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Badges & Indicators',
            components: [
              Badge(
                label: const Text('3'),
                child: const Icon(Icons.notifications, size: 32),
              ),
              Badge.count(
                count: 99,
                child: Icon(Icons.email, size: 32),
              ),
              Badge(
                backgroundColor: Colors.red,
                child: const Icon(Icons.shopping_cart, size: 32),
              ),
              const CircularProgressIndicator(),
              const LinearProgressIndicator(),
            ],
          ),
          CardComponents(
            content: 'Material Banner',
            components: [
              MaterialBanner(
                content: const Text('This is a material banner'),
                leading: const Icon(Icons.info),
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('DISMISS'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('ACTION'),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Bottom Sheet',
            components: [
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: 200,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Modal Bottom Sheet',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          ListTile(
                            leading: const Icon(Icons.share),
                            title: const Text('Share'),
                            onTap: () => Navigator.pop(context),
                          ),
                          ListTile(
                            leading: const Icon(Icons.copy),
                            title: const Text('Copy'),
                            onTap: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ],
          ),
          CardComponents(
            content: 'Snack Bar',
            components: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('This is a snack bar'),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {},
                      ),
                    ),
                  );
                },
                child: const Text('Show SnackBar'),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Success message'),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: const Text('Floating SnackBar'),
              ),
            ],
          ),
          CardComponents(
            content: 'Tooltips',
            components: [
              const Tooltip(
                message: 'This is a tooltip',
                child: Icon(Icons.help_outline, size: 32),
              ),
              Tooltip(
                message: 'Custom styled tooltip',
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(color: Colors.white),
                child: const Icon(Icons.info, size: 32),
              ),
            ],
          ),
          CardComponents(
            content: 'Stepper',
            components: [
              SizedBox(
                height: 300,
                child: Stepper(
                  currentStep: _currentStep,
                  onStepTapped: (step) {
                    setState(() {
                      _currentStep = step;
                    });
                  },
                  controlsBuilder: (context, details) {
                    return Row(
                      children: [
                        if (details.stepIndex < 2)
                          ElevatedButton(
                            onPressed: details.onStepContinue,
                            child: const Text('Next'),
                          ),
                        const SizedBox(width: 8),
                        if (details.stepIndex > 0)
                          TextButton(
                            onPressed: details.onStepCancel,
                            child: const Text('Back'),
                          ),
                      ],
                    );
                  },
                  onStepContinue: () {
                    if (_currentStep < 2) {
                      setState(() {
                        _currentStep++;
                      });
                    }
                  },
                  onStepCancel: () {
                    if (_currentStep > 0) {
                      setState(() {
                        _currentStep--;
                      });
                    }
                  },
                  steps: [
                    Step(
                      title: const Text('Step 1'),
                      content: const Text('First step content'),
                      isActive: _currentStep >= 0,
                      state: _currentStep > 0
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: const Text('Step 2'),
                      content: const Text('Second step content'),
                      isActive: _currentStep >= 1,
                      state: _currentStep > 1
                          ? StepState.complete
                          : _currentStep == 1
                              ? StepState.indexed
                              : StepState.disabled,
                    ),
                    Step(
                      title: const Text('Step 3'),
                      content: const Text('Final step content'),
                      isActive: _currentStep >= 2,
                      state: _currentStep == 2
                          ? StepState.indexed
                          : StepState.disabled,
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Tab Bar',
            components: [
              SizedBox(
                height: 200,
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(icon: Icon(Icons.home), text: 'Home'),
                        Tab(icon: Icon(Icons.search), text: 'Search'),
                        Tab(icon: Icon(Icons.person), text: 'Profile'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          const Center(child: Text('Home Content')),
                          const Center(child: Text('Search Content')),
                          const Center(child: Text('Profile Content')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Expansion Panels',
            components: [
              ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    // Toggle expansion state
                  });
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return const ListTile(
                        title: Text('Panel 1'),
                      );
                    },
                    body: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Content of panel 1'),
                    ),
                    isExpanded: false,
                  ),
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return const ListTile(
                        title: Text('Panel 2'),
                      );
                    },
                    body: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Content of panel 2'),
                    ),
                    isExpanded: false,
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Dividers',
            components: [
              Column(
                children: [
                  const Text('Above divider'),
                  const Divider(),
                  const Text('Below divider'),
                  const Divider(
                    color: Colors.blue,
                    thickness: 2,
                  ),
                  const Text('Thick blue divider'),
                  Divider(
                    color: Colors.red,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const Text('Indented divider'),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
