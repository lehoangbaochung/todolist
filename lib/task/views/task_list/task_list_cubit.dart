part of 'task_list_model.dart';

/// A cubit that manages the list of tasks.
class TaskListCubit extends Cubit<TaskListState> {
  TaskListCubit() : super(TaskListState.initial());

  /// Toggle the filter of tasks.
  /// The filter of tasks is determined by the state of the cubit.
  void onFilterChanged(TaskListFilter filter) {
    emit(
      state.copyWith(
        filter: filter,
        tasks: UserProvider.getTasks(filter),
      ),
    );
  }

  void onRefresh() {
    emit(
      state.copyWith(
        tasks: UserProvider.getTasks(state.filter),
      ),
    );
  }
}
