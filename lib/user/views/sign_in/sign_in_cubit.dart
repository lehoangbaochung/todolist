part of 'sign_in_model.dart';

class SignInCubit extends AuthenticationCubit<SignInState> {
  SignInCubit() : super(SignInState.initial());

  @override
  void onSubmit() {
    // If user is not fill anything, show error text.
    if (state.emailInput.text.isNull || state.passwordInput.text.isNull) {
      emit(
        state.copyWith(
          emailInput: EmailInput(StringUtils.empty),
          passwordInput: PasswordInput(source: StringUtils.empty),
        ),
      );
      return;
    }
    // Execute sign in event.
    if (UserProvider.signIn(
      email: state.emailInput.text!,
      password: state.passwordInput.text!,
    )) {
      emit(
        state.copyWith(
          signInStatus: SignInStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          signInStatus: SignInStatus.failure,
        ),
      );
    }
  }

  @override
  void onEmailChanged(String text) {
    emit(
      state.copyWith(
        emailInput: EmailInput(text),
        signInStatus: SignInStatus.initial,
      ),
    );
  }

  @override
  void onPasswordChanged(String source, [String? target]) {
    emit(
      state.copyWith(
        passwordInput: state.passwordInput.copyWith(
          source: source,
        ),
        signInStatus: SignInStatus.success,
      ),
    );
  }

  void onPasswordChecked(bool visible) {
    emit(
      state.copyWith(
        passwordInput: state.passwordInput.copyWith(
          visible: visible,
        ),
      ),
    );
  }
}
