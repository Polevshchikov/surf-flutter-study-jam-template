import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/chat_screen.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/chat_screen_model.dart';

part 'i_chat_widget_model.dart';

/// Factory for [ChatScreenWidgetModel]
ChatScreenWidgetModel chatScreenWidgetModelFactory(BuildContext context) {
  final model = context.read<ChatScreenModel>();
  return ChatScreenWidgetModel(model);
}

/// Widget Model for [ChatScreen]
class ChatScreenWidgetModel extends WidgetModel<ChatScreen, ChatScreenModel> implements IChatWidgetModel {
  late EntityStateNotifier<List<ChatMessageDto>> _messagesController;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _msgController = TextEditingController();
  final ScrollController _listViewController = ScrollController();
  ChatScreenWidgetModel(ChatScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _messagesController = EntityStateNotifier();
    loadMsg();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _listViewController.dispose();
    _msgController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  TextEditingController get nickNameController => _nameController;

  @override
  TextEditingController get msgController => _msgController;

  @override
  TextEditingController get searchController => _searchController;

  @override
  ScrollController get listViewController => _listViewController;

  @override
  ListenableState<EntityState<List<ChatMessageDto>>> get messagesState => _messagesController;

  @override
  Future<void> loadMsg() async {
    try {
      _messagesController.loading();
      await model.getChat();

      _messagesController.content(model.messages);
    } on FirebaseException catch (_) {
      _messagesController.error(Exception('Cannot load messages'));
    }
  }

  @override
  Future<void> sendMsg() async {
    try {
      await model.sendMsg(message: _msgController.text, nickname: _nameController.text);
      _msgController.clear();
      _messagesController.content(model.messages);
    } on FirebaseException catch (_) {
      _messagesController.error(Exception('Cannot send message'));
    }
  }

  @override
  Future<void> updateMsg() async {
    try {
      _messagesController.loading();
      await model.getChat();
      _messagesController.content(model.messages);
    } on FirebaseException catch (_) {
      _messagesController.error(Exception('Cannot update messages'));
    }
  }

  @override
  Future<void> searchMsg() async {
    try {
      _messagesController.loading();
      await model.searchUser(_searchController.text);
      _messagesController.content(model.messages);
    } on FirebaseException catch (_) {
      _messagesController.error(Exception('Cannot load messages'));
    }
  }
}
