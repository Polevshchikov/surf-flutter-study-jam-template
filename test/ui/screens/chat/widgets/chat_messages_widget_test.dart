// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/chat_messages_widget.dart';

const String _nickNameRemoveMock = 'Remove user';

const String _nickNameLocalMock = 'Local user';

const String _messageMock = 'Hello World';

final DateTime _timeMock = DateTime.utc(2022, 2, 22, 20, 18, 04);

final _chatMessageMock = <ChatMessageDto>[
  ChatMessageDto(
    author: const ChatUserDto(name: _nickNameRemoveMock),
    message: _messageMock,
    createdDateTime: _timeMock,
  ),
  ChatMessageDto(
    author: ChatUserLocalDto(name: _nickNameLocalMock),
    message: _messageMock,
    createdDateTime: _timeMock,
  ),
  ChatMessageGeolocationDto(
    author: ChatUserLocalDto(name: _nickNameLocalMock),
    message: _messageMock,
    createdDate: _timeMock,
    location: ChatGeolocationDto(longitude: 20.0, latitude: 20.0),
  ),
  ChatMessageGeolocationDto(
    author: const ChatUserDto(name: _nickNameRemoveMock),
    message: _messageMock,
    createdDate: _timeMock,
    location: ChatGeolocationDto(longitude: 10.0, latitude: 10.0),
  ),
  ChatMessageDto(
    author: const ChatUserDto(name: _nickNameRemoveMock),
    message: _messageMock,
    createdDateTime: _timeMock,
  ),
];

void main() {
  group('ChatMessageWidget golden test', () {
    testGoldens('ChatMessageWidget', (tester) async {
      final builder = GoldenBuilder.column();

      builder.addScenario(
        'Chat message',
        SizedBox(
          width: 420,
          height: 540,
          child: ChatMessageWidget(
            listViewController: ScrollController(),
            chatMessages: _chatMessageMock,
          ),
        ),
      );

      await tester.pumpWidgetBuilder(
        builder.build(),
        surfaceSize: const Size(420, 600),
      );

      await screenMatchesGolden(tester, 'message_user_widget messages users');
    });
  });
}
