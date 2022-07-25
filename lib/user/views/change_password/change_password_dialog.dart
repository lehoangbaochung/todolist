import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/models/app_localization.dart';
import '/app/utils/context_utils.dart';
import 'change_password_model.dart';

/// A dialog that allows the user to change password.
class ChangePasswordDialog extends StatelessWidget {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _renewPasswordController = TextEditingController();

  ChangePasswordDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Old password.
              TextField(
                maxLines: 1,
                controller: _oldPasswordController,
                obscureText: !state.oldPasswordInput.visible,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: AppLocalizations.get(61),
                  errorText: state.oldPasswordInput.errorText,
                  suffixIcon: IconButton(
                    tooltip: !state.oldPasswordInput.visible
                        ? AppLocalizations.get(9)
                        : AppLocalizations.get(10),
                    icon: Icon(
                      !state.oldPasswordInput.visible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      context.read<ChangePasswordCubit>().onOldPasswordChecked(
                            !state.oldPasswordInput.visible,
                          );
                    },
                  ),
                ),
                onChanged: (text) {
                  context
                      .read<ChangePasswordCubit>()
                      .onOldPasswordChanged(text);
                },
              ),
              const SizedBox(height: 12),
              // New password.
              TextField(
                maxLines: 1,
                controller: _newPasswordController,
                obscureText: !state.newPasswordInput.visible,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: AppLocalizations.get(62),
                  errorText: state.newPasswordInput.errorText,
                  suffixIcon: IconButton(
                    tooltip: !state.newPasswordInput.visible
                        ? AppLocalizations.get(9)
                        : AppLocalizations.get(10),
                    icon: Icon(
                      !state.newPasswordInput.visible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      context.read<ChangePasswordCubit>().onNewPasswordChecked(
                            !state.newPasswordInput.visible,
                          );
                    },
                  ),
                ),
                onChanged: (text) {
                  context.read<ChangePasswordCubit>().onNewPasswordChanged(
                        source: text,
                        target: _renewPasswordController.text,
                      );
                },
              ),
              const SizedBox(height: 12),
              // Confirm new password.
              TextField(
                maxLines: 1,
                controller: _renewPasswordController,
                obscureText: !state.renewPasswordInput.visible,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: AppLocalizations.get(18),
                  errorText: state.renewPasswordInput.errorText,
                  suffixIcon: IconButton(
                    tooltip: !state.renewPasswordInput.visible
                        ? AppLocalizations.get(9)
                        : AppLocalizations.get(10),
                    icon: Icon(
                      !state.renewPasswordInput.visible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      context.read<ChangePasswordCubit>().onNewPasswordChecked(
                            !state.renewPasswordInput.visible,
                          );
                    },
                  ),
                ),
                onChanged: (text) {
                  context.read<ChangePasswordCubit>().onNewPasswordChanged(
                        source: _newPasswordController.text,
                        target: text,
                      );
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
                      AppLocalizations.get(23),
                    ),
                  ),
                  Text(state.changePasswordStatus.toString()),
                  // Save button
                  ElevatedButton(
                    onPressed: () {
                      context.read<ChangePasswordCubit>().onSubmit();
                      if (state.changePasswordStatus ==
                          ChangePasswordStatus.success) {
                        Navigator.pop(context);
                        context.showSnackBar(
                          AppLocalizations.get(70),
                        );
                      }
                    },
                    child: Text(
                      AppLocalizations.get(68),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
