import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/user/models/user.dart';

import '/common/exports/utils.dart';
import '/task/models/task.dart';

export 'task_detail_dialog.dart';

part 'task_detail_cubit.dart';
part 'task_detail_state.dart';

class AlarmButton {
  final DateTime? data;

  AlarmButton({this.data});

  String get label => data == null
      ? 'Set alarm'
      : data.toLocalString(withTime: true)!;
}

class ContentInput {
  final String? text;

  ContentInput(this.text);
}

class SaveButton {
  bool enable;

  SaveButton({this.enable = false});
}
