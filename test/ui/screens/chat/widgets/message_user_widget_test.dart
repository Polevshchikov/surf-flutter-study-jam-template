import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/message_user_widget.dart';

void main() {
  group('MessageUserWidget golden test', () {
    testGoldens('MessageUserWidget', (tester) async {
      final builder = GoldenBuilder.column();

      builder
        ..addScenario(
          'Message remove user',
          Row(
            children: [
              MessageUserWidget(
                chatMessage: ChatMessageDto(
                  author: const ChatUserDto(name: _nickNameMock),
                  message: _messageMock,
                  createdDateTime: _timeMock,
                ),
              ),
            ],
          ),
        )
        ..addScenario(
          'Message local user',
          Row(
            children: [
              MessageUserWidget(
                chatMessage: ChatMessageDto(
                  author: ChatUserLocalDto(name: _nickNameMock),
                  message: _messageMock,
                  createdDateTime: _timeMock,
                ),
              ),
            ],
          ),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        surfaceSize: const Size(420, 600),
      );

      await screenMatchesGolden(tester, 'message_user_widget message user');
    });
  });
}

const String _nickNameMock = 'User';

const String _messageMock = 'Hello World';

final DateTime _timeMock = DateTime.utc(2022, 2, 22, 20, 18, 04);
