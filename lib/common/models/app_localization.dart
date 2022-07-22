import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        return AppLocalizations.get(37);
      case AppLocale.vi:
        return AppLocalizations.get(38);
    }
  }
}

class AppLocalizations {
  static AppLocale? appLocale;
  static final Map<AppLocale, Map<String, dynamic>> _dictionaries = {};

  final Locale locale;

  AppLocalizations(this.locale) {
    appLocale = AppLocale.parse(locale.languageCode);
  }

  static String get(int id) =>
      _dictionaries[appLocale]?[id.toString()] ?? id.toString();

  static Future<void> init(BuildContext context) {
    return Future.sync(() async {
      final assetBundle = DefaultAssetBundle.of(context);
      for (final locale in AppLocale.values) {
        final filePath = 'assets/locales/${locale.name}.json';
        await assetBundle.loadString(filePath).then((jsonString) {
          _dictionaries[locale] = jsonDecode(jsonString);
        });
      }
    });
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocale.languageCodes.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(
      AppLocalizations(locale),
    );
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
