import 'package:formz/formz.dart';

enum InputNameValidationError { empty }

class InputName extends FormzInput<String, InputNameValidationError> {
  const InputName.pure() : super.pure('');

  const InputName.dirty([String value = '']) : super.dirty(value);

  @override
  InputNameValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : InputNameValidationError.empty;
  }
}
