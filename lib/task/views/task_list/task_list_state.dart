part of 'task_list_model.dart';

class TaskListState {
  Iterable<Task> tasks;
  TaskListFilter filter;

  TaskListState(
    this.tasks,
    this.filter,
  );

  TaskListState.initial()
      : tasks = UserProvider.tasks,
        filter = TaskListFilter.all;

  TaskListState copyWith({
    Iterable<Task>? tasks,
    TaskListFilter? filter,
  }) {
    return TaskListState(
      tasks ?? this.tasks,
      filter ?? this.filter,
    );
  }
}
