import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:surf_practice_chat_flutter/screens/chat/cubit/chat_cubit.dart';
import 'package:surf_practice_chat_flutter/screens/utils/status.dart';

/// Chat screen templete. This is your starting point.
class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatCubit _chatCubit;
  final _messageController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _chatCubit = context.read<ChatCubit>();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _chatCubit.getChat();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          keyboardType: TextInputType.multiline,
          controller: _nameController,
          cursorColor: Colors.white,
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
      body: BlocBuilder<ChatCubit, ChatState>(
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
            final _users = state.chatMessage;
            return Column(
              children: [
                Expanded(
                  flex: 6,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      itemCount: _users.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            child: Text(
                              _users[index].author.name[0],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24),
                            ),
                          ),
                          title: Text(_users[index].author.name),
                          subtitle: Text(_users[index].message),
                        );
                      }),
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
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            controller: _messageController,
                            decoration: const InputDecoration(
                              hintText: 'Сообщение',
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_messageController.text.isNotEmpty) {
                              await _chatCubit.sendMessage(
                                nickname: _nameController.text,
                                message: _messageController.text,
                              );
                              _messageController.clear();
                            }
                          },
                          behavior: HitTestBehavior.opaque,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.send),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: Text('ПУСТОЙ СПИСОК!!'));
        },
      ),
    );
  }
}
