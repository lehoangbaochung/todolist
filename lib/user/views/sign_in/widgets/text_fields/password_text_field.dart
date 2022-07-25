import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/app/models/app_localization.dart';

import '/user/views/sign_in/cubits/sign_in_cubit.dart';

class PasswordTextField extends StatelessWidget {
  final String? data;
  final bool obscureText;

  const PasswordTextField({
    Key? key,
    this.data,
    this.obscureText = true,
  }) : super(key: key);

  PasswordTextField copyWith({
    String? data,
    bool? obscureText,
  }) {
    return PasswordTextField(
      data: data ?? this.data,
      obscureText: obscureText ?? this.obscureText,
    );
  }

  bool get invalid => data == null ? false : data!.length < 6;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        icon: const Icon(Icons.password),
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          tooltip: obscureText
              ? AppLocalizations.get(9)
              : AppLocalizations.get(10),
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            context.read<SignInCubit>().onPasswordChecked(!obscureText);
          },
        ),
        labelText: AppLocalizations.get(3),
        errorText: !invalid
            ? null
            : AppLocalizations.get(8),
      ),
      onChanged: (text) {
        context.read<SignInCubit>().onPasswordChanged(text);
      },
    );
  }
}
