import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class ConstrainedBoxExamplePage extends StatelessWidget {
  const ConstrainedBoxExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ConstrainedBox 約束盒子'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionTitle(title: 'ConstrainedBox 約束盒子範例'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '📌 ConstrainedBox：設定尺寸約束的盒子',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 設定最小尺寸
                    const Text(
                      '1️⃣ 設定最小尺寸 (minWidth, minHeight)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 200,
                        minHeight: 100,
                      ),
                      child: Container(
                        color: Colors.blue.withValues(alpha: 0.3),
                        child: const Center(child: Text('短文字')),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 設定最大尺寸
                    const Text(
                      '2️⃣ 設定最大尺寸 (maxWidth, maxHeight)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 180,
                        maxHeight: 80,
                      ),
                      child: Container(
                        color: Colors.green.withValues(alpha: 0.3),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          '這是一段很長的文字內容，會因為最大尺寸限制而自動換行',
                          textAlign: TextAlign.center,
                        ),
                      ),
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