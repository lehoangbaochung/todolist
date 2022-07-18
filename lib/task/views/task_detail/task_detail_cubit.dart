part of 'task_detail_model.dart';

class TaskDetailCubit extends Cubit<TaskDetailState> {
  TaskDetailCubit({Task? initialTask})
      : super(TaskDetailState.initial(initialTask));

  void onContentChanged(String content) {
    emit(
      state.copyWith(
        contentInput: ContentInput(content),
        saveButton: SaveButton(
          enable: content.isNotEmpty &&
              state.currentTask?.content != content ||
              state.currentTask?.alarmTime != state.alarmButton.data,
        ),
      ),
    );
  }

  void onAlarmChanged(DateTime? date, TimeOfDay? time) {
    if (date == null || time == null) return;
    final alarmTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    emit(
      state.copyWith(
        alarmButton: AlarmButton(data: alarmTime),
        saveButton: SaveButton(
          enable: state.contentInput.text.isNotNull &&
              state.contentInput.text!.isNotEmpty &&
              state.currentTask?.alarmTime != alarmTime,
        ),
      ),
    );
  }

  void onDeleteAlarm() {
    emit(
      state.copyWith(
        alarmButton: AlarmButton(),
        saveButton: SaveButton(
          enable: state.currentTask?.alarmTime != null ||
              state.contentInput.text != state.currentTask?.content,
        ),
      ),
    );
  }

  void onSave() {
    final task = Task(
      id: TaskProvider.box.length + 1,
      userId: UserProvider.instance!.id,
      content: state.contentInput.text!,
      alarmTime: state.alarmButton.data,
    );
    if (state.currentTask == null) {
      TaskProvider.box.add(task);
    } else {
      TaskProvider.box.put(
        state.currentTask!.id,
        task.copyWith(
          id: state.currentTask!.id,
          completed: state.currentTask!.completed,
        ),
      );
    }
  }
}
