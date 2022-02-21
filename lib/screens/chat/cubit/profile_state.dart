part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final FormzStatus inputStatus;
  final InputName authorName;
  final InputText message;
  final bool isShowName;

  const ProfileState({
    this.authorName = const InputName.pure(),
    this.message = const InputText.pure(),
    this.inputStatus = FormzStatus.pure,
    this.isShowName = true,
  });

  ProfileState copyWith({
    InputName? authorName,
    InputText? message,
    FormzStatus? inputStatus,
    bool? isShowName,
  }) {
    return ProfileState(
      authorName: authorName ?? this.authorName,
      message: message ?? this.message,
      inputStatus: inputStatus ?? this.inputStatus,
      isShowName: isShowName ?? this.isShowName,
    );
  }

  @override
  List<Object> get props => [
        authorName,
        message,
        isShowName,
        inputStatus,
      ];
}
