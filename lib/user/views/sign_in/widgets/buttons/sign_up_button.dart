import 'package:flutter/material.dart';

import '/common/models/route_provider.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: const Text('Sign up'),
      onPressed: () {
        RouteProvider.hide(context);
        RouteProvider.show(context, RouteProvider.signUp);
      },
    );
  }
}
