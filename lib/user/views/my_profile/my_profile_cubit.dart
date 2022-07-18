part of 'my_profile_model.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(MyProfileState.initial());

  void onRefresh() {
    emit(MyProfileState.initial());
  }
}