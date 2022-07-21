import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/common/exports/localization.dart';

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
    AppState.save(
      AppState.appLocale,
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
    AppState.save(
      AppState.appTheme,
      theme.name,
    );
  }
}

enum AppLocale {
  en,
  vi;

  static Iterable<String> get languageCodes =>
      values.map((locale) => locale.name);

  static Iterable<LocalizationsDelegate> get localizationsDelegates => const [
        AppLocalizationsDelegate(),
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  static Map<String, Locale> get supportedLocales =>
      {for (var code in languageCodes) code: Locale(code)};

  factory AppLocale.parse(String name) {
    return AppLocale.values.singleWhere(
      (locale) => locale.name == name,
      orElse: () => AppLocale.en,
    );
  }

  Locale get data => supportedLocales[name]!;

  @override
  String toString() {
    switch (this) {
      case AppLocale.en:
        return 'English';
      case AppLocale.vi:
        return 'Tiếng Việt';
    }
  }
}

class AppState {
  static late Box _box;
  static const name = 'app';
  static const appTheme = 'app_theme';
  static const appLocale = 'app_locale';

  final AppTheme theme;
  final AppLocale locale;

  AppState(
    this.theme,
    this.locale,
  );

  AppState.initial()
      : theme = AppTheme.parse(
          _box.get(
            appTheme,
            defaultValue: AppTheme.light.name,
          ),
        ),
        locale = AppLocale.parse(
          _box.get(
            appLocale,
            defaultValue: AppLocale.en.name,
          ),
        );

  AppState copyWith({
    AppTheme? theme,
    AppLocale? locale,
  }) {
    return AppState(
      theme ?? this.theme,
      locale ?? this.locale,
    );
  }

  static void open() async {
    _box = await Hive.openBox(name);
  }

  static void save(String key, dynamic value) async {
    return await _box.put(key, value);
  }
}

enum AppTheme {
  light,
  dark;

  factory AppTheme.parse(String name) {
    return AppTheme.values.singleWhere(
      (theme) => theme.name == name,
      orElse: () => AppTheme.light,
    );
  }

  ThemeData get data {
    switch (this) {
      case AppTheme.light:
        return ThemeData.light();
      case AppTheme.dark:
        return ThemeData.dark();
    }
  }

  @override
  String toString() {
    switch (this) {
      case AppTheme.light:
        return AppLocalizations.get(AppLocalizations.light);
      case AppTheme.dark:
        return AppLocalizations.get(AppLocalizations.dark);
    }
  }
}
