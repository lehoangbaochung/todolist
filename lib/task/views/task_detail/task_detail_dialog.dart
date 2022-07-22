// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/models/app_localization.dart';
import '/common/utils/context_utils.dart';
import '/common/utils/string_utils.dart';
import '/task/views/task_list/task_list_model.dart';
import 'task_detail_model.dart';

/// A dialog that allows the user to add or edit a task with its details.
class TaskDetailDialog extends StatelessWidget {
  final _contentController = TextEditingController();

  TaskDetailDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _contentController.text =
        context.read<TaskDetailCubit>().state.currentTask?.content ??
            StringUtils.empty;
    return BlocBuilder<TaskDetailCubit, TaskDetailState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Task content.
              TextField(
                maxLines: null,
                autofocus: true,
                controller: _contentController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: AppLocalizations.get(51),
                ),
                onChanged: (text) {
                  context.read<TaskDetailCubit>().onContentChanged(text);
                },
              ),
              const SizedBox(height: 8.0),
              // Action buttons.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Alarm button
                      GestureDetector(
                        child: Chip(
                          avatar: state.alarmButton.data == null
                              ? const Icon(Icons.alarm_add, color: Colors.blue)
                              : const Icon(Icons.alarm_on, color: Colors.blue),
                          label: Text(
                            state.alarmButton.label,
                            style: const TextStyle(color: Colors.blue),
                          ),
                          deleteIcon:
                              const Icon(Icons.clear, color: Colors.blue),
                          deleteButtonTooltipMessage: AppLocalizations.get(75),
                          onDeleted: state.alarmButton.data == null
                              ? null
                              : () {
                                  context
                                      .read<TaskDetailCubit>()
                                      .onDeleteAlarm();
                                },
                        ),
                        onTap: () async {
                          final now = DateTime.now();
                          final date = await showDatePicker(
                            context: context,
                            initialDate: now,
                            currentDate: now,
                            firstDate: now,
                            lastDate: DateTime(now.year + 5),
                          );
                          // Set time
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          // Set alarm
                          context
                              .read<TaskDetailCubit>()
                              .onAlarmChanged(date, time);
                        },
                      ),
                    ],
                  ),
                  // Save button
                  ElevatedButton(
                    onPressed: !state.saveButton.enable
                        ? null
                        : () {
                            Navigator.pop(context);
                            context.showSnackBar(
                              AppLocalizations.get(12),
                            );
                            context.read<TaskDetailCubit>().onSave();
                            context.read<TaskListCubit>().onRefresh();
                          },
                    child: Text(
                      AppLocalizations.get(68),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
