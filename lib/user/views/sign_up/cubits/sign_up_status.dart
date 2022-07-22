import 'package:todolist/common/models/app_localization.dart';

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
        return '';
      case SignUpStatus.invalid:
        return AppLocalizations.get(64);
      case SignUpStatus.exist:
        return AppLocalizations.get(65);
      case SignUpStatus.failure:
        return AppLocalizations.get(28);
      case SignUpStatus.success:
        return AppLocalizations.get(27);
    }
  }
}
