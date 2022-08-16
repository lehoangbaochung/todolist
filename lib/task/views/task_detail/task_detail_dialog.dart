// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/app/models/app_localization.dart';
import '/app/utils/context_utils.dart';
import '/app/utils/string_utils.dart';
import '/task/views/task_list/task_list_model.dart';
import 'task_detail_model.dart';

/// A dialog that allows the user to add or edit a task with its details.
class TaskDetailDialog extends StatefulWidget {
  const TaskDetailDialog({Key? key}) : super(key: key);

  @override
  State<TaskDetailDialog> createState() => _TaskDetailDialogState();
}

class _TaskDetailDialogState extends State<TaskDetailDialog> {
  var _enableNotification = false;
  final _contentController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    _contentController.text =
        context.read<TaskDetailCubit>().state.currentTask?.content ??
            StringUtils.empty;
    return BlocBuilder<TaskDetailCubit, TaskDetailState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
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
                          // If the user didn't select a date, don't do anything.
                          if (date == null) return;
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
                  // Notification button
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppLocalizations.get(77),
                      ),
                      Switch(
                        value: _enableNotification,
                        onChanged: (value) {
                          setState(() {
                            _enableNotification = value;
                          });
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
