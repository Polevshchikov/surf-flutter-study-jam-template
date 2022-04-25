// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/chat_field_widget.dart';

void main() {
  group('ChatFieldWidget test', () {
    testWidgets('Chat message field', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                ChatFieldWidget(
                  sendMsg: () {},
                  msgController: TextEditingController(),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Сообщение'), findsOneWidget);

      final typeFinderSend = find.byWidgetPredicate((widget) {
        if (widget is! Icon) {
          return false;
        }
        return widget.icon == Icons.send;
      });
      expect(typeFinderSend, findsOneWidget);

      final typeFinderLocation = find.byWidgetPredicate((widget) {
        if (widget is! Icon) {
          return false;
        }
        return widget.icon == Icons.share_location_outlined;
      });
      expect(typeFinderLocation, findsOneWidget);
    });
  });

  group('ChatFieldWidget golden test', () {
    testGoldens('ChatFieldWidget', (tester) async {
      final builder = GoldenBuilder.column();

      builder
        ..addScenario(
          'Unfocus field',
          ChatFieldWidget(
            msgController: TextEditingController(),
            sendMsg: () {},
          ),
        )
        ..addScenario(
          'Unfocus with input',
          ChatFieldWidget(
            sendMsg: () {},
            msgController: TextEditingController(text: 'Hello my friends'),
          ),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        surfaceSize: const Size(420, 300),
      );

      await screenMatchesGolden(tester, 'chat_text_field unfocus field');
    });
  });
}
