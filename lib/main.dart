import 'package:flutter/material.dart';
import 'pages/counter_page.dart';
import 'pages/text_style_page.dart';
import 'pages/image_page.dart';
import 'pages/button_page.dart';
import 'pages/icon_page.dart';
import 'pages/gesture_page.dart';
import 'pages/container_page.dart';
import 'pages/constrained_box_page.dart';
import 'pages/flex_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 學習專案 test1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// 主頁：展示所有區塊的列表
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static List<Map<String, dynamic>> get _sections => [
    {
      'title': '計數器範例',
      'description': '基本的狀態管理和計數器功能',
      'icon': Icons.add_circle,
      'color': Colors.blue,
      'page': () => const CounterExamplePage(),
    },
    {
      'title': '文字樣式範例',
      'description': '各種文字樣式和 Text 元件用法',
      'icon': Icons.text_fields,
      'color': Colors.green,
      'page': () => const TextStyleExamplePage(),
    },
    {
      'title': '圖片範例',
      'description': '本地圖片和網路圖片的顯示',
      'icon': Icons.image,
      'color': Colors.orange,
      'page': () => const ImageExamplePage(),
    },
    {
      'title': '按鈕範例',
      'description': '各種按鈕類型和交互方式',
      'icon': Icons.smart_button,
      'color': Colors.purple,
      'page': () => const ButtonExamplePage(),
    },
    {
      'title': '圖示範例',
      'description': 'Flutter 內建圖示的使用',
      'icon': Icons.star,
      'color': Colors.amber,
      'page': () => const IconExamplePage(),
    },
    {
      'title': 'GestureDetector 手勢偵測',
      'description': '單擊、雙擊、長按、滑動等手勢',
      'icon': Icons.touch_app,
      'color': Colors.red,
      'page': () => const GestureExamplePage(),
    },
    {
      'title': 'Container 差異驗證',
      'description': 'Container 有無子元件的差異',
      'icon': Icons.crop_square,
      'color': Colors.teal,
      'page': () => const ContainerExamplePage(),
    },
    {
      'title': 'ConstrainedBox 約束盒子',
      'description': '設定尺寸約束的盒子元件',
      'icon': Icons.crop_din,
      'color': Colors.indigo,
      'page': () => const ConstrainedBoxExamplePage(),
    },
    {
      'title': 'Expanded、Spacer、Flexible',
      'description': '彈性元件和空間分配',
      'icon': Icons.view_column,
      'color': Colors.pink,
      'page': () => const FlexExamplePage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 元件練習'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _sections.length,
        itemBuilder: (context, index) {
          final section = _sections[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: section['color'],
                child: Icon(section['icon'], color: Colors.white),
              ),
              title: Text(
                section['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                section['description'],
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => section['page']()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
