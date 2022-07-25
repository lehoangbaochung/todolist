import 'package:flutter/material.dart';

import '/app/models/app_localization.dart';
import '/app/models/app_routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations.init(context).then((_) async {
      await Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.signIn,
        ModalRoute.withName(AppRoutes.splash),
      );
    });
    return const FlutterLogo();
  }
}
