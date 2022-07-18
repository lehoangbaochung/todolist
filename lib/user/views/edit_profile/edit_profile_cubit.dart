part of 'edit_profile_model.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileState.initial());

  void onBirthdayChanged(DateTime? dateTime) {
    emit(state.copyWith(birthdayInput: BirthdayInput(dateTime)));
  }

  void onGenderChanged(Gender gender) {
    emit(state.copyWith(genderInput: GenderInput(gender)));
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

  void onSave() {
    UserProvider.edit(
      UserProvider.instance!.copyWith(
        gender: state.genderInput.data,
        birthday: state.birthdayInput.data,
        phoneNumber: state.phoneNumberInput.text,
      ),
    );
  }
}
