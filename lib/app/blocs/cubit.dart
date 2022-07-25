import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/app_localization.dart';
import '../models/app_theme.dart';

part 'hive.dart';
part 'state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());

  void onLocaleChanged(AppLocale locale) {
    // Update state
    emit(
      state.copyWith(
        locale: locale,
      ),
    );
    // Save locale
    AppHive.save(
      AppHive.appLocale,
      locale.name,
    );
  }

  void onThemeChanged(AppTheme theme) {
    // Update state
    emit(
      state.copyWith(
        theme: theme,
      ),
    );
    // Save theme
    AppHive.save(
      AppHive.appTheme,
      theme.name,
    );
  }
}
