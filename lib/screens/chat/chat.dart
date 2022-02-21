import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:surf_practice_chat_flutter/screens/chat/cubit/chat_cubit.dart';
import 'package:surf_practice_chat_flutter/screens/chat/widgets/chat_body_widget.dart';
import 'package:surf_practice_chat_flutter/screens/chat/widgets/profile_widget.dart';
import 'package:surf_practice_chat_flutter/screens/chat/widgets/users_field_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatCubit _chatCubit = context.read<ChatCubit>();
    _chatCubit.getChat();
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Color.fromARGB(220, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: ProfileWidget(),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: DecoratedBox(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.0, 0.3, 0.8, 1.0],
                colors: [
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 160, 21, 40),
                  Color.fromARGB(255, 196, 58, 209),
                  Color.fromARGB(255, 112, 48, 231),
                ],
              )),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: const UsersFieldWidget(),
          ),
        ),
      ),
      body: const ChatBodyWidget(),
    );
  }
}
