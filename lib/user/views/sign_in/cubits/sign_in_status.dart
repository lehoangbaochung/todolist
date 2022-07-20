import '/common/utils/string_utils.dart';

enum SignInStatus {
  initial,
  success,
  failure;

  @override
  String toString() {
    switch (this) {
      case SignInStatus.initial:
        return StringUtils.empty;
      case SignInStatus.success:
        return 'Sign in successfully!';
      case SignInStatus.failure:
        return 'Invalid email or password';
    }
  }
}
