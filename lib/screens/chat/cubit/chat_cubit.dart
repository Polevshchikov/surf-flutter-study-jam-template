import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/screens/chat/components/input_name.dart';
import 'package:surf_practice_chat_flutter/screens/utils/status.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;
  ChatCubit(this._chatRepository) : super(ChatState.initial());

  void searchUser(String value) async {
    final name = InputName.dirty(value);
    emit(state.copyWith(
      searchName: name,
      inputStatus: Formz.validate([name]),
    ));
    Future.delayed(const Duration(milliseconds: 400), () async {
      await getChat();
    });
  }

  void isShowNameChanged() {
    emit(state.copyWith(
      isShowSearch: !state.isShowSearch,
      searchName: const InputName.pure(),
    ));
  }

  Future<void> getChat() async {
    emit(state.copyWith(status: Status.waiting));
    try {
      final results = await _chatRepository.messages;
      if (state.searchName.value.isNotEmpty) {
        var myListFiltered = results
            .where((e) => e.author.name
                .toLowerCase()
                .startsWith(state.searchName.value.toLowerCase()))
            .toList();
        if (myListFiltered.isNotEmpty) {
          emit(state.copyWith(
              status: Status.success, chatMessage: myListFiltered));
        } else {
          emit(state.copyWith(status: Status.success, chatMessage: []));
        }
      } else {
        emit(state.copyWith(status: Status.success, chatMessage: results));
      }
    } catch (error) {
      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> sendMessage({
    required String nickname,
    required String message,
  }) async {
    emit(state.copyWith(status: Status.waiting));
    try {
      final results = await _chatRepository.sendMessage(nickname, message);
      if (state.searchName.value.isNotEmpty) {
        var myListFiltered = results
            .where((e) => e.author.name
                .toLowerCase()
                .startsWith(state.searchName.value.toLowerCase()))
            .toList();
        if (myListFiltered.isNotEmpty) {
          emit(state.copyWith(
              status: Status.success, chatMessage: myListFiltered));
        } else {
          emit(state.copyWith(status: Status.success, chatMessage: []));
        }
      } else {
        emit(state.copyWith(status: Status.success, chatMessage: results));
      }
    } catch (error) {
      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> sendGeolocation(
      {required String nickname, required String message}) async {
    emit(state.copyWith(status: Status.waiting));

    try {
      // final results = await _chatRepository.sendGeolocationMessage(
      //     nickname: nickname, location: myLocation);
      // emit(ChatState.success(results));
    } catch (error) {
      emit(state.copyWith(status: Status.error));
    }
  }
}
