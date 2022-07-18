import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlutterLogo(size: 120),
          const SizedBox(height: 16.0),
          Text(
            'Error',
            style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.red),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Oops! Something went wrong...',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
