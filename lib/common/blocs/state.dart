part of 'cubit.dart';

class AppState {
  final AppTheme theme;
  final AppLocale locale;

  AppState(
    this.theme,
    this.locale,
  );

  AppState.initial()
      : theme = AppTheme.parse(
          AppHive.box.get(
            AppHive.appTheme,
            defaultValue: AppTheme.light.name,
          ),
        ),
        locale = AppLocale.parse(
          AppHive.box.get(
            AppHive.appLocale,
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
}
