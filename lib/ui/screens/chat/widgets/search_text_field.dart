import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/chat_screen_widget_model.dart';

class SearchTextField extends StatelessWidget {
  final VoidCallback onSearchMsg;
  final TextEditingController searchController;
  const SearchTextField(
      {Key? key, required this.onSearchMsg, required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
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
          onPressed: onSearchMsg,
          icon: const Icon(Icons.search),
        )
      ],
    );
  }
}
