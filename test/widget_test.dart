// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app1/main.dart';
import 'package:app1/pages/counter_page.dart';

void main() {
  testWidgets('Home page displays section list', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the home page shows the app title and section list.
    expect(find.text('Flutter 元件練習'), findsOneWidget);
    expect(find.text('計數器範例'), findsOneWidget);
    expect(find.text('文字樣式範例'), findsOneWidget);
    expect(find.text('圖片範例'), findsOneWidget);
    expect(find.text('按鈕範例'), findsOneWidget);
  });

  testWidgets('Counter page navigation and functionality', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Find and tap on the counter example.
    await tester.tap(find.text('計數器範例'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the counter page by checking for unique content.
    expect(find.text('你按了按鈕這麼多次：'), findsOneWidget);
    expect(find.text('計數器範例'), findsWidgets); // Allow multiple instances (AppBar + content)

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter page direct test', (WidgetTester tester) async {
    // Test the counter page directly.
    await tester.pumpWidget(const MaterialApp(home: CounterExamplePage()));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
