import 'package:flutter/material.dart';
import 'package:todolist/common/models/app_routes.dart';
import 'package:todolist/common/models/app_localization.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        AppLocalizations.get(19),
      ),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, AppRoutes.signIn);
      },
    );
  }
}
