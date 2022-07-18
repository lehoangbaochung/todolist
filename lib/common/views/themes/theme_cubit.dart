import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/models/setting_provider.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  /// Toggles the current theme between light and dark.
  void toggle() {
    final mode = !state.lightMode;
    SettingProvider.box.put(
      SettingProvider.theme,
      mode,
    );
    emit(ThemeState(mode));
  }
}
