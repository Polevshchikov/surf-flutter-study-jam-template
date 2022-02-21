import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/screens/chat/cubit/chat_cubit.dart';

class UsersFieldWidget extends StatelessWidget {
  const UsersFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatCubit _chatCubit = context.read<ChatCubit>();
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            state.isShowSearch
                ? Expanded(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      cursorColor: Colors.white38,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      decoration: const InputDecoration(
                        hintText: 'Введите имя',
                        hintStyle: TextStyle(color: Colors.white38),
                      ),
                      onChanged: (value) => _chatCubit.searchUser(value),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 6),
                    child: const Text(
                      'My chat',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
            IconButton(
              onPressed: () {
                _chatCubit.isShowNameChanged();
              },
              icon: const Icon(Icons.search),
            )
          ],
        );
      },
    );
  }
}
