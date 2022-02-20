import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/screens/utils/status.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;
  ChatCubit(this._chatRepository) : super(ChatState.initial());

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
}
