part of 'edit_profile_model.dart';

class EditProfileState {
  final GenderInput genderInput;
  final BirthdayInput birthdayInput;
  final PhoneNumberInput phoneNumberInput;

  EditProfileState(
    this.genderInput,
    this.birthdayInput,
    this.phoneNumberInput,
  );

  EditProfileState.initial() :
        genderInput = GenderInput(UserProvider.instance!.gender),
        birthdayInput = BirthdayInput(UserProvider.instance?.birthday),
        phoneNumberInput = PhoneNumberInput(UserProvider.instance?.phoneNumber);

  EditProfileState copyWith({
    GenderInput? genderInput,
    BirthdayInput? birthdayInput,
    PhoneNumberInput? phoneNumberInput,
  }) {
    return EditProfileState(
      genderInput ?? this.genderInput,
      birthdayInput ?? this.birthdayInput,
      phoneNumberInput ?? this.phoneNumberInput,
    );
  }
}
