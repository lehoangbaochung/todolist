import 'package:hive_flutter/hive_flutter.dart';

class SettingProvider {
  static late Box box;
  static const name = 'setting';

  static const String user = 'user';
  static const String theme = 'theme';
  static const String email = 'email';
  static const String language = 'language';

  static void init() async {
    box = await Hive.openBox(name);
  }
}
