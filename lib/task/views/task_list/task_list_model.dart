import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/app/models/app_localization.dart';

import '/task/models/task.dart';
import '/user/models/user.dart';

export '/task/views/task_list/task_list_page.dart';

part 'task_list_cubit.dart';
part 'task_list_state.dart';

enum TaskListFilter {
  all,
  completed,
  uncompleted;

  @override
  String toString() {
    switch (this) {
      case TaskListFilter.all:
        return AppLocalizations.get(45);
      case TaskListFilter.completed:
        return AppLocalizations.get(46);
      case TaskListFilter.uncompleted:
        return AppLocalizations.get(47);
    }
  }
}
