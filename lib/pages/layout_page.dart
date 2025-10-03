import 'package:flutter/material.dart';

class LayoutExamplePage extends StatelessWidget {
  const LayoutExamplePage({super.key});

  // Mock data for GridView
  final List<Map<String, dynamic>> gridItems = const [
    {'name': 'Apple', 'icon': Icons.apple},
    {'name': 'Android', 'icon': Icons.android},
    {'name': 'Cloud', 'icon': Icons.cloud},
    {'name': 'Camera', 'icon': Icons.camera_alt},
    {'name': 'Music', 'icon': Icons.music_note},
    {'name': 'Star', 'icon': Icons.star},
    {'name': 'Heart', 'icon': Icons.favorite},
    {'name': 'Home', 'icon': Icons.home},
    {'name': 'Settings', 'icon': Icons.settings},
    {'name': 'Person', 'icon': Icons.person},
    {'name': 'Email', 'icon': Icons.email},
    {'name': 'Phone', 'icon': Icons.phone},
  ];

  // Mock data for ListView
  final List<Map<String, String>> listItems = const [
    {'name': 'John Doe', 'email': 'john@example.com', 'role': 'Developer'},
    {'name': 'Jane Smith', 'email': 'jane@example.com', 'role': 'Designer'},
    {'name': 'Bob Johnson', 'email': 'bob@example.com', 'role': 'Manager'},
    {'name': 'Alice Williams', 'email': 'alice@example.com', 'role': 'Tester'},
    {'name': 'Charlie Brown', 'email': 'charlie@example.com', 'role': 'DevOps'},
    {'name': 'Eva Davis', 'email': 'eva@example.com', 'role': 'Product Owner'},
    {'name': 'Frank Miller', 'email': 'frank@example.com', 'role': 'Developer'},
    {'name': 'Grace Lee', 'email': 'grace@example.com', 'role': 'Designer'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 16,
          left: 32,
          right: 32,
          bottom: 32,
        ),
        children: [
          _buildSectionTitle('Row Example'),
          _buildRowExample(),
          const SizedBox(height: 24),

          _buildSectionTitle('Column Example'),
          _buildColumnExample(),
          const SizedBox(height: 24),

          _buildSectionTitle('Stack Example'),
          _buildStackExample(),
          const SizedBox(height: 24),

          _buildSectionTitle('GridView Example'),
          _buildGridViewExample(context),
          const SizedBox(height: 24),

          _buildSectionTitle('ListView Example'),
          _buildListViewExample(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Row Example: 水平排列元素
  Widget _buildRowExample() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 60,
            height: 60,
            color: Colors.red,
            child: const Center(child: Text('1')),
          ),
          Container(
            width: 60,
            height: 60,
            color: Colors.green,
            child: const Center(child: Text('2')),
          ),
          Container(
            width: 60,
            height: 60,
            color: Colors.blue,
            child: const Center(child: Text('3')),
          ),
        ],
      ),
    );
  }

  // Column Example: 垂直排列元素
  Widget _buildColumnExample() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 40,
            color: Colors.purple,
            child: const Center(child: Text('Item 1')),
          ),
          const SizedBox(height: 8),
          Container(
            width: 150,
            height: 40,
            color: Colors.orange,
            child: const Center(child: Text('Item 2')),
          ),
          const SizedBox(height: 8),
          Container(
            width: 120,
            height: 40,
            color: Colors.teal,
            child: const Center(child: Text('Item 3')),
          ),
        ],
      ),
    );
  }

  // Stack Example: 堆疊元素
  Widget _buildStackExample() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(color: Colors.amber),
          Positioned(
            bottom: -20,
            left: 20,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(child: Text('Front')),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.red.withValues(alpha: 0.8),
              child: const Center(child: Text('Top')),
            ),
          ),
        ],
      ),
    );
  }

  // GridView Example: 網格佈局
  Widget _buildGridViewExample(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getCrossAxisCount(context),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          final item = gridItems[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item['icon'] as IconData, color: Colors.white, size: 30),
                const SizedBox(height: 4),
                Text(
                  item['name'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    return MediaQuery.of(context).size.width ~/ 150;
  }

  // ListView Example: 列表佈局
  Widget _buildListViewExample() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          final item = listItems[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  Colors.primaries[index % Colors.primaries.length],
              child: Text(item['name']![0]),
            ),
            title: Text(item['name']!),
            subtitle: Text(item['email']!),
            trailing: Chip(
              label: Text(item['role']!, style: const TextStyle(fontSize: 11)),
              padding: const EdgeInsets.symmetric(horizontal: 4),
            ),
            onTap: () {
              // Handle tap
            },
          );
        },
      ),
    );
  }
}
