import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/screens/chat/components/input_name.dart';
import 'package:surf_practice_chat_flutter/screens/chat/components/input_text.dart';
import 'package:surf_practice_chat_flutter/screens/utils/status.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;
  ChatCubit(this._chatRepository) : super(ChatState.initial());

  void messageChanged(String value) {
    final message = InputText.dirty(value);
    emit(state.copyWith(
      message: message,
      inputStatus: Formz.validate([message]),
    ));
  }

  void nameChanged(String value) {
    final name = InputName.dirty(value);
    emit(state.copyWith(
      authorName: name,
      inputStatus: Formz.validate([name]),
    ));
  }

  Future<void> getChat() async {
    emit(ChatState.loading());
    try {
      final results = await _chatRepository.messages;
      emit(ChatState.success(results));
    } catch (error) {
      emit(ChatState.error());
    }
  }

  Future<void> sendMessage(
      {required String nickname, required String message}) async {
    emit(ChatState.loading());
    try {
      final results = await _chatRepository.sendMessage(nickname, message);
      emit(ChatState.success(results));
    } catch (error) {
      emit(ChatState.error());
    }
  }

  Future<void> sendGeolocation(
      {required String nickname, required String message}) async {
    emit(ChatState.loading());

    try {
      // final results = await _chatRepository.sendGeolocationMessage(
      //     nickname: nickname, location: myLocation);
      // emit(ChatState.success(results));
    } catch (error) {
      emit(ChatState.error());
    }
  }
}
