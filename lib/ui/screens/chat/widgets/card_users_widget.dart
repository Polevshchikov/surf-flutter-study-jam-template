import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

class CardUsersWidget extends StatelessWidget {
  final ChatMessageDto chatMessage;
  
  const CardUsersWidget({
    required this.chatMessage,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 100,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: chatMessage.author is ChatUserLocalDto
              ? Colors.blue[300]
              : Colors.green[300],
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
              color: chatMessage.author is ChatUserLocalDto
                  ? Colors.blue[500]!
                  : Colors.green[500]!,
              offset: chatMessage.author is ChatUserLocalDto
                  ? const Offset(-4, -4)
                  : const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: chatMessage.author is ChatUserLocalDto
                  ? const Offset(4, 4)
                  : const Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            right: 13,
            left: 13,
            bottom: 12.0,
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Text(
                          chatMessage.author.name[0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        chatMessage.author.name,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
