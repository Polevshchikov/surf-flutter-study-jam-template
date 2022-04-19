import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/chat_screen_widget_model.dart';

class ProfileWidget extends StatelessWidget {
  final IChatWidgetModel wm;
  const ProfileWidget({Key? key, required this.wm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.3,
              backgroundColor: Colors.deepPurple,
              child: Text(
                wm.nickNameController.text.isEmpty ? 'Нет имени' : wm.nickNameController.text[0],
                style: TextStyle(color: Colors.white, fontSize: wm.nickNameController.text.isEmpty ? 30 : 80),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: wm.nickNameController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.multiline,
                      cursorColor: Colors.deepPurple,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: wm.nickNameController.text.isEmpty ? 'Введите ваше имя' : wm.nickNameController.text,
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
