import 'package:todolist/app/models/app_localization.dart';

import '/app/utils/string_utils.dart';

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
        return AppLocalizations.get(29);
      case SignInStatus.failure:
        return AppLocalizations.get(30);
    }
  }
}
