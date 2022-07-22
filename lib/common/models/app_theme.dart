import 'package:flutter/material.dart';

import 'app_localization.dart';

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
        return AppLocalizations.get(35);
      case AppTheme.dark:
        return AppLocalizations.get(34);
    }
  }
}
