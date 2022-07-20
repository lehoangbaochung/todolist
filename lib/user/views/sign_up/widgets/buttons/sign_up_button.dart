import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/models/route_provider.dart';
import '/common/utils/context_utils.dart';
import '/user/views/sign_up/cubits/sign_up_cubit.dart';
import '/user/views/sign_up/cubits/sign_up_status.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Sign up'),
      onPressed: () {
        final cubit = context.read<SignUpCubit>();
        cubit.onSubmit();
        final status = cubit.state.signUpStatus;
        if (status == SignUpStatus.success) {
          RouteProvider.hide(context);
          context.showSnackBar(status.toString());
        }
      },
    );
  }
}
