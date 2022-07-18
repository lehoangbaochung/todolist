part of 'change_password_model.dart';

class ChangePasswordState extends AuthenticationState {
  final PasswordInput oldPasswordInput;
  final PasswordInput newPasswordInput;
  final PasswordInput renewPasswordInput;
  ChangePasswordStatus changePasswordStatus;

  ChangePasswordState(
    this.oldPasswordInput,
    this.newPasswordInput,
    this.renewPasswordInput, [
    this.changePasswordStatus = ChangePasswordStatus.initial,
  ]);

  @override
  ChangePasswordState.initial()
      : oldPasswordInput = PasswordInput(),
        newPasswordInput = PasswordInput(),
        renewPasswordInput = PasswordInput(),
        changePasswordStatus = ChangePasswordStatus.initial;

  @override
  ChangePasswordState copyWith({
    PasswordInput? oldPasswordInput,
    PasswordInput? newPasswordInput,
    PasswordInput? renewPasswordInput,
    SubmitButton? saveButton,
    ChangePasswordStatus? changePasswordStatus,
  }) {
    return ChangePasswordState(
      oldPasswordInput ?? this.oldPasswordInput,
      newPasswordInput ?? this.newPasswordInput,
      renewPasswordInput ?? this.renewPasswordInput,
      changePasswordStatus ?? this.changePasswordStatus,
    );
  }

  @override
  bool get invalid =>
      oldPasswordInput.invalid ||
      newPasswordInput.invalid ||
      renewPasswordInput.invalid ||
      (newPasswordInput.text != renewPasswordInput.text);
}
