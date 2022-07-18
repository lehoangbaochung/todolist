part of 'task.dart';

class TaskProvider {
  static late Box<Task> box;
  static const name = 'tasks';
  
  static final _taskProvider = TaskProvider._internal();

  factory TaskProvider() => _taskProvider;

  TaskProvider._internal();

  Future<Task> getTask(int id) async {
    final db = await Hive.openBox('tasks');
    final task = db.get(id.toString());
    return Task.fromMap(task);
  }

  Future<List<Task>> getTasks() async {
    final db = await Hive.openBox('tasks');
    final tasks = db.values.map((task) => Task.fromMap(task)).toList();
    return tasks;
  }

  Future<void> addTask(Task task) async {
    final db = await Hive.openBox('tasks');
    db.add(task.toMap());
  }

  Future<void> updateTask(Task task) async {
    final db = await Hive.openBox('tasks');
    db.put(task.id.toString(), task.toMap());
  }

  Future<void> deleteTask(int id) async {
    final db = await Hive.openBox('tasks');
    db.delete(id.toString());
  }

  Future<void> deleteCompletedTasks() async {
    final db = await Hive.openBox('tasks');
    final tasks = db.values.map((task) => Task.fromMap(task)).toList();
    final completedTasks = tasks.where((task) => task.completed).toList();
    for (final task in completedTasks) {
      db.delete(task.id.toString());
    }
  }

  Future<void> deleteAllCompletedTasks() async {
    final db = await Hive.openBox('tasks');
    final tasks = db.values.map((task) => Task.fromMap(task)).toList();
    final completedTasks = tasks.where((task) => task.completed).toList();
    for (final task in completedTasks) {
      db.delete(task.id.toString());
    }
  }

  Future<void> deleteAllTasksOfUser(int userId) async {
    final db = await Hive.openBox('tasks');
    final tasks = db.values.map((task) => Task.fromMap(task)).toList();
    final userTasks = tasks.where((task) => task.userId == userId).toList();
    for (final task in userTasks) {
      db.delete(task.id.toString());
    }
  }

  Future<void> deleteAllCompletedTasksOfUser(int userId) async {
    final db = await Hive.openBox('tasks');
    final tasks = db.values.map((task) => Task.fromMap(task)).toList();
    final userTasks = tasks.where((task) => task.userId == userId).toList();
    final completedTasks = userTasks.where((task) => task.completed).toList();
    for (final task in completedTasks) {
      db.delete(task.id.toString());
    }
  }
}
