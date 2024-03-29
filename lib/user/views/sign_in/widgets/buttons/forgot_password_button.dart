import 'package:flutter/material.dart';
import 'package:todolist/app/models/app_localization.dart';

import '/user/views/forgot_password/forgot_password_model.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        AppLocalizations.get(6),
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return SingleChildScrollView(
              child: Container(
                padding: MediaQuery.of(context).viewInsets,
                child: const ForgotPasswordDialog(),
              ),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      },
    );
  }
}
