import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/app/models/app_localization.dart';
import 'package:todolist/user/views/sign_up/cubits/sign_up_cubit.dart';

class PhoneTextField extends StatelessWidget {
  final String? data;

  const PhoneTextField({
    Key? key,
    this.data,
  }) : super(key: key);

  bool get invalid => data == null || data!.length < 10;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: const Icon(Icons.phone),
        border: const OutlineInputBorder(),
        suffixIcon: data == null
            ? null
            : !invalid
                ? const Icon(Icons.check)
                : const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
        labelText: AppLocalizations.get(17),
        errorText: data == null
            ? null
            : !invalid
                ? null
                : AppLocalizations.get(21),
      ),
      onChanged: (text) {
        context.read<SignUpCubit>().onPhoneNumberChanged(text);
      },
    );
  }
}
