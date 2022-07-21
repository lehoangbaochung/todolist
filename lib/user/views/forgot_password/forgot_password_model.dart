import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/common/exports/localization.dart';
import 'package:todolist/common/utils/string_utils.dart';


import '/user/models/user.dart';
import '/user/views/authentication/authentication_model.dart';

export 'forgot_password_dialog.dart';

part 'forgot_password_cubit.dart';
part 'forgot_password_state.dart';

enum ForgotPasswordStatus {
  initial,
  success,
  failure;

  @override
  String toString() {
    switch (this) {
      case ForgotPasswordStatus.initial:
        return StringUtils.empty;
      case ForgotPasswordStatus.success:
        return AppLocalizations.get(
          AppLocalizations.forgotPasswordStatusSuccess,
        );
      case ForgotPasswordStatus.failure:
        return AppLocalizations.get(
          AppLocalizations.forgotPasswordStatusFailure,
        );
    }
  }
}
