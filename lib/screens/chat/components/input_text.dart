import 'package:formz/formz.dart';

enum InputTextValidationError { empty }

class InputText extends FormzInput<String, InputTextValidationError> {
  const InputText.pure() : super.pure('');

  const InputText.dirty([String value = '']) : super.dirty(value);

  @override
  InputTextValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : InputTextValidationError.empty;
  }
}
