import 'package:flutter/material.dart';

import '/common/exports/localization.dart';
import '/common/models/route_provider.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        AppLocalizations.get(AppLocalizations.signUp),
      ),
      onPressed: () {
        Navigator.pop(context);
        RouteProvider.show(context, RouteProvider.signUp);
      },
    );
  }
}
