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
                    const Text(
                      '可以限制子元件的最小/最大尺寸',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
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
                    const SizedBox(height: 8),
                    const Text(
                      '↑ 即使內容很少，也會保持最小 200x100 的尺寸',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

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
                    const SizedBox(height: 8),
                    const Text(
                      '↑ 不會超過最大尺寸 180x80，文字會自動換行',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // 3. 同時設定最小和最大
                    const Text(
                      '3️⃣ 同時設定最小和最大尺寸',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // 內容少的情況
                        Expanded(
                          child: Column(
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 100,
                                  maxWidth: 150,
                                  minHeight: 60,
                                  maxHeight: 100,
                                ),
                                child: Container(
                                  color: Colors.orange.withValues(alpha: 0.3),
                                  child: const Center(child: Text('少')),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '內容少\n(取最小值)',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        // 內容多的情況
                        Expanded(
                          child: Column(
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 100,
                                  maxWidth: 150,
                                  minHeight: 60,
                                  maxHeight: 100,
                                ),
                                child: Container(
                                  color: Colors.purple.withValues(alpha: 0.3),
                                  padding: const EdgeInsets.all(8),
                                  child: const Text(
                                    '很多內容的文字會在範圍內適應',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '內容多\n(在範圍內)',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // 4. 固定寬度，彈性高度
                    const Text(
                      '4️⃣ 固定寬度，彈性高度',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 250,
                        maxWidth: 250,
                        minHeight: 0,
                        maxHeight: double.infinity,
                      ),
                      child: Container(
                        color: Colors.teal.withValues(alpha: 0.3),
                        padding: const EdgeInsets.all(12),
                        child: const Text(
                          '固定寬度 250，但高度會根據內容自動調整。'
                          '這種設定很適合用在需要固定寬度但內容長度不確定的情況。',
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '↑ 寬度固定 250，高度根據內容自適應',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // 5. 實用場景：按鈕最小寬度
                    const Text(
                      '5️⃣ 實用場景：確保按鈕最小寬度',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 120),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('確定'),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 120),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
                            child: const Text('取消'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '↑ 兩個按鈕都設定最小寬度 120，確保視覺一致性',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // 總結
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📝 總結',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('• minWidth/minHeight：設定最小尺寸'),
                          Text('• maxWidth/maxHeight：設定最大尺寸'),
                          Text('• 可同時設定範圍，內容會在範圍內自適應'),
                          Text('• 適合響應式設計和確保 UI 一致性'),
                          Text('• double.infinity 表示無限大'),
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