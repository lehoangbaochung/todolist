import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/blocs/cubit.dart';
import 'common/models/hive_provider.dart';
import 'common/models/app_localization.dart';
import 'common/models/app_routes.dart';

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
            initialRoute: AppRoutes.splash,
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
