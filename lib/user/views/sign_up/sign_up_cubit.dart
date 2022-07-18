part of 'sign_up_model.dart';

/// A cubit that manages the sign up page.
class SignUpCubit extends AuthenticationCubit<SignUpState> {
  SignUpCubit() : super(SignUpState.initial());

  @override
  void onEmailChanged(String text) {
    emit(state.copyWith(emailInput: EmailInput(text)));
  }

  void onBirthdayChanged(DateTime? dateTime) {
    emit(state.copyWith(birthdayInput: BirthdayInput(dateTime)));
  }

  void onGenderChanged(Gender gender) {
    emit(state.copyWith(genderInput: GenderInput(gender)));
  }

  void onNameChanged(String text) {
    emit(state.copyWith(nameInput: NameInput(text)));
  }

  void onPhoneNumberChanged(String text) {
    emit(
      state.copyWith(
        phoneNumberInput: PhoneNumberInput(
          text.isNotEmpty ? text : null,
        ),
      ),
    );
  }

  @override
  void onPasswordChanged(String source, [String? target]) {
    emit(
      state.copyWith(
        passwordInput: PasswordInput(
          source: source,
          target: target,
        ),
        repasswordInput: PasswordInput(
          source: source,
          target: target,
        ),
      ),
    );
  }

  @override
  void onSubmit() {
    // Check name
    if (state.nameInput.invalid) {
      emit(state.copyWith(nameInput: NameInput(StringUtils.empty)));
      return;
    }
    // Check email
    if (state.emailInput.invalid) {
      emit(state.copyWith(emailInput: EmailInput(StringUtils.empty)));
      return;
    }
    // Check password
    if (state.passwordInput.invalid || state.repasswordInput.invalid) {
      emit(
        state.copyWith(
          passwordInput: PasswordInput(source: StringUtils.empty),
          repasswordInput: PasswordInput(source: StringUtils.empty),
        ),
      );
      return;
    }
    // Check form
    if (state.invalid) {
      emit(state.copyWith(signUpStatus: SignUpStatus.invalid));
      return;
    }
    // Initialize a new user for sign up.
    final user = User(
      id: UserProvider.box.length + 1,
      name: state.nameInput.text!,
      email: state.emailInput.text!,
      password: state.passwordInput.text!,
      phoneNumber: state.phoneNumberInput.text,
      birthday: state.birthdayInput.data,
      gender: state.genderInput.data,
    );
    if (UserProvider.signUp(user)) {
      emit(
        state.copyWith(
          signUpStatus: SignUpStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          signUpStatus: SignUpStatus.exist,
        ),
      );
    }
  }
}
