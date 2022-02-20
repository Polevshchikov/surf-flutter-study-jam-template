import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/screens/chat/cubit/chat_cubit.dart';

class ChatFieldWidget extends StatefulWidget {
  final String name;
  const ChatFieldWidget({Key? key, required this.name}) : super(key: key);

  @override
  State<ChatFieldWidget> createState() => _ChatFieldWidgetState();
}

class _ChatFieldWidgetState extends State<ChatFieldWidget> {
  late ChatCubit _chatCubit;
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _chatCubit = context.read<ChatCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Container(
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
                        nickname: widget.name,
                        message: _messageController.text);
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
        );
      },
    );
  }
}
