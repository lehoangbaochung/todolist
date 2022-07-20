import 'sign_in_status.dart';
import 'sign_in_widget.dart';

class SignInState {
  final EmailTextField emailTextField;
  final PasswordTextField passwordTextField;
  final SignUpButton signUpButton;
  final SignInButton signInButton;
  final ForgotPasswordButton forgotPasswordButton;
  final SignInStatus signInStatus;

  SignInState(
    this.emailTextField,
    this.passwordTextField,
    this.signUpButton,
    this.signInButton,
    this.forgotPasswordButton, [
    this.signInStatus = SignInStatus.initial,
  ]);

  SignInState.initial()
      : emailTextField = const EmailTextField(),
        passwordTextField = const PasswordTextField(),
        signUpButton = const SignUpButton(),
        signInButton = const SignInButton(),
        forgotPasswordButton = const ForgotPasswordButton(),
        signInStatus = SignInStatus.initial;

  SignInState copyWith({
    EmailTextField? emailTextField,
    PasswordTextField? passwordTextField,
    SignUpButton? signUpButton,
    SignInButton? signInButton,
    ForgotPasswordButton? forgotPasswordButton,
    SignInStatus? signInStatus,
  }) {
    return SignInState(
      emailTextField ?? this.emailTextField,
      passwordTextField ?? this.passwordTextField,
      signUpButton ?? this.signUpButton,
      signInButton ?? this.signInButton,
      forgotPasswordButton ?? this.forgotPasswordButton,
      signInStatus ?? this.signInStatus,
    );
  }

  bool get invalid => emailTextField.invalid || passwordTextField.invalid;
}
