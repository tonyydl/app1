import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class FlexExamplePage extends StatelessWidget {
  const FlexExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Expanded、Spacer、Flexible'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionTitle(title: 'Expanded、Spacer、Flexible 彈性元件範例'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '📌 彈性元件：在 Row/Column 中動態分配空間',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Expanded 基本用法
                    const Text(
                      '1️⃣ Expanded - 填滿剩餘空間',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            color: Colors.red.withValues(alpha: 0.3),
                            child: const Center(child: Text('固定')),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.blue.withValues(alpha: 0.3),
                              child: const Center(child: Text('Expanded 填滿剩餘')),
                            ),
                          ),
                          Container(
                            width: 80,
                            color: Colors.red.withValues(alpha: 0.3),
                            child: const Center(child: Text('固定')),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Spacer 空白間距
                    const Text(
                      '2️⃣ Spacer - 空白間距元件',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            color: Colors.orange.withValues(alpha: 0.3),
                            child: const Center(child: Text('左側')),
                          ),
                          const Spacer(),
                          Container(
                            width: 80,
                            color: Colors.purple.withValues(alpha: 0.3),
                            child: const Center(child: Text('右側')),
                          ),
                        ],
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