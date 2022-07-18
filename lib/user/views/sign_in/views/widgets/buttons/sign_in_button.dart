import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/models/route_provider.dart';
import '/user/views/sign_in/cubits/sign_in_cubit.dart';
import '/user/views/sign_in/cubits/sign_in_state.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Sign in'),
      onPressed: () {
        context.read<SignInCubit>().onSubmit();
        if (context.read<SignInCubit>().state.signInStatus == SignInStatus.success) {
          RouteProvider.show(
            context,
            RouteProvider.primary,
          );
        }
      },
    );
  }
}