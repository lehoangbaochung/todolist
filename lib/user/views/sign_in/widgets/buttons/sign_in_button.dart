import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/app/models/app_localization.dart';
import 'package:todolist/app/models/app_routes.dart';

import '/user/views/sign_in/cubits/sign_in_cubit.dart';
import '/user/views/sign_in/cubits/sign_in_status.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        AppLocalizations.get(4),
      ),
      onPressed: () {
        final cubit = context.read<SignInCubit>();
        cubit.onSubmit();
        if (cubit.state.signInStatus == SignInStatus.success) {
          Navigator.pushNamed(
            context,
            AppRoutes.primary,
          );
        }
      },
    );
  }
}
