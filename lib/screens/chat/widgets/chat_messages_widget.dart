import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/screens/chat/utils/side_arrow_left.dart';
import 'package:surf_practice_chat_flutter/screens/chat/utils/side_arrow_right.dart';
import 'package:surf_practice_chat_flutter/screens/chat/widgets/card_users_widget.dart';

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
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: chatMessages[index].author is ChatUserLocalDto
                ? Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: ClipPath(
                                clipper: SideArrowRightClipper(),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue[200],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      top: 10,
                                      right: 40,
                                      bottom: 10,
                                    ),
                                    child: chatMessages[index]
                                            is ChatMessageGeolocationDto
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                  'Поделился геолокацией'),
                                              GestureDetector(
                                                onTap: () {},
                                                child: const Text(
                                                  'Открыть в картах',
                                                  style: TextStyle(
                                                      color: Colors.deepPurple,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Text(chatMessages[index].message),
                                  ),
                                ),
                              ),
                            ),
                            Text(DateFormat('yyyy-MM-dd – kk:mm')
                                .format(chatMessages[index].createdDateTime)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      CardUsersWidget(chatMessage: chatMessages[index]),
                    ],
                  )
                : Row(
                    children: [
                      CardUsersWidget(chatMessage: chatMessages[index]),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ClipPath(
                                clipper: SideArrowLeftClipper(),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green[200],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 40.0,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: chatMessages[index]
                                            is ChatMessageGeolocationDto
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                  'Поделился геолокацией'),
                                              GestureDetector(
                                                onTap: () {},
                                                child: const Text(
                                                  'Открыть в картах',
                                                  style: TextStyle(
                                                      color: Colors.deepPurple,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Text(chatMessages[index].message),
                                  ),
                                ),
                              ),
                            ),
                            Text(DateFormat('yyyy-MM-dd – kk:mm')
                                .format(chatMessages[index].createdDateTime)),
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        });
  }
}
