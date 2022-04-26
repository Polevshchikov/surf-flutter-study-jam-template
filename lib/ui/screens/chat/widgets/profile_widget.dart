import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final TextEditingController nickNameController;
  const ProfileWidget({Key? key, required this.nickNameController})
      : super(key: key);

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
                nickNameController.text.isEmpty
                    ? 'Нет имени'
                    : nickNameController.text[0],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: nickNameController.text.isEmpty ? 30 : 80),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: nickNameController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.multiline,
                      cursorColor: Colors.deepPurple,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: nickNameController.text.isEmpty
                            ? 'Введите ваше имя'
                            : nickNameController.text,
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
