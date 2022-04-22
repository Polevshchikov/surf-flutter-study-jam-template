import 'package:elementary/elementary.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

class ChatScreenModel extends ElementaryModel {
  final EntityStateNotifier<List<ChatMessageDto>?> _messagesState =
  EntityStateNotifier();
  final ChatRepository _chatRepository;

  ChatScreenModel(ErrorHandler errorHandler, this._chatRepository)
      : super(errorHandler: errorHandler);

  EntityStateNotifier<List<ChatMessageDto>?> get messages => _messagesState;

  Future<void> fetchMessages() async {
    try {
      _messagesState.loading();
      final _messages = await _chatRepository.messages;
      _messagesState.content(_messages);
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
      final _messages = await _chatRepository.sendMessage(nickname, message);
      _messagesState.content(_messages);
    } on Exception catch (e) {
      handleError(e);
      _messagesState.error(e);
      rethrow;
    }
  }

  Future<void> searchMsg(String nickname) async {
    try {
      _messagesState.loading();
      final _messages = await _chatRepository.messages;
      final _myListFiltered = _messages
          .where((e) =>
              e.author.name.toLowerCase().startsWith(nickname.toLowerCase()))
          .toList();
      if (_myListFiltered.isNotEmpty) {
        _messagesState.content(_myListFiltered);
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
