part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List<ChatMessageDto> chatMessage;
  final Status status;
  final FormzStatus inputStatus;
  final InputName authorName;
  final InputText message;

  const ChatState._({
    this.chatMessage = const [],
    this.status = Status.unknow,
    this.authorName = const InputName.pure(),
    this.message = const InputText.pure(),
    this.inputStatus = FormzStatus.pure,
  });

  factory ChatState.initial() => const ChatState._();

  factory ChatState.loading() => const ChatState._(status: Status.waiting);

  factory ChatState.success(List<ChatMessageDto> chatMessage) => ChatState._(
        status: Status.success,
        chatMessage: chatMessage,
      );
  ChatState copyWith({
    List<ChatMessageDto>? chatMessage,
    Status? status,
    InputName? authorName,
    InputText? message,
    FormzStatus? inputStatus,
  }) {
    return ChatState._(
      chatMessage: chatMessage ?? this.chatMessage,
      status: status ?? this.status,
      authorName: authorName ?? this.authorName,
      message: message ?? this.message,
      inputStatus: inputStatus ?? this.inputStatus,
    );
  }

  factory ChatState.error() => const ChatState._(status: Status.error);

  @override
  List<Object> get props => [
        chatMessage,
        status,
        authorName,
        message,
      ];
}
