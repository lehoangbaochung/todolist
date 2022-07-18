part of 'task.dart';

class TaskAdapter extends TypeAdapter<Task> {
  static const id = 2;
  static const count = 5;

  @override
  int get typeId => id;

  @override
  Task read(BinaryReader reader) {
    final fields = [
      for (var i = 0; i < count; i++) reader.read(),
    ];
    return Task(
      id: fields[0] as int,
      userId: fields[1] as int,
      content: fields[2] as String,
      alarmTime: fields[3] as DateTime?,
      completed: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..write(obj.id)
      ..write(obj.userId)
      ..write(obj.content)
      ..write(obj.alarmTime)
      ..write(obj.completed);
  }
}