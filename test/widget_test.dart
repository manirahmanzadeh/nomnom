import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nomnom/src/app.dart';

void main() {
  testWidgets('App should run and navigate to FoodListPage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(NomNomApp());

    // Verify that the initial route is FoodListPage.
    expect(find.byKey(Key('foodListPage')), findsOneWidget);
  });
}
