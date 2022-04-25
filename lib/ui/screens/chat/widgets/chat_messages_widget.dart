import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/card_users_widget.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/message_user_widget.dart';

class ChatMessageWidget extends StatelessWidget {
  final List<ChatMessageDto> chatMessages;
  final ScrollController listViewController;
  const ChatMessageWidget({
    Key? key,
    required this.chatMessages,
    required this.listViewController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: listViewController,
        reverse: true,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        itemCount: chatMessages.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: chatMessages[index].author is ChatUserLocalDto
                ? Row(
                    children: [
                      MessageUserWidget(
                        chatMessage: chatMessages[index],
                      ),
                      const SizedBox(width: 5),
                      CardUsersWidget(chatMessage: chatMessages[index]),
                    ],
                  )
                : Row(
                    children: [
                      CardUsersWidget(chatMessage: chatMessages[index]),
                      const SizedBox(width: 5),
                      MessageUserWidget(chatMessage: chatMessages[index]),
                    ],
                  ),
          );
        });
  }
}
