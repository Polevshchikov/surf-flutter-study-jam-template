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
    // when(() => chatWM.messagesState).thenAnswer(
    //   (_) => ListenableState<EntityState<List<ChatMessageDto>?>>(),
    // );
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

const String _nickNameMock = 'User';

const String _messageMock = 'Hello World';

final DateTime _timeMock = DateTime.utc(2022, 2, 22, 20, 18, 04);

final _chatMessageMock = <ChatMessageDto>[
  ChatMessageDto(
    author: const ChatUserDto(name: _nickNameMock),
    message: _messageMock,
    createdDateTime: _timeMock,
  ),
];
