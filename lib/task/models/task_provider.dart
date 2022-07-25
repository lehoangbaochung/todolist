part of 'task.dart';

class TaskProvider {
  static late Box<Task> box;
  static const name = 'tasks';

  static Future<void> init() {
    return Future.sync(() async {
      box = await Hive.openBox(name);
    });
  }
}
