import '/common/exports/utils.dart';
import '/user/models/gender.dart';
import '/user/models/user.dart';
import '/user/views/authentication/authentication_model.dart';

export '/user/views/sign_up/sign_up_page.dart';

part 'sign_up_cubit.dart';
part 'sign_up_state.dart';

enum SignUpStatus {
  initial,
  invalid,
  exist,
  failure,
  success;
}
