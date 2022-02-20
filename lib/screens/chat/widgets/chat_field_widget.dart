import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/screens/chat/cubit/chat_cubit.dart';
import 'package:surf_practice_chat_flutter/screens/utils/status.dart';

class ChatFieldWidget extends StatelessWidget {
  const ChatFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatCubit _chatCubit = context.read<ChatCubit>();
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
              onTap: () async {
                if (state.authorName.valid) {
                  await _chatCubit.sendGeolocation(
                    nickname: state.authorName.value,
                    message: state.message.value,
                  );
                }
              },
              behavior: HitTestBehavior.opaque,
              child: const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.share_location_outlined,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Сообщение',
                ),
                onChanged: (value) =>
                    context.read<ChatCubit>().messageChanged(value),
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (state.message.valid && state.authorName.valid) {
                  await _chatCubit.sendMessage(
                    nickname: state.authorName.value,
                    message: state.message.value,
                  );
                }
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: (state.status == Status.waiting)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Icon(Icons.send),
              ),
            ),
          ],
        );
      },
    );
  }
}
