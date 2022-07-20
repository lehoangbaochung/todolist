import '/common/exports/utils.dart';

enum SignUpStatus {
  initial,
  invalid,
  exist,
  failure,
  success;

  @override
  String toString() {
    switch (this) {
      case SignUpStatus.initial:
        return StringUtils.empty;
      case SignUpStatus.invalid:
        return 'Sign up is not valid';
      case SignUpStatus.exist:
        return 'Email already exist!';
      case SignUpStatus.failure:
        return 'Sign up failed!';
      case SignUpStatus.success:
        return 'Sign up successfully!';
    }
  }
}
