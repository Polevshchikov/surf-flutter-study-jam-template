import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/chat_screen_widget_model.dart';

class ChatFieldWidget extends StatelessWidget {
  final IChatWidgetModel wm;
  const ChatFieldWidget({Key? key, required this.wm}) : super(key: key);

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
            controller: wm.msgController,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            decoration: const InputDecoration(
              hintText: 'Сообщение',
            ),
          ),
        ),
        GestureDetector(
          onTap: wm.sendMsg,
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
