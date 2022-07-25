import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/app/models/app_localization.dart';
import '/task/views/task_detail/task_detail_model.dart';
import 'task_list_model.dart';
import 'task_list_tile.dart';

/// A page that displays a list of tasks.
class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListCubit, TaskListState>(
      builder: (_, state) {
        return Scaffold(
          body: state.tasks.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.get(63),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (_, index) {
                    return TaskListTile(
                      state.tasks.elementAt(index),
                    );
                  },
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                ),
          floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Filter tasks
              FloatingActionButton(
                heroTag: null,
                tooltip: AppLocalizations.get(42),
                child: const Icon(Icons.filter_list),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text(
                          AppLocalizations.get(44),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final filter in TaskListFilter.values)
                              RadioListTile<TaskListFilter>(
                                title: Text(filter.toString()),
                                value: filter,
                                groupValue:
                                    context.read<TaskListCubit>().state.filter,
                                onChanged: (_) {
                                  Navigator.pop(context);
                                  context
                                      .read<TaskListCubit>()
                                      .onFilterChanged(filter);
                                },
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 8.0),
              // Add task 
              FloatingActionButton(
                heroTag: null,
                tooltip: AppLocalizations.get(41),
                child: const Icon(Icons.add),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: context.read<TaskListCubit>(),
                      child: BlocProvider(
                        create: (_) => TaskDetailCubit(),
                        child: TaskDetailDialog(),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
