part of 'task_detail_model.dart';

class TaskDetailState {
  Task? currentTask;

  final ContentInput contentInput;
  final AlarmButton alarmButton;
  final SaveButton saveButton;

  TaskDetailState(
    this.currentTask,
    this.contentInput,
    this.alarmButton,
    this.saveButton,
  );

  TaskDetailState.initial([this.currentTask])
      : contentInput = ContentInput(currentTask?.content),
        alarmButton = AlarmButton(data: currentTask?.alarmTime),
        saveButton = SaveButton();

  TaskDetailState copyWith({
    Task? currentTask,
    ContentInput? contentInput,
    AlarmButton? alarmButton,
    SaveButton? saveButton,
  }) {
    return TaskDetailState(
      currentTask ?? this.currentTask,
      contentInput ?? this.contentInput,
      alarmButton ?? this.alarmButton,
      saveButton ?? this.saveButton,
    );
  }
}
