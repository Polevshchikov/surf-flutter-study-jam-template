import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:surf_practice_chat_flutter/screens/chat/components/input_name.dart';
import 'package:surf_practice_chat_flutter/screens/chat/components/input_text.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  void messageChanged(String value) {
    final message = InputText.dirty(value);
    emit(state.copyWith(
      message: message,
      inputStatus: Formz.validate([message]),
    ));
  }

  void isShowNameChanged(String value) {
    final name = InputName.dirty(value);
    emit(state.copyWith(
        authorName: name,
        inputStatus: Formz.validate([name]),
        isShowName: !state.isShowName));
  }
}
