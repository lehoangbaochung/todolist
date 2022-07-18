part of 'sign_up_model.dart';

class SignUpState extends AuthenticationState {
  final EmailInput emailInput;
  final PasswordInput passwordInput;
  final PasswordInput repasswordInput;
  final NameInput nameInput;
  final GenderInput genderInput;
  final BirthdayInput birthdayInput;
  final PhoneNumberInput phoneNumberInput;
  final SignUpStatus signUpStatus;

  @override
  SignUpState(
    this.emailInput,
    this.passwordInput,
    this.repasswordInput,
    this.nameInput,
    this.genderInput,
    this.birthdayInput,
    this.phoneNumberInput, [
    this.signUpStatus = SignUpStatus.initial,
  ]);

  @override
  SignUpState.initial()
      : emailInput = EmailInput(),
        passwordInput = PasswordInput(),
        repasswordInput = PasswordInput(),
        nameInput = NameInput(),
        genderInput = GenderInput(),
        birthdayInput = BirthdayInput(),
        phoneNumberInput = PhoneNumberInput(),
        signUpStatus = SignUpStatus.initial;

  @override
  SignUpState copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    PasswordInput? repasswordInput,
    NameInput? nameInput,
    GenderInput? genderInput,
    BirthdayInput? birthdayInput,
    PhoneNumberInput? phoneNumberInput,
    SignUpStatus? signUpStatus,
  }) {
    return SignUpState(
      emailInput ?? this.emailInput,
      passwordInput ?? this.passwordInput,
      repasswordInput ?? this.repasswordInput,
      nameInput ?? this.nameInput,
      genderInput ?? this.genderInput,
      birthdayInput ?? this.birthdayInput,
      phoneNumberInput ?? this.phoneNumberInput,
      signUpStatus ?? this.signUpStatus,
    );
  }

  @override
  bool get invalid =>
      nameInput.invalid ||
      emailInput.invalid ||
      passwordInput.invalid ||
      repasswordInput.invalid ||
      (passwordInput.text != repasswordInput.text);
}
