import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_app/main.dart';

void main() {
  testWidgets('Renders Mobile Web Layout when screen width < 600', (WidgetTester tester) async {
    // Set screen size to mobile: 400x800
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const FlutterWebApp());

    expect(find.text('Flutter Web Application - Edwin Paul'), findsOneWidget);
    expect(find.text('Mobile Web Layout'), findsOneWidget);
    expect(find.text('Welcome'), findsOneWidget);

    // Tap Welcome button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Welcome'));
    await tester.pump();
    expect(find.textContaining('Welcome! You clicked the button 1 time(s).'), findsOneWidget);
  });

  testWidgets('Renders Desktop Web Layout when screen width >= 600', (WidgetTester tester) async {
    // Set screen size to desktop: 1200x800
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const FlutterWebApp());

    expect(find.text('Flutter Web Application - Edwin Paul'), findsOneWidget);
    expect(find.text('Desktop Web Layout'), findsOneWidget);
    expect(find.text('Welcome'), findsOneWidget);
  });
}
