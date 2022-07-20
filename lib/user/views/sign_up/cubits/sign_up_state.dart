import 'sign_up_status.dart';
import 'sign_up_widget.dart';

class SignUpState {
  final EmailTextField emailTextField;
  final PasswordTextField passwordTextField;
  final NameTextField nameTextField;
  final GenderTextField genderTextField;
  final BirthdayTextField birthdayTextField;
  final PhoneTextField phoneTextField;
  final SignInButton signInButton;
  final SignUpButton signUpButton;
  final SignUpStatus signUpStatus;

  @override
  SignUpState(
    this.emailTextField,
    this.passwordTextField,
    this.nameTextField,
    this.genderTextField,
    this.birthdayTextField,
    this.phoneTextField,
    this.signInButton,
    this.signUpButton, [
    this.signUpStatus = SignUpStatus.initial,
  ]);

  SignUpState.initial()
      : emailTextField = const EmailTextField(),
        passwordTextField = const PasswordTextField(),
        nameTextField = const NameTextField(),
        genderTextField = const GenderTextField(),
        birthdayTextField = const BirthdayTextField(),
        phoneTextField = const PhoneTextField(),
        signInButton = const SignInButton(),
        signUpButton = const SignUpButton(),
        signUpStatus = SignUpStatus.initial;

  SignUpState copyWith({
    EmailTextField? emailTextField,
    PasswordTextField? passwordTextField,
    PasswordTextField? repasswordTextField,
    NameTextField? nameTextField,
    GenderTextField? genderTextField,
    BirthdayTextField? birthdayTextField,
    PhoneTextField? phoneTextField,
    SignInButton? signInButton,
    SignUpButton? signUpButton,
    SignUpStatus? signUpStatus,
  }) {
    return SignUpState(
      emailTextField ?? this.emailTextField,
      passwordTextField ?? this.passwordTextField,
      nameTextField ?? this.nameTextField,
      genderTextField ?? this.genderTextField,
      birthdayTextField ?? this.birthdayTextField,
      phoneTextField ?? this.phoneTextField,
      signInButton ?? this.signInButton,
      signUpButton ?? this.signUpButton,
      signUpStatus ?? this.signUpStatus,
    );
  }

  bool get invalid =>
      nameTextField.invalid ||
      phoneTextField.invalid ||
      emailTextField.invalid ||
      passwordTextField.invalid;
}
