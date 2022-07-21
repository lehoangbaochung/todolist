import 'package:todolist/common/exports/localization.dart';

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
        return AppLocalizations.get(AppLocalizations.signInStatusSuccess);
      case SignInStatus.failure:
        return AppLocalizations.get(AppLocalizations.signInStatusFailure);
    }
  }
}
