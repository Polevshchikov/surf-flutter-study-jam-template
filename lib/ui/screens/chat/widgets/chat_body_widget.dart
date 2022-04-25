import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/chat_field_widget.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/chat_messages_widget.dart';

class ChatBodyWidget extends StatelessWidget {
  final ListenableState<EntityState<List<ChatMessageDto>?>> messagesState;
  final VoidCallback sendMsg;
  final VoidCallback loadMsg;
  final TextEditingController msgController;
  final ScrollController listViewController;

  const ChatBodyWidget({
    Key? key,
    required this.messagesState,
    required this.sendMsg,
    required this.loadMsg,
    required this.msgController,
    required this.listViewController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 100,
      onRefresh: () async => loadMsg,
      child: EntityStateNotifierBuilder<List<ChatMessageDto>?>(
          listenableEntityState: messagesState,
          loadingBuilder: (_, __) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          builder: (_, List<ChatMessageDto>? data) {
            final _chatMessages = data?.reversed.toList() ?? <ChatMessageDto>[];
            return Column(
              children: [
                Expanded(
                  flex: 6,
                  child: ChatMessageWidget(
                    chatMessages: _chatMessages,
                    listViewController: listViewController,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ChatFieldWidget(
                      msgController: msgController,
                      sendMsg: sendMsg,
                    ),
                  ),
                ),
              ],
            );
          },
          errorBuilder: (_, __, ___) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text('Произошла ошибка, обновите чат'),
                ),
                ElevatedButton(
                  onPressed: loadMsg,
                  child: const Text('Обновить чат'),
                ),
              ],
            );
          }),
    );
  }
}
