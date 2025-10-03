import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 學習專案',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter 元件練習'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      // 使用 SingleChildScrollView 讓內容可以滾動，適合不斷新增元件
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // ===== 區塊 1：計數器 =====
            _buildSectionTitle('計數器範例'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('你按惹按鈕這麼多次：'),
                    const SizedBox(height: 8),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ===== 區塊 2：文字樣式 =====
            _buildSectionTitle('文字樣式範例'),
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
            const SizedBox(height: 24),

            // ===== 區塊 3：圖片 =====
            _buildSectionTitle('圖片範例'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('網路圖片：'),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://fastly.picsum.photos/id/18/200/300.jpg?hmac=ey-vd9wCRyYWPf6nwCk_ciMCPRLrWvI7O5Z1Hfg2Cf0',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('本地圖片：'),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/test1.jpg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ===== 區塊 4：按鈕 =====
            _buildSectionTitle('按鈕範例'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print('ElevatedButton 被按了');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('ElevatedButton'),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        print('TextButton 被按了');
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text('TextButton'),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: () {
                        print('OutlinedButton 被按了');
                      },
                      child: const Text('OutlinedButton'),
                    ),
                    const SizedBox(height: 8),
                    IconButton(
                      onPressed: () {
                        print('IconButton 被按了');
                      },
                      icon: const Icon(Icons.favorite),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ===== 區塊 5：圖示 =====
            _buildSectionTitle('圖示範例'),
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
            const SizedBox(height: 24),

            // ===== 區塊 6：GestureDetector 範例 =====
            _buildSectionTitle('GestureDetector 手勢偵測範例'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // 單擊範例
                    GestureDetector(
                      onTap: () {
                        print('單擊了！');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('你單擊了藍色方塊')),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '單擊我\n(onTap)',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 長按範例
                    GestureDetector(
                      onLongPress: () {
                        print('長按了！');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('你長按了綠色方塊')),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '長按我\n(onLongPress)',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 雙擊範例
                    GestureDetector(
                      onDoubleTap: () {
                        print('雙擊了！');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('你雙擊了紅色方塊')),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '雙擊我\n(onDoubleTap)',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 滑動範例
                    GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity! > 0) {
                          print('向右滑動');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('向右滑動 →')),
                          );
                        } else {
                          print('向左滑動');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('向左滑動 ←')),
                          );
                        }
                      },
                      child: Container(
                        width: 200,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '左右滑動我\n(onHorizontalDragEnd)',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 多種手勢組合範例
                    GestureDetector(
                      onTap: () {
                        print('單擊紫色方塊');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('單擊！試試雙擊或長按')),
                        );
                      },
                      onDoubleTap: () {
                        print('雙擊紫色方塊');
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(const SnackBar(content: Text('雙擊！')));
                      },
                      onLongPress: () {
                        print('長按紫色方塊');
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(const SnackBar(content: Text('長按！')));
                      },
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity! > 0) {
                          print('向右滑動');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('向右滑動 →')),
                          );
                        } else {
                          print('向左滑動');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('向左滑動 ←')),
                          );
                        }
                      },
                      child: Container(
                        width: 200,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '多種手勢\n(單擊/雙擊/長按/滑動)',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ===== 區塊 7：Container 差異驗證 =====
            _buildSectionTitle('Container 無子/有子 Widget 差異'),
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
                    const Divider(),
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
            const SizedBox(height: 24),

            // ===== 區塊 8：ConstrainedBox 範例 =====
            _buildSectionTitle('ConstrainedBox 約束盒子範例'),
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

                    // 1. 設定最小尺寸
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

                    // 2. 設定最大尺寸
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
                          '這是一段很長的文字內容，會因為最大尺寸限制而自動換行或被裁切',
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
            const SizedBox(height: 24),

            // ===== 在這裡新增更多區塊 =====
            // 複製上面的任何區塊模板，修改內容即可

            // 範例：新增一個空白區塊
            // _buildSectionTitle('新區塊標題'),
            // Card(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Column(
            //       children: [
            //         const Text('在這裡新增你的元件'),
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 24),
            const SizedBox(height: 50), // 底部留白
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加計數',
        child: const Icon(Icons.add),
      ),
    );
  }

  // 區塊標題的共用方法
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
