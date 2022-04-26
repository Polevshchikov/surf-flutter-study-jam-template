// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/card_users_widget.dart';

const String nickName = 'Local user';

void main() {
  group('CardUsersWidget test', () {
    testWidgets('Card user', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                CardUsersWidget(
                  chatMessage: ChatMessageDto(
                    author: ChatUserLocalDto(name: nickName),
                    message: 'Hello users',
                    createdDateTime: DateTime.utc(2022, 2, 22, 20, 18, 04),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text(nickName), findsOneWidget);

      final typeFinderSend = find.byWidgetPredicate((widget) {
        if (widget is! CircleAvatar) {
          return false;
        }
        return widget.backgroundColor == Colors.deepPurple;
      });
      expect(typeFinderSend, findsOneWidget);
      expect(find.text(nickName[0]), findsOneWidget);
    });
  });

  group('CardUsersWidget golden test', () {
    testGoldens('CardUsersWidget', (tester) async {
      final builder = GoldenBuilder.column();

      builder
        ..addScenario(
          'Local user card',
          CardUsersWidget(
            chatMessage: ChatMessageDto(
              author: ChatUserLocalDto(name: 'Local user'),
              message: 'Hello users',
              createdDateTime: DateTime.utc(2022, 2, 22, 20, 18, 04),
            ),
          ),
        )
        ..addScenario(
          'Remove user card',
          CardUsersWidget(
            chatMessage: ChatMessageDto(
              author: const ChatUserDto(name: 'Remove user'),
              message: 'Hello users',
              createdDateTime: DateTime.utc(2022, 2, 22, 20, 18, 04),
            ),
          ),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        surfaceSize: const Size(420, 300),
      );

      await screenMatchesGolden(tester, 'card_users_widget user card');
    });
  });
}
