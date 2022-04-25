import 'package:flutter/material.dart';

class ChatFieldWidget extends StatelessWidget {
  final VoidCallback sendMsg;
  final TextEditingController msgController;
  const ChatFieldWidget({
    Key? key,
    required this.sendMsg,
    required this.msgController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => throw UnimplementedError(),
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
            controller: msgController,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            decoration: const InputDecoration(
              hintText: 'Сообщение',
            ),
          ),
        ),
        GestureDetector(
          onTap: sendMsg,
          behavior: HitTestBehavior.opaque,
          child: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(Icons.send),
          ),
        ),
      ],
    );
  }
}
