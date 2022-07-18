import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/exports/utils.dart';
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
        return StringUtils.empty;
      case ChangePasswordStatus.success:
        return 'Your password is changed successfully';
      case ChangePasswordStatus.failure:
        return 'Old password is not correct';
    }
  }
}
