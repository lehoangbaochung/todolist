import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/exports/utils.dart';
import '/task/models/task.dart';
import '/task/views/task_detail/task_detail_model.dart';
import 'task_list_model.dart';

class TaskListTile extends StatefulWidget {
  final Task task;

  const TaskListTile(this.task, {Key? key}) : super(key: key);

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: ListTile(
        title: Text(
          widget.task.content,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: widget.task.completed ? Colors.grey : null,
            decoration:
                widget.task.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: widget.task.alarmTime == null
            ? null
            : Text(
                widget.task.alarmTime.toLocalString(withTime: true)!,
                style: TextStyle(
                  color: widget.task.completed
                      ? Colors.grey // completed
                      : widget.task.alarmTime!.isAfter(DateTime.now())
                          ? Colors.blue // not expired
                          : Colors.red, // expired
                  decoration:
                      widget.task.completed ? TextDecoration.lineThrough : null,
                ),
              ),
        leading: Checkbox(
          value: widget.task.completed,
          onChanged: (_) {
            setState(() {
              widget.task.completed = !widget.task.completed;
              widget.task.save();
            });
          },
        ),
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (_) => BlocProvider.value(
              value: context.read<TaskListCubit>(),
              child: BlocProvider(
                create: (_) => TaskDetailCubit(
                  initialTask: widget.task,
                ),
                child: TaskDetailDialog(),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Delete task'),
                content: const Text('Are you sure to delete this task?'),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: const Text('Delete'),
                    onPressed: () {
                      widget.task.delete();
                      Navigator.pop(context);
                      context.showSnackBar('Task deleted.');
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
