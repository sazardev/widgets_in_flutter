import 'package:flutter/material.dart';
import 'package:widgets_in_flutter/core/theme/theme-brightness.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-color.widget.dart';
import 'package:widgets_in_flutter/core/theme/theme-material.widget.dart';
import 'package:widgets_in_flutter/shared/cardcomponents.widget.dart';
import 'package:widgets_in_flutter/shared/navigationbar.widget.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images & Icons'),
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
            content: 'Basic Icons',
            components: [
              const Icon(Icons.home),
              const Icon(Icons.star, color: Colors.amber),
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 32,
              ),
              Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.primary,
                size: 40,
              ),
              const Icon(
                Icons.cloud,
                color: Colors.blue,
                size: 48,
              ),
            ],
          ),
          CardComponents(
            content: 'Icon Buttons',
            components: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
                color: Colors.blue,
              ),
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          CardComponents(
            content: 'Avatar Icons',
            components: [
              const CircleAvatar(
                child: Text('A'),
              ),
              const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
              ),
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 30,
                child: const Text(
                  'AB',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  'https://picsum.photos/100/100?random=1',
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Network Images',
            components: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/150/100?random=2',
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 150,
                      height: 100,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.error),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 150,
                      height: 100,
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/120/120?random=3',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 120,
                      height: 120,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.image_not_supported),
                    );
                  },
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Asset Images',
            components: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/icon.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              ClipOval(
                child: Image.asset(
                  'assets/icon.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child:
                          const Icon(Icons.flutter_dash, color: Colors.white),
                    );
                  },
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Image Fit Types',
            components: [
              Column(
                children: [
                  const Text('BoxFit.cover'),
                  Container(
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Image.network(
                      'https://picsum.photos/200/300?random=4',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.error));
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('BoxFit.contain'),
                  Container(
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Image.network(
                      'https://picsum.photos/200/300?random=5',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.error));
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('BoxFit.fill'),
                  Container(
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Image.network(
                      'https://picsum.photos/200/300?random=6',
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.error));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          CardComponents(
            content: 'Icon Themes',
            components: [
              IconTheme(
                data: IconThemeData(
                  color: Colors.red,
                  size: 32,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star),
                    SizedBox(width: 8),
                    Icon(Icons.favorite),
                    SizedBox(width: 8),
                    Icon(Icons.thumb_up),
                  ],
                ),
              ),
              IconTheme(
                data: IconThemeData(
                  color: Theme.of(context).colorScheme.primary,
                  size: 28,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 8),
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    Icon(Icons.settings),
                  ],
                ),
              ),
            ],
          ),
          CardComponents(
            content: 'Custom Icons & Decorations',
            components: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue.shade100,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Icon(
                  Icons.cloud,
                  color: Colors.blue.shade700,
                  size: 30,
                ),
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/100/100?random=7',
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
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
