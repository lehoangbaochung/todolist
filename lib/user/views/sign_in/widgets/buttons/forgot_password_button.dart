import 'package:flutter/material.dart';
import 'package:todolist/common/exports/localization.dart';

import '/user/views/forgot_password/forgot_password_model.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('${AppLocalizations.get(AppLocalizations.forgotPassword)}?'),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (_) => const ForgotPasswordDialog(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      },
    );
  }
}
