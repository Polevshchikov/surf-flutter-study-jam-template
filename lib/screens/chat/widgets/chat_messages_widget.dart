import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

class ChatMessageWidget extends StatelessWidget {
  final List<ChatMessageDto> chatMessages;
  const ChatMessageWidget({Key? key, required this.chatMessages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        itemCount: chatMessages.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: chatMessages[index].author is ChatUserLocalDto
                      ? Colors.blueAccent[100]
                      : const Color.fromARGB(20, 0, 0, 0),
                ),
                child: chatMessages[index] is ChatMessageGeolocationDto
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              child: Text(
                                chatMessages[index].author.name[0],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chatMessages[index].author.name,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Text('Поделился геолокацией'),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text(
                                      'Открыть в картах',
                                      style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          child: Text(
                            chatMessages[index].author.name[0],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                          ),
                        ),
                        title: Text(chatMessages[index].author.name),
                        subtitle: Text(chatMessages[index].message),
                      ),
              ),
              const SizedBox(height: 4),
            ],
          );
        });
  }
}
