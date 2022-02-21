part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List<ChatMessageDto> chatMessage;
  final Status status;
  final FormzStatus inputStatus;
  final InputName searchName;
  final bool isShowSearch;

  const ChatState._({
    this.chatMessage = const [],
    this.status = Status.unknow,
    this.searchName = const InputName.pure(),
    this.inputStatus = FormzStatus.pure,
    this.isShowSearch = false,
  });

  factory ChatState.initial() => const ChatState._();

  factory ChatState.loading() => const ChatState._(status: Status.waiting);

  ChatState copyWith({
    InputName? searchName,
    FormzStatus? inputStatus,
    bool? isShowSearch,
    List<ChatMessageDto>? chatMessage,
    Status? status,
  }) {
    return ChatState._(
      searchName: searchName ?? this.searchName,
      inputStatus: inputStatus ?? this.inputStatus,
      isShowSearch: isShowSearch ?? this.isShowSearch,
      chatMessage: chatMessage ?? this.chatMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        chatMessage,
        status,
        searchName,
        inputStatus,
        isShowSearch,
      ];
}
