import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/app/blocs/cubit.dart';

import '/task/models/task.dart';
import '/user/models/gender.dart';
import '/user/models/user.dart';

abstract class HiveProvider {
  /// Initializes an instance of [Hive].
  static Future<void> init() => Hive.initFlutter();

  /// Registers all adapters of [Hive].
  static Future<void> register() {
    return Future.sync(
      () => Hive
        ..registerAdapter(UserAdapter())
        ..registerAdapter(GenderAdapter())
        ..registerAdapter(TaskAdapter()),
    );
  }

  /// Opens all boxes of [Hive].
  static Future<void> open() async {
    return Future.sync(() async {
      await AppHive.init();
      await UserProvider.init();
      await TaskProvider.init();
    });
  }
}
