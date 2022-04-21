import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elementary/elementary.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/firebase.dart';

class ChatScreenModel extends ElementaryModel {
  List<ChatMessageDto> _messages = [];
  final ChatRepository _chatRepository;

  ChatScreenModel(ErrorHandler errorHandler, this._chatRepository)
      : super(errorHandler: errorHandler);

  List<ChatMessageDto> get messages => _messages;

  Future<void> getChat() async {
    try {
      _messages = await _chatRepository.messages;
    } on Exception catch (e) {
      handleError(e);
      rethrow;
    }
  }

  Future<void> sendMsg({
    required String message,
    required String nickname,
  }) async {
    try {
      _messages = await _chatRepository.sendMessage(nickname, message);
    } on Exception catch (e) {
      handleError(e);
      rethrow;
    }
  }

  Future<void> searchUser(String nickname) async {
    try {
      Future.delayed(const Duration(milliseconds: 400), () async {
        _messages = await _chatRepository.messages;
      });

      List<ChatMessageDto> _myListFiltered = _messages
          .where((e) =>
              e.author.name.toLowerCase().startsWith(nickname.toLowerCase()))
          .toList();
      if (_myListFiltered.isNotEmpty) {
        _messages = _myListFiltered;
      } else {
        _messages = [];
      }
    } on Exception catch (e) {
      handleError(e);
      rethrow;
    }
  }
}
