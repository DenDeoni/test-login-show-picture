import 'package:app/main.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Warnings are shown when form fields are empty', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Click on Button 'Show picture'
    await tester.tap(find.byKey(const Key(showPictureButtonKey)));
    await tester.pump();

    // Warnings are shown
    expectLater(find.text(enterValidLogin), findsOneWidget);
    expectLater(find.text(enterValidPassword), findsOneWidget);
  });

  testWidgets('CircularProgressIndicator is shown', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // filling in fields
    await tester.enterText(find.byKey(const Key(loginFieldKey)), 'mistake');
    await tester.enterText(find.byKey(const Key(passFieldKey)), 'mistake');

    // Click on Button 'Show picture'
    await tester.tap(find.byKey(const Key(showPictureButtonKey)));

    // CircularProgressIndicator is shown
    await tester.pump();
    expectLater(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
