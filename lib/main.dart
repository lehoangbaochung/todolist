import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/models/route_provider.dart';
import '/common/models/hive_provider.dart';
import '/common/views/themes/theme_cubit.dart';
import '/common/views/themes/theme_state.dart';

void main() async {
  await HiveProvider.init();
  await HiveProvider.register();
  await HiveProvider.open();
  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (_, state) {
          return MaterialApp(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            initialRoute: RouteProvider.signIn,
            onGenerateRoute: (settings) {
              RouteProvider.settings = settings;
              return RouteProvider.generate();
            },
          );
        },
      ),
    ),
  );
}
