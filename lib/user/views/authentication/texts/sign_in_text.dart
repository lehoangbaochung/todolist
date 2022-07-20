import 'package:flutter/material.dart';
import 'package:todolist/user/views/sign_in/cubits/sign_in_status.dart';

class SignInText extends StatelessWidget {
  final SignInStatus status;

  const SignInText({
    Key? key,
    this.status = SignInStatus.initial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: status == SignInStatus.failure,
      child: const Text(
        'Invalid email or password',
      ),
    );
  }
}
