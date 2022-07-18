import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/user/views/sign_in/cubits/sign_in_cubit.dart';

class EmailTextField extends StatelessWidget {
  final String? text;

  const EmailTextField({
    Key? key,
    this.text,
  }) : super(key: key);

  bool get invalid =>
      text == null ? false : !text!.contains('@') || !text!.contains('.');

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: const Icon(Icons.email),
        border: const OutlineInputBorder(),
        labelText: 'Email',
        errorText: !invalid ? null : 'This email address is not valid',
      ),
      onChanged: (text) {
        context.read<SignInCubit>().onEmailChanged(text);
      },
    );
  }
}
