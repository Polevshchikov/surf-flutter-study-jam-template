import 'package:elementary/elementary.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

class ChatScreenModel extends ElementaryModel {

  final _messagesState = EntityStateNotifier<List<ChatMessageDto>?>();
  final ChatRepository _chatRepository;

  EntityStateNotifier<List<ChatMessageDto>?> get messages => _messagesState;

  ChatScreenModel(ErrorHandler errorHandler, this._chatRepository)
      : super(errorHandler: errorHandler);

  Future<void> fetchMessages() async {
    try {
      _messagesState.loading();
      final messages = await _chatRepository.messages;
      _messagesState.content(messages);
    } on Exception catch (e) {
      handleError(e);
      _messagesState.error(e);
      rethrow;
    }
  }

  Future<void> onSendMessage({
    required String message,
    required String nickname,
  }) async {
    try {
      _messagesState.loading();
      
      final messages = await _chatRepository.sendMessage(nickname, message);
      _messagesState.content(messages);
    } on Exception catch (e) {
      handleError(e);
      _messagesState.error(e);
      rethrow;
    }
  }

  Future<void> searchMsg(String nickname) async {
    try {
      _messagesState.loading();

      final messages = await _chatRepository.messages;
      final myListFiltered = messages
          .where((e) =>
              e.author.name.toLowerCase().startsWith(nickname.toLowerCase()))
          .toList();
      if (myListFiltered.isNotEmpty) {
        _messagesState.content(myListFiltered);

      } else {
        _messagesState.content([]);
      }
    } on Exception catch (e) {
      handleError(e);
      _messagesState.error(e);
      rethrow;
    }
  }
}
