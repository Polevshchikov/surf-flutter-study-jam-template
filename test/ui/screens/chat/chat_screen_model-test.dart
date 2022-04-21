import 'package:elementary/elementary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:mocktail/mocktail.dart';
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

  test('messages getter return empty messages', () {
    expect( wm.messages,  same ( <ChatMessageDto>[]));
  });

  test('Send message', () async {
    when(() => chatRepositoryMock.sendMessage(_nickNameMock, _messageMock))
        .thenAnswer(
      (_) => Future.value(_chatMessageMock),
    );
    //
    // expectLater(wm.sendMsg(message: _nickNameMock, nickname: _messageMock),
    //     _chatMessageMock);
  });

  test('Load messages', () async {
    when(() => chatRepositoryMock.messages)
        .thenAnswer((_) => Future.value(_chatMessageMock));
    // expect(wm.getChat(), _chatMessageMock);
  });
}
  //
  // test('Send message', () async {
  //   when(() => wm.sendMsg(message: _messageMock, nickname: _nickNameMock))
  //       .thenAnswer(
  //     (_) => Future.value(_chatMessageMock),
  //   );
  //
  //   expectLater(wm.sendMsg(message: _nickNameMock, nickname: _messageMock),
  //       _chatMessageMock);
  // });
  //
  // test('Load messages', () async {
  //   when(() => wm.getChat()).thenAnswer((_) => Future.value(_chatMessageMock));
  //   expectLater(wm.getChat(), _chatMessageMock);
  // });
// }

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
