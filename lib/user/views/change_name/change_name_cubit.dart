part of 'change_name_model.dart';

class ChangeNameCubit extends Cubit<ChangeNameState> {
  ChangeNameCubit() : super(ChangeNameState.initial());

  void onNameChanged(String name) {
    emit(
      state.copyWith(
        nameInput: NameInput(name),
        saveButton: SubmitButton(
          enable: name.isNotEmpty && name != UserProvider.instance?.name,
        ),
      ),
    );
  }

  void onSubmit() {
    UserProvider.changeName(state.nameInput.text!);
  }
}
