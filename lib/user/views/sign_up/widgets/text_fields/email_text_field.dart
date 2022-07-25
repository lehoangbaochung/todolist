import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/app/models/app_localization.dart';

import '/user/views/sign_up/cubits/sign_up_cubit.dart';

class EmailTextField extends StatelessWidget {
  final String? data;

  const EmailTextField({
    Key? key,
    this.data,
  }) : super(key: key);

  bool get invalid =>
      data == null || !data!.contains('@') || !data!.contains('.');

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: const Icon(Icons.email),
        border: const OutlineInputBorder(),
        suffixIcon: data == null
            ? null
            : !invalid
                ? const Icon(Icons.check)
                : const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
        labelText: AppLocalizations.get(2),
        errorText: data == null
            ? null
            : !invalid
                ? null
                : AppLocalizations.get(7),
      ),
      onChanged: (text) {
        context.read<SignUpCubit>().onEmailChanged(text);
      },
    );
  }
}
