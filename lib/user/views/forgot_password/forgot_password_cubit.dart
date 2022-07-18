part of 'forgot_password_model.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordState.initial());

  void onEmailChanged(String text) {
    emit(
      state.copyWith(
        emailInput: EmailInput(text),
        password: StringUtils.empty,
        forgotPasswordStatus: ForgotPasswordStatus.initial,
      ),
    );
    emit(
      state.copyWith(
        findButton: SubmitButton(
          enable: !state.emailInput.invalid,
        ),
      ),
    );
  }

  void onSubmit() {
    final user = UserProvider.get(
      state.emailInput.text!,
    );
    if (user == null) {
      emit(
        state.copyWith(
          password: StringUtils.empty,
          forgotPasswordStatus: ForgotPasswordStatus.failure,
        ),
      );
    } else {
      emit(
        state.copyWith(
          password: user.password,
          forgotPasswordStatus: ForgotPasswordStatus.success,
        ),
      );
    }
  }
}
