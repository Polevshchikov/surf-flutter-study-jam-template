import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/screens/chat/cubit/chat_cubit.dart';
import 'package:surf_practice_chat_flutter/screens/chat/widgets/chat_field_widget.dart';
import 'package:surf_practice_chat_flutter/screens/chat/widgets/chat_messages_widget.dart';
import 'package:surf_practice_chat_flutter/screens/utils/status.dart';

class ChatBodyWidget extends StatelessWidget {
  const ChatBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state.status == Status.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == Status.error) {
          return const Center(
            child: Text('Произошла ошибка :('),
          );
        }

        if (state.status == Status.success) {
          final _chatMessages = state.chatMessage.reversed.toList();
          return Column(
            children: [
              Expanded(
                flex: 6,
                child: ChatMessageWidget(chatMessages: _chatMessages),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
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
                  child: const ChatFieldWidget(),
                ),
              ),
            ],
          );
        }
        return const Center(child: Text('ПУСТОЙ СПИСОК!!'));
      },
    );
  }
}
