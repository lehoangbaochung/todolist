import 'dart:convert';

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

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int,
      userId: map['userId'] as int,
      content: map['content'] as String,
      alarmTime: map['alarmTime'] != null ? DateTime.fromMillisecondsSinceEpoch(map['alarmTime'] as int) : null,
      completed: map['completed'] as bool,
    );
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userId.hashCode ^
      content.hashCode ^
      alarmTime.hashCode ^
      completed.hashCode;
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userId == userId &&
      other.content == content &&
      other.alarmTime == alarmTime &&
      other.completed == completed;
  }

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

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'content': content,
      'alarmTime': alarmTime?.millisecondsSinceEpoch,
      'completed': completed,
    };
  }

  @override
  String toString() {
    return 'Task(id: $id, userId: $userId, content: $content, alarmTime: $alarmTime, completed: $completed)';
  }
}

