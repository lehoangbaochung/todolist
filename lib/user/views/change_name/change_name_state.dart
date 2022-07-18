part of 'change_name_model.dart';

class ChangeNameState {
  final NameInput nameInput;
  final SubmitButton saveButton;

  ChangeNameState(
    this.nameInput,
    this.saveButton,
  );

  ChangeNameState.initial()
      : nameInput = NameInput(),
        saveButton = SubmitButton();

  ChangeNameState copyWith({
    NameInput? nameInput,
    SubmitButton? saveButton,
  }) {
    return ChangeNameState(
      nameInput ?? this.nameInput,
      saveButton ?? this.saveButton,
    );
  }
}
