part of 'sign_in_model.dart';

class SignInState extends AuthenticationState {
  final EmailInput emailInput;
  final PasswordInput passwordInput;
  final SignInStatus signInStatus;

  @override
  SignInState(
    this.emailInput,
    this.passwordInput, [
    this.signInStatus = SignInStatus.initial,
  ]);

  @override
  SignInState.initial()
      : emailInput = EmailInput(),
        passwordInput = PasswordInput(),
        signInStatus = SignInStatus.initial;

  @override
  SignInState copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    SignInStatus? signInStatus,
  }) {
    return SignInState(
      emailInput ?? this.emailInput,
      passwordInput ?? this.passwordInput,
      signInStatus ?? this.signInStatus,
    );
  }
  
  @override
  bool get invalid => emailInput.invalid || passwordInput.invalid;
}
