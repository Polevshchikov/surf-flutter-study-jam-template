import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/screens/chat/cubit/profile_cubit.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final String authorName = state.authorName.value;
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
                    authorName == '' ? '' : authorName[0],
                    style: const TextStyle(color: Colors.white, fontSize: 80),
                  ),
                ),
                state.isShowName
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.multiline,
                                onChanged: (value) =>
                                    profileCubit.nameChanged(value),
                                cursorColor: Colors.deepPurple,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                                decoration: const InputDecoration(
                                  hintText: 'Введите имя',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                profileCubit.isShowNameChanged();
                              },
                              child: Icon(
                                Icons.done_outline_rounded,
                                color: authorName == ''
                                    ? Colors.grey
                                    : Colors.green,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                          onDoubleTap: () {
                            profileCubit.isShowNameChanged();
                          },
                          child: Text(
                            authorName,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 38,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
