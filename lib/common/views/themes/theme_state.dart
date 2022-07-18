import 'package:flutter/material.dart';

import '/common/models/setting_provider.dart';

class ThemeState {
  bool lightMode = true;

  /// Defines the current theme is light or dark.
  ThemeData get themeData => lightMode ? ThemeData.light() : ThemeData.dark();

  /// Creates a new [ThemeState] instance.
  ThemeState([this.lightMode = true]);

  /// Creates an initial [ThemeState] instance.
  ThemeState.initial() {
    lightMode = SettingProvider.box.get(
      SettingProvider.theme,
      defaultValue: true,
    );
  }
}
