import 'package:elementary/elementary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/chat_screen_model.dart';

void main() {
  late ChatRepositoryMock chatRepositoryMock;

  late ErrorHandlerMock errorHandlerMock;

  late ChatScreenModel wm;

  setUp(() {
    chatRepositoryMock = ChatRepositoryMock();
    errorHandlerMock = ErrorHandlerMock();
    wm = ChatScreenModel(errorHandlerMock, chatRepositoryMock);
  });

  test('Send message', () async {
    when(() => chatRepositoryMock.sendMessage(_nickNameMock, _messageMock))
        .thenAnswer(
      (_) => Future.value(_chatMessageMock),
    );

    wm.onSendMessage(message: _messageMock, nickname: _nickNameMock);

    verify(() => chatRepositoryMock.sendMessage(_nickNameMock, _messageMock))
        .called(1);
  });

  test('Load messages', () async {
    when(() => chatRepositoryMock.messages)
        .thenAnswer((_) => Future.value(_chatMessageMock));
  });
}

class ChatRepositoryMock extends Mock implements ChatRepository {}

class ErrorHandlerMock extends Mock implements ErrorHandler {}

const String _nickNameMock = 'title';

const String _messageMock = 'Hello World';

final _chatMessageMock = <ChatMessageDto>[
  ChatMessageDto(
    author: const ChatUserDto(name: _nickNameMock),
    message: _messageMock,
    createdDateTime: DateTime.now(),
  ),
];
