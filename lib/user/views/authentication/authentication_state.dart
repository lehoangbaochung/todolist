part of 'authentication_model.dart';

abstract class AuthenticationState {
  bool get invalid;

  AuthenticationState();

  AuthenticationState.initial();

  AuthenticationState copyWith();
}
