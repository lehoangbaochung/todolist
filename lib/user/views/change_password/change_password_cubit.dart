part of 'change_password_model.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordState.initial());

  void onOldPasswordChecked(bool visible) {
    emit(
      state.copyWith(
        oldPasswordInput: state.oldPasswordInput.copyWith(
          visible: visible,
        ),
      ),
    );
  }

  void onOldPasswordChanged(String text) {
    emit(
      state.copyWith(
        oldPasswordInput: PasswordInput(
          source: text,
          visible: state.oldPasswordInput.visible,
        ),
      ),
    );
  }

  void onNewPasswordChecked(bool visible) {
    emit(
      state.copyWith(
        newPasswordInput: state.newPasswordInput.copyWith(
          visible: visible,
        ),
        renewPasswordInput: state.renewPasswordInput.copyWith(
          visible: visible,
        ),
      ),
    );
  }

  void onNewPasswordChanged({String? source, String? target}) {
    emit(
      state.copyWith(
        newPasswordInput: PasswordInput(
          source: source,
          target: target,
          visible: state.newPasswordInput.visible,
        ),
        renewPasswordInput: PasswordInput(
          source: source,
          target: target,
          visible: state.renewPasswordInput.visible,
        ),
      ),
    );
  }

  void onSubmit() {
    if (state.invalid) return;
    if (UserProvider.changePassword(
      oldPassword: state.oldPasswordInput.text,
      newPassword: state.newPasswordInput.text!,
    )) {
      emit(
        state.copyWith(
          changePasswordStatus: ChangePasswordStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          changePasswordStatus: ChangePasswordStatus.success,
        ),
      );
    }
  }
}
