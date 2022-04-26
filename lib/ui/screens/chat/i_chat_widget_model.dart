part of 'chat_screen_widget_model.dart';

/// Interface of [ChatScreenWidgetModel]
abstract class IChatWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<ChatMessageDto>?>> get messagesState;

  TextEditingController get nickNameController;

  TextEditingController get msgController;

  TextEditingController get searchController;

  ScrollController get listViewController;

  Future<void> loadMsg();
  Future<void> sendMsg();
  Future<void> searchMsg();
}
