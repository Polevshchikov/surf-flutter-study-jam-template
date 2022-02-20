import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:surf_practice_chat_flutter/screens/chat/cubit/chat_cubit.dart';
import 'package:surf_practice_chat_flutter/screens/chat/widgets/chat_body_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatCubit _chatCubit = context.read<ChatCubit>();
    _chatCubit.getChat();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          keyboardType: TextInputType.multiline,
          onChanged: (value) => context.read<ChatCubit>().nameChanged(value),
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: const InputDecoration(
              hintText: 'Введите имя',
              hintStyle: TextStyle(color: Colors.white54)),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await _chatCubit.getChat();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: const ChatBodyWidget(),
    );
  }
}
