import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/models/app_localization.dart';
import '/user/models/user.dart';
import '/user/views/authentication/authentication_model.dart';

export 'change_password_dialog.dart';

part 'change_password_cubit.dart';
part 'change_password_state.dart';

enum ChangePasswordStatus {
  initial,
  success,
  failure;

  @override
  String toString() {
    switch (this) {
      case ChangePasswordStatus.initial:
        return '';
      case ChangePasswordStatus.success:
        return AppLocalizations.get(70);
      case ChangePasswordStatus.failure:
        return AppLocalizations.get(69);
    }
  }
}
