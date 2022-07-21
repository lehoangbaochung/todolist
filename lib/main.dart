import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '/common/exports/app_cubit.dart';
import 'common/exports/localization.dart';
import 'common/models/hive_provider.dart';
import 'common/models/route_provider.dart';

void main() async {
  await HiveProvider.init();
  await HiveProvider.register();
  await HiveProvider.open();
  runApp(
    BlocProvider(
      create: (_) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (_, state) {
          return MaterialApp(
            theme: state.theme.data,
            debugShowCheckedModeBanner: false,
            // Route
            initialRoute: RouteProvider.signIn,
            onGenerateRoute: (settings) => RouteProvider.generate(settings),
            // Localization
            locale: state.locale.data,
            supportedLocales: AppLocale.supportedLocales.values,
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    ),
  );
}
