part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List<ChatMessageDto> chatMessage;
  final Status status;

  const ChatState._({
    this.chatMessage = const [],
    this.status = Status.unknow,
  });

  factory ChatState.initial() => const ChatState._();

  factory ChatState.loading() => const ChatState._(status: Status.waiting);

  factory ChatState.success(List<ChatMessageDto> chatMessage) => ChatState._(
        status: Status.success,
        chatMessage: chatMessage,
      );

  factory ChatState.error() => const ChatState._(status: Status.error);

  @override
  List<Object> get props => [
        chatMessage,
        status,
      ];
}
