import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:thanon/main.dart';

void main() {
  testWidgets('Login shows validation errors on empty submit',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('دخول'));
    await tester.pump();

    expect(find.text('الرجاء إدخال البريد الإلكتروني'), findsOneWidget);
    expect(find.text('الرجاء إدخال رقم الهاتف'), findsOneWidget);
    expect(find.text('الرجاء إدخال كلمة المرور'), findsOneWidget);
  });

  testWidgets('Valid login navigates to home', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(
        find.byKey(const Key('emailField')), 'user@example.com');
    await tester.enterText(
        find.byKey(const Key('phoneField')), '+9647701234567');
    await tester.enterText(find.byKey(const Key('passwordField')), 'secret1');
    await tester.tap(find.text('دخول'));
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    expect(find.text('الرئيسية'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}
