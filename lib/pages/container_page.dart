import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class ContainerExamplePage extends StatelessWidget {
  const ContainerExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Container 差異驗證'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionTitle(title: 'Container 無子/有子 Widget 差異'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '📌 重點：Container 的行為會根據有無子 Widget 而不同',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 1. 無子 Widget 的 Container
                    const Text(
                      '1️⃣ 無子 Widget 的 Container',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Text('→ 會盡可能擴展至最大可用空間'),
                    const SizedBox(height: 8),
                    Container(
                      height: 100,
                      color: Colors.blue.withValues(alpha: 0.3),
                    ),
                    const SizedBox(height: 16),

                    // 2. 有子 Widget 的 Container
                    const Text(
                      '2️⃣ 有子 Widget 的 Container',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Text('→ 會收縮以適應子 Widget 的大小'),
                    const SizedBox(height: 8),
                    Container(
                      color: Colors.green.withValues(alpha: 0.3),
                      padding: const EdgeInsets.all(16),
                      child: const Text('我是子 Widget'),
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