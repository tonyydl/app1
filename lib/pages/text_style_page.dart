import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class TextStyleExamplePage extends StatelessWidget {
  const TextStyleExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('文字樣式範例'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionTitle(title: '文字樣式範例'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('普通文字'),
                    const SizedBox(height: 8),
                    const Text(
                      '粗體文字',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text.rich(
                      TextSpan(
                        text: 'This is ',
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'rich',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' text.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '彩色文字',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
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