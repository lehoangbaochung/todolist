import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/common/models/app_localization.dart';

import '/common/utils/context_utils.dart';
import '/user/views/sign_up/cubits/sign_up_cubit.dart';
import '/user/views/sign_up/cubits/sign_up_status.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        AppLocalizations.get(5),
      ),
      onPressed: () {
        final cubit = context.read<SignUpCubit>();
        cubit.onSubmit();
        final status = cubit.state.signUpStatus;
        if (status == SignUpStatus.success) {
          Navigator.pop(context);
          context.showSnackBar(status.toString());
        }
      },
    );
  }
}
