import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/chat_screen.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/chat_screen_widget_model.dart';

void main() {
  const chatScreen = ChatScreen();
  final chatWM = ChatWMMock();

  setUp(() {
    when(() => chatWM.messagesState).thenAnswer(
      (_) => EntityStateNotifier<List<ChatMessageDto>?>()
        ..content(_chatMessageMock),
    );
    when(() => chatWM.msgController).thenAnswer(
      (_) => TextEditingController(),
    );
    when(() => chatWM.nickNameController).thenAnswer(
      (_) => TextEditingController(),
    );
    when(() => chatWM.searchController).thenAnswer(
      (_) => TextEditingController(),
    );
    when(() => chatWM.listViewController).thenAnswer(
      (_) => ScrollController(),
    );
  });

  testGoldens('chat screen default golden test', (tester) async {
    await tester.pumpWidgetBuilder(chatScreen.build(chatWM));
    await multiScreenGolden(tester, 'chat_screen_data');
  });
}

class ChatWMMock extends Mock implements IChatWidgetModel {}

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
  ChatMessageDto(
    author: const ChatUserDto(name: _nickNameRemoveMock),
    message: _messageMock,
    createdDateTime: _timeMock,
  ),
];
