import 'package:flutter/material.dart';
import 'package:todolist/app/models/app_localization.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 120),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.get(72),
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.red),
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.get(73),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                AppLocalizations.get(19),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
