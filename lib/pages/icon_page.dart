import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class IconExamplePage extends StatelessWidget {
  const IconExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('圖示範例'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionTitle(title: '圖示範例'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: const [
                    Icon(Icons.home, size: 40, color: Colors.blue),
                    Icon(Icons.favorite, size: 40, color: Colors.red),
                    Icon(Icons.star, size: 40, color: Colors.amber),
                    Icon(Icons.settings, size: 40, color: Colors.grey),
                    Icon(Icons.search, size: 40, color: Colors.green),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}