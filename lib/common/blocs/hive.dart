part of 'cubit.dart';

class AppHive {
  static late Box box;
  static const name = 'app';
  static const appTheme = 'app_theme';
  static const appLocale = 'app_locale';

  static void init() async {
    box = await Hive.openBox(name);
  }

  static void save(String key, dynamic value) async {
    return await box.put(key, value);
  }
}
