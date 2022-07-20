import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/user/views/forgot_password/forgot_password_model.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Forgot password?'),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (_) => BlocProvider(
            create: (_) => ForgotPasswordCubit(),
            child: const ForgotPasswordDialog(),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      },
    );
  }
}