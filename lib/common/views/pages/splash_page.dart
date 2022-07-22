import 'package:flutter/material.dart';

import '/common/models/app_routes.dart';
import '../../models/app_localization.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations.init(context).then((_) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.signIn,
        ModalRoute.withName(AppRoutes.splash),
      );
    });
    return const FlutterLogo();
  }
}
