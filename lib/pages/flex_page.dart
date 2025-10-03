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
                    const SizedBox(height: 24),

                    // Expanded 比例分配
                    const Text(
                      '3️⃣ Expanded 比例分配 (flex 屬性)',
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
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.red.withValues(alpha: 0.3),
                              child: const Center(child: Text('flex: 1')),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.green.withValues(alpha: 0.3),
                              child: const Center(child: Text('flex: 2')),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.blue.withValues(alpha: 0.3),
                              child: const Center(child: Text('flex: 1')),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '↑ 比例 1:2:1，綠色區域佔兩倍空間',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // Flexible 彈性調整
                    const Text(
                      '4️⃣ Flexible - 彈性調整大小',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      'Flexible vs Expanded：關鍵在於多個彈性元件競爭空間時的行為',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),

                    // 最能展示 Flexible 特性的範例
                    const Text('MainAxisSize.min 展示 Flexible 的真正特性：'),
                    const SizedBox(height: 4),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min, // 關鍵設定
                          children: [
                            Flexible(
                              child: Container(
                                color: Colors.green.withValues(alpha: 0.3),
                                padding: const EdgeInsets.all(8),
                                child: const Text('Flexible 緊縮'),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              color: Colors.red.withValues(alpha: 0.3),
                              padding: const EdgeInsets.all(8),
                              child: const Text('固定'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '↑ 關鍵差異：Flexible 讓 Row 緊縮，Expanded 會撐開整個 Row',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // Flexible fit 屬性
                    const Text(
                      '5️⃣ Flexible fit 屬性差異',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          // FlexFit.loose (預設)
                          Expanded(
                            child: Row(
                              children: [
                                const Text('FlexFit.loose: '),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Container(
                                    color: Colors.orange.withValues(alpha: 0.3),
                                    child: const Center(child: Text('短')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          // FlexFit.tight
                          Expanded(
                            child: Row(
                              children: [
                                const Text('FlexFit.tight: '),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Container(
                                    color: Colors.teal.withValues(alpha: 0.3),
                                    child: const Center(child: Text('短')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '↑ loose: 按內容大小｜tight: 填滿可用空間 (等同 Expanded)',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // 多個 Spacer 的比例
                    const Text(
                      '6️⃣ 多個 Spacer 的比例分配',
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
                            width: 60,
                            color: Colors.red.withValues(alpha: 0.3),
                            child: const Center(child: Text('A')),
                          ),
                          const Spacer(flex: 1),
                          Container(
                            width: 60,
                            color: Colors.green.withValues(alpha: 0.3),
                            child: const Center(child: Text('B')),
                          ),
                          const Spacer(flex: 2),
                          Container(
                            width: 60,
                            color: Colors.blue.withValues(alpha: 0.3),
                            child: const Center(child: Text('C')),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '↑ A-B 間距 : B-C 間距 = 1:2',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // 實用場景：響應式按鈕列
                    const Text(
                      '7️⃣ 實用場景：響應式按鈕列',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('取消'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('確認提交'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Column 中的應用
                    const Text(
                      '8️⃣ Column 中的垂直空間分配',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            color: Colors.red.withValues(alpha: 0.3),
                            child: const Center(child: Text('頂部固定')),
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            color: Colors.green.withValues(alpha: 0.3),
                            child: const Center(child: Text('中間')),
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            color: Colors.blue.withValues(alpha: 0.3),
                            child: const Center(child: Text('底部固定')),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '↑ Spacer 在 Column 中創造垂直間距',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // 總結
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.purple.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.purple),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📝 總結',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('• Expanded：強制填滿剩餘空間，可設定 flex 比例'),
                          Text('• Spacer：專門創造空白間距，實際上是簡化版的 Expanded'),
                          Text('• Flexible：彈性調整，不強制填滿空間'),
                          Text('• FlexFit.loose：按內容大小 (預設)'),
                          Text('• FlexFit.tight：填滿空間 (等同 Expanded)'),
                          Text('• 只能在 Row/Column/Flex 中使用'),
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