import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/user/views/sign_up/cubits/sign_up_cubit.dart';

class PasswordTextField extends StatelessWidget {
  final String? source, target;

  const PasswordTextField({
    Key? key,
    this.source,
    this.target,
  }) : super(key: key);

  bool get invalid =>
      source != target ||
      source == null ||
      target == null ||
      source!.length < 6 ||
      target!.length < 6;

  String? get errorText {
    if (source == null && target == null) return null;
    if (source != target) return 'Password do not match';
    if (source!.length < 6 || target!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  PasswordTextField copyWith({
    String? source,
    String? target,
  }) {
    return PasswordTextField(
      source: source ?? this.source,
      target: target ?? this.target,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            icon: const Icon(Icons.password),
            border: const OutlineInputBorder(),
            suffixIcon: source == null
                ? null
                : errorText == null
                    ? const Icon(Icons.check)
                    : const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
            labelText: 'Password',
            errorText: errorText,
          ),
          onChanged: (text) {
            context.read<SignUpCubit>().onPasswordChanged(source: text);
          },
        ),
        const SizedBox(height: 12),
        TextField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            icon: const Icon(Icons.password),
            border: const OutlineInputBorder(),
            suffixIcon: target == null
                ? null
                : errorText == null
                    ? const Icon(Icons.check)
                    : const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
            labelText: 'Confirm new password',
            errorText: errorText,
          ),
          onChanged: (text) {
            context.read<SignUpCubit>().onPasswordChanged(target: text);
          },
        ),
      ],
    );
  }
}
