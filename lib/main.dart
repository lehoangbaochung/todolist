import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/exports/app_cubit.dart';
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
            initialRoute: RouteProvider.signIn,
            onGenerateRoute: (settings) => RouteProvider.generate(settings),
            locale: state.locale.data,
            supportedLocales: AppLocale.supportedLocales.values,
            localizationsDelegates: AppLocale.localizationsDelegates,
          );
        },
      ),
    ),
  );
}
