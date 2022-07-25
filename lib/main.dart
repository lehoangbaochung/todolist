import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/blocs/cubit.dart';
import 'app/models/hive_provider.dart';
import 'app/models/app_localization.dart';
import 'app/models/app_routes.dart';

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
            initialRoute: AppRoutes.splash,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings) => AppRoutes.generate(settings),
            locale: state.locale.data,
            supportedLocales: AppLocale.supportedLocales.values,
            localizationsDelegates: AppLocale.localizationsDelegates,
          );
        },
      ),
    ),
  );
}
