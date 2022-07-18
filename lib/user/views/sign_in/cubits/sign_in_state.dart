import '/user/views/sign_in/views/widgets/buttons/forgot_password_button.dart';
import '/user/views/sign_in/views/widgets/buttons/sign_in_button.dart';
import '/user/views/sign_in/views/widgets/buttons/sign_up_button.dart';
import '/user/views/sign_in/views/widgets/text_fields/email_text_field.dart';
import '/user/views/sign_in/views/widgets/text_fields/password_text_field.dart';
import '/user/views/sign_in/views/widgets/texts/sign_in_text.dart';

class SignInState {
  final EmailTextField emailTextField;
  final PasswordTextField passwordTextField;
  final SignInText signInText;
  final SignUpButton signUpButton;
  final SignInButton signInButton;
  final ForgotPasswordButton forgotPasswordButton;
  final SignInStatus signInStatus;

  SignInState(
    this.emailTextField,
    this.passwordTextField,
    this.signInText,
    this.signUpButton,
    this.signInButton,
    this.forgotPasswordButton, [
    this.signInStatus = SignInStatus.initial,
  ]);

  SignInState.initial()
      : emailTextField = const EmailTextField(),
        passwordTextField = const PasswordTextField(),
        signInText = const SignInText(),
        signUpButton = const SignUpButton(),
        signInButton = const SignInButton(),
        forgotPasswordButton = const ForgotPasswordButton(),
        signInStatus = SignInStatus.initial;

  SignInState copyWith({
    EmailTextField? emailTextField,
    PasswordTextField? passwordTextField,
    SignInText? signInText,
    SignUpButton? signUpButton,
    SignInButton? signInButton,
    ForgotPasswordButton? forgotPasswordButton,
    SignInStatus? signInStatus,
  }) {
    return SignInState(
      emailTextField ?? this.emailTextField,
      passwordTextField ?? this.passwordTextField,
      signInText ?? this.signInText,
      signUpButton ?? this.signUpButton,
      signInButton ?? this.signInButton,
      forgotPasswordButton ?? this.forgotPasswordButton,
      signInStatus ?? this.signInStatus,
    );
  }

  bool get invalid => emailTextField.invalid || passwordTextField.invalid;
}

enum SignInStatus {
  initial,
  success,
  failure;
}
