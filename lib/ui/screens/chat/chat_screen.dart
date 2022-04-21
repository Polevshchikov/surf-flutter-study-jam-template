import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/chat_screen_widget_model.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/chat_body_widget.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/profile_widget.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/search_text_field.dart';

class ChatScreen extends ElementaryWidget<IChatWidgetModel> {
  const ChatScreen({
    Key? key,
    WidgetModelFactory wmFactory = chatScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IChatWidgetModel wm) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(220, 255, 255, 255),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: ProfileWidget(nickNameController: wm.nickNameController),
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
            title: SearchTextField(
                onSearchMsg: wm.searchMsg,
                searchController: wm.searchController),
          ),
        ),
      ),
      body: ChatBodyWidget(wm: wm),
    );
  }
}
