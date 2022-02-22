import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/screens/chat/cubit/profile_cubit.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileCubit profileCubit;
  late TextEditingController _nameController;

  @override
  void initState() {
    profileCubit = context.read<ProfileCubit>();
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                                controller: _nameController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.multiline,
                                cursorColor: Colors.deepPurple,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                                decoration: InputDecoration(
                                  hintText: state.authorName.value.isEmpty
                                      ? 'Введите имя'
                                      : state.authorName.value,
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_nameController.text.isNotEmpty) {
                                  profileCubit
                                      .isShowNameChanged(_nameController.text);
                                } else if (state.authorName.value.isNotEmpty) {
                                  profileCubit.isShowNameChanged(
                                      state.authorName.value);
                                }
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
                            profileCubit
                                .isShowNameChanged(state.authorName.value);
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
