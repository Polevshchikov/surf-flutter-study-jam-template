import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/chat_screen_widget_model.dart';

class UsersFieldWidget extends StatelessWidget {
  final IChatWidgetModel wm;
  const UsersFieldWidget({Key? key, required this.wm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            controller: wm.searchController,
            keyboardType: TextInputType.multiline,
            cursorColor: Colors.white38,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            decoration: const InputDecoration(
              hintText: 'Введите имя поиска',
              hintStyle: TextStyle(color: Colors.white38),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            wm.searchMsg();
          },
          icon: const Icon(Icons.search),
        )
      ],
    );
  }
}
