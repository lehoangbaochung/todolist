import 'package:hive_flutter/hive_flutter.dart';

import '/task/models/task.dart';
import '/user/models/gender.dart';
import '/user/models/user.dart';
import 'setting_provider.dart';

abstract class HiveProvider<T extends HiveObject> {
  static const name = 'hive';

  /// Initializes an instance of [Hive].
  static Future<void> init() => Hive.initFlutter();

  /// Registers all adapters of [Hive].
  static Future<void> register() {
    return Future.sync(() => Hive
      ..registerAdapter(UserAdapter())
      ..registerAdapter(GenderAdapter())
      ..registerAdapter(TaskAdapter()));
  }

  /// Opens all boxes of [Hive].
  static Future<void> open() {
    return Future.sync(() async {
      SettingProvider.box = await Hive.openBox(SettingProvider.name);
      UserProvider.box = await Hive.openBox<User>(UserProvider.name);
      TaskProvider.box = await Hive.openBox<Task>(TaskProvider.name);
    });
  }
}
