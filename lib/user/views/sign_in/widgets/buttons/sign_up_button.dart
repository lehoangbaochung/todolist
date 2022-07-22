import 'package:flutter/material.dart';
import 'package:todolist/common/models/app_localization.dart';
import 'package:todolist/common/models/app_routes.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        AppLocalizations.get(5),
      ),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, AppRoutes.signUp);
      },
    );
  }
}
