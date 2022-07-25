import 'package:hive_flutter/hive_flutter.dart';

part 'task_adapter.dart';
part 'task_provider.dart';

@HiveType(typeId: TaskAdapter.id)
class Task extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int userId;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final DateTime? alarmTime;

  @HiveField(4)
  bool completed;

  Task({
    required this.id,
    required this.userId,
    required this.content,
    required this.alarmTime,
    this.completed = false,
  });

  Task copyWith({
    int? id,
    int? userId,
    String? content,
    DateTime? alarmTime,
    bool? completed,
  }) {
    return Task(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      alarmTime: alarmTime ?? this.alarmTime,
      completed: completed ?? this.completed,
    );
  }

  @override
  String toString() {
    return 'Task(id: $id, userId: $userId, content: $content, alarmTime: $alarmTime, completed: $completed)';
  }
}

