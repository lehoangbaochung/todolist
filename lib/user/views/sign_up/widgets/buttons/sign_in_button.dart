import 'package:flutter/material.dart';
import 'package:todolist/common/models/route_provider.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Back to sign in'),
      onPressed: () {
        RouteProvider.hide(context);
        RouteProvider.show(context, RouteProvider.signIn);
      },
    );
  }
}
