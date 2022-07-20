import 'package:flutter_bloc/flutter_bloc.dart';

import '/user/models/gender.dart';
import '/user/models/user.dart';
import 'sign_up_state.dart';
import 'sign_up_status.dart';
import 'sign_up_widget.dart';

/// A cubit that manages the sign up page.
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState.initial());

  void onEmailChanged(String text) {
    emit(
      state.copyWith(
        emailTextField: EmailTextField(
          data: text,
        ),
      ),
    );
  }

  void onBirthdayChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        birthdayTextField: BirthdayTextField(
          data: dateTime,
        ),
      ),
    );
  }

  void onGenderChanged(Gender gender) {
    emit(
      state.copyWith(
        genderTextField: GenderTextField(
          data: gender,
        ),
      ),
    );
  }

  void onNameChanged(String text) {
    emit(
      state.copyWith(
        nameTextField: NameTextField(
          data: text,
        ),
      ),
    );
  }

  void onPhoneNumberChanged(String text) {
    emit(
      state.copyWith(
        phoneTextField: PhoneTextField(
          data: text.isNotEmpty ? text : null,
        ),
      ),
    );
  }

  void onPasswordChanged({
    String? source,
    String? target,
  }) {
    emit(
      state.copyWith(
        passwordTextField: state.passwordTextField.copyWith(
          source: source,
          target: target,
        ),
      ),
    );
  }

  void onSubmit() {
    if (state.invalid) {
      emit(
        state.copyWith(
          signUpStatus: SignUpStatus.invalid,
        ),
      );
      return;
    }
    // Initialize a new user for sign up.
    final user = User(
      id: UserProvider.box.length + 1,
      name: state.nameTextField.data!,
      email: state.emailTextField.data!,
      password: state.passwordTextField.source!,
      phoneNumber: state.phoneTextField.data,
      birthday: state.birthdayTextField.data,
      gender: state.genderTextField.data,
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
