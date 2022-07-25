part of 'user.dart';

class UserProvider {
  /// A singleton instance of [User].
  static User? instance;

  /// A singleton box of [User].
  static late Box<User> box;

  /// The name of [User] box.
  static const name = 'users';

  static Future<void> init() {
    return Future.sync(() async {
      box = await Hive.openBox(name);
      instance = box.get(name, defaultValue: null);
    });
  }

  static bool signIn({
    required String email,
    required String password,
  }) {
    instance = box.get(email);
    return instance?.password == password;
  }

  static void signOut() {
    instance = null;
  }

  static bool signUp(User user) {
    if (box.containsKey(user.email)) {
      return false;
    } else {
      box.put(user.email, user);
      return true;
    }
  }

  static void changeName(String name) {
    instance = instance!.copyWith(
      name: name,
    );
    box.put(
      instance!.email,
      instance!,
    );
  }

  static bool changePassword({
    String? oldPassword,
    required String newPassword,
  }) {
    if (instance?.password != oldPassword) return false;
    box.put(
      instance!.email,
      instance!.copyWith(
        password: newPassword,
      ),
    );
    return true;
  }

  static void edit(User user) {
    box.put(
      instance?.email,
      user,
    );
  }

  static User? get(String email) {
    return box.get(email);
  }

  static void refresh() {
    instance = box.get(instance?.email);
  }

  static Iterable<Task> get tasks =>
      TaskProvider.box.values.where((task) => task.userId == instance?.id);

  static Iterable<Task> getTasks([TaskListFilter filter = TaskListFilter.all]) {
    return {
      TaskListFilter.all: tasks,
      TaskListFilter.completed: tasks.where((task) => task.completed),
      TaskListFilter.uncompleted: tasks.where((task) => !task.completed),
    }[filter]!;
  }
}
