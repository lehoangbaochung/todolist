part of 'authentication_model.dart';

abstract class AuthenticationCubit<State extends AuthenticationState>
    extends Cubit<State> {
  AuthenticationCubit(super.initialState);

  void onSubmit();

  void onEmailChanged(String text);

  void onPasswordChanged(String source, [String? target]);
}
