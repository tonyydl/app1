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
                      // 注意：沒有 child
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '↑ 這個藍色 Container 沒有子元件，所以寬度會填滿整個可用空間',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

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
                    const SizedBox(height: 8),
                    const Text(
                      '↑ 這個綠色 Container 有子元件，所以只會包裹子元件的大小',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // 3. 並排對比
                    const Text(
                      '3️⃣ 並排對比（Row 內的行為）',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        // 無子 Widget - 需要指定寬度，否則會報錯
                        Container(
                          width: 100,
                          height: 80,
                          color: Colors.red.withValues(alpha: 0.3),
                        ),
                        const SizedBox(width: 8),
                        // 有子 Widget - 自動調整大小
                        Container(
                          height: 80,
                          color: Colors.orange.withValues(alpha: 0.3),
                          padding: const EdgeInsets.all(16),
                          child: const Center(child: Text('有子元件')),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '↑ 左邊（紅色）：無子元件，必須指定 width\n'
                      '↑ 右邊（橘色）：有子元件，自動調整寬度',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // 4. 設定固定尺寸的對比
                    const Text(
                      '4️⃣ 設定固定尺寸後的行為',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 120,
                              height: 80,
                              color: Colors.purple.withValues(alpha: 0.3),
                              // 無子元件
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '無子\n固定尺寸',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 120,
                              height: 80,
                              color: Colors.teal.withValues(alpha: 0.3),
                              child: const Center(child: Text('內容')),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '有子\n固定尺寸',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '↑ 當設定固定 width/height 時，有無子元件的差異就不明顯了',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // 總結
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.amber.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.amber),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📝 總結',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('• 無子 Widget：Container 會盡量擴展'),
                          Text('• 有子 Widget：Container 會收縮以適應子元件'),
                          Text('• 在 Row/Column 中無子 Widget 需指定尺寸'),
                          Text('• 設定固定尺寸後，兩者行為相同'),
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