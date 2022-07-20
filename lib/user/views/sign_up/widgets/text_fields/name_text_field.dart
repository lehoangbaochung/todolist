import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/user/views/sign_up/cubits/sign_up_cubit.dart';

class NameTextField extends StatelessWidget {
  final String? data;

  const NameTextField({
    Key? key,
    this.data,
  }) : super(key: key);

  bool get invalid => data == null || data!.trim().isEmpty;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        icon: const Icon(Icons.account_box),
        border: const OutlineInputBorder(),
        suffixIcon: data == null
            ? null
            : !invalid
                ? const Icon(Icons.check)
                : const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
        labelText: 'Name',
        errorText: data == null
            ? null
            : !invalid
                ? null
                : 'This field is required',
      ),
      onChanged: (text) {
        context.read<SignUpCubit>().onNameChanged(text);
      },
    );
  }
}
