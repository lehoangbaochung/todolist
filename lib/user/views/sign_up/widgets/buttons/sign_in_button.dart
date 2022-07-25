import 'package:flutter/material.dart';
import 'package:todolist/app/models/app_routes.dart';
import 'package:todolist/app/models/app_localization.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        AppLocalizations.get(19),
      ),
      onPressed: () {
        Navigator.popAndPushNamed(context, AppRoutes.signIn);
      },
    );
  }
}
