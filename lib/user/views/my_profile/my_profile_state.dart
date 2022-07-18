part of 'my_profile_model.dart';

class MyProfileState {
  final String? userName;

  MyProfileState(this.userName);

  MyProfileState.initial() : userName = UserProvider.instance?.name;

  MyProfileState copyWith({
    String? userName,
  }) {
    return MyProfileState(
      userName ?? this.userName,
    );
  }
}
