part of 'forgot_password_model.dart';

class ForgotPasswordState {
  final EmailInput emailInput;
  final SubmitButton findButton;
  String? password;
  ForgotPasswordStatus forgotPasswordStatus;

  ForgotPasswordState(
    this.emailInput,
    this.findButton,
    this.password,
    this.forgotPasswordStatus,
  );

  ForgotPasswordState.initial()
      : emailInput = EmailInput(),
        findButton = SubmitButton(),
        forgotPasswordStatus = ForgotPasswordStatus.initial;

  ForgotPasswordState copyWith({
    EmailInput? emailInput,
    SubmitButton? findButton,
    String? password,
    ForgotPasswordStatus? forgotPasswordStatus,
  }) {
    return ForgotPasswordState(
      emailInput ?? this.emailInput,
      findButton ?? this.findButton,
      password ?? this.password,
      forgotPasswordStatus ?? this.forgotPasswordStatus,
    );
  }
}
