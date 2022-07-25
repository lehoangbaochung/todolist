import 'package:flutter_bloc/flutter_bloc.dart';

import '/app/utils/string_utils.dart';
import '/user/models/user.dart';
import '/user/views/sign_in/widgets/text_fields/email_text_field.dart';
import '/user/views/sign_in/widgets/text_fields/password_text_field.dart';
import 'sign_in_state.dart';
import 'sign_in_status.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState.initial());

  void onSubmit() {
    // If user don't fill anything, show error text.
    if (state.emailTextField.text.isNull ||
        state.passwordTextField.data.isNull) {
      emit(
        state.copyWith(
          emailTextField: EmailTextField(text: StringUtils.empty),
          passwordTextField: PasswordTextField(data: StringUtils.empty),
          signInStatus: SignInStatus.failure,
        ),
      );
      return;
    }
    // Execute sign in event.
    if (UserProvider.signIn(
      email: state.emailTextField.text!,
      password: state.passwordTextField.data!,
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

  void onEmailChanged(String text) {
    emit(
      state.copyWith(
        emailTextField: EmailTextField(text: text),
        signInStatus: SignInStatus.initial,
      ),
    );
  }

  void onPasswordChanged(String text) {
    emit(
      state.copyWith(
        passwordTextField: state.passwordTextField.copyWith(
          data: text,
        ),
        signInStatus: SignInStatus.initial,
      ),
    );
  }

  void onPasswordChecked(bool visible) {
    emit(
      state.copyWith(
        passwordTextField: state.passwordTextField.copyWith(
          obscureText: visible,
        ),
      ),
    );
  }
}
