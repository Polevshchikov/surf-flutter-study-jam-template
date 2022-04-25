import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/utils/side_arrow_left.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/utils/side_arrow_right.dart';

class MessageUserWidget extends StatelessWidget {
  final ChatMessageDto chatMessage;
  const MessageUserWidget({Key? key, required this.chatMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return chatMessage.author is ChatUserLocalDto
        ? Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                          right: 20,
                          bottom: 10,
                        ),
                        child: chatMessage is ChatMessageGeolocationDto
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                              )
                            : Text(chatMessage.message),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('yyyy-MM-dd')
                            .format(chatMessage.createdDateTime),
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 10,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        DateFormat('kk:mm').format(chatMessage.createdDateTime),
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 10,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          left: 20.0,
                          top: 10,
                          right: 20,
                          bottom: 10,
                        ),
                        child: chatMessage is ChatMessageGeolocationDto
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Поделился геолокацией'),
                                  GestureDetector(
                                    onTap: () => throw UnimplementedError(),
                                    child: const Text(
                                      'Открыть в картах',
                                      style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              )
                            : Text(chatMessage.message),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('yyyy-MM-dd')
                            .format(chatMessage.createdDateTime),
                        style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 10,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        DateFormat('kk:mm').format(chatMessage.createdDateTime),
                        style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 10,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
