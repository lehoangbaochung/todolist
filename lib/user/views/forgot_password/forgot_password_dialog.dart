import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/common/exports/localization.dart';

import 'forgot_password_model.dart';

/// A dialog that allows the user to find password.
class ForgotPasswordDialog extends StatelessWidget {
  const ForgotPasswordDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(),
      child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Email input.
                TextField(
                  maxLines: 1,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalizations.get(AppLocalizations.email),
                    errorText: state.emailInput.errorText,
                  ),
                  onChanged: (text) {
                    context.read<ForgotPasswordCubit>().onEmailChanged(text);
                  },
                ),
                const SizedBox(height: 12),
                // Action buttons.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Cancel button
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        AppLocalizations.get(
                          AppLocalizations.cancel,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: state.forgotPasswordStatus.toString(),
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                            text: state.password,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Find button
                    ElevatedButton(
                      onPressed: !state.findButton.enable
                          ? null
                          : () {
                              context.read<ForgotPasswordCubit>().onSubmit();
                            },
                      child: Text(
                        AppLocalizations.get(
                          AppLocalizations.find,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
