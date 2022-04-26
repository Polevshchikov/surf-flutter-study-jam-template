// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/search_text_field.dart';

void main() {
  group('UsersFieldWidget test', () {
    testWidgets('search field', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                SearchTextField(
                  onSearchMsg: () {},
                  searchController: TextEditingController(),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Введите имя поиска'), findsOneWidget);

      final typeFinder = find.byWidgetPredicate((widget) {
        if (widget is! Icon) {
          return false;
        }
        return widget.icon == Icons.search;
      });
      expect(typeFinder, findsOneWidget);
    });
  });

  group('SearchTextField golden test', () {
    testGoldens('UsersFieldWidget', (tester) async {
      final builder = GoldenBuilder.column();

      builder
        ..addScenario(
          'Unfocus field',
          SearchTextField(
            searchController: TextEditingController(),
            onSearchMsg: () {},
          ),
        )
        ..addScenario(
          'Unfocus with input',
          SearchTextField(
            onSearchMsg: () {},
            searchController: TextEditingController(text: 'Hello'),
          ),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        surfaceSize: const Size(420, 300),
      );

      await screenMatchesGolden(tester, 'search_text_field unfocus field');
    });
  });
}
