import 'package:flutter/material.dart';

extension DateTimeUtils on DateTime? {
  DateTime? combine(TimeOfDay? timeOfDay) {
    return this == null || timeOfDay == null
        ? null
        : DateTime(
            this!.year,
            this!.month,
            this!.day,
            timeOfDay.hour,
            timeOfDay.minute,
          );
  }

  String? toLocalString({bool withTime = false}) {
    String format(int time) => time > 9 ? '$time' : '0$time';
    return this == null
        ? null
        : !withTime
            ? '${format(this!.day)}/${format(this!.month)}/${this!.year}'
            : '${format(this!.day)}/${format(this!.month)}/${this!.year} '
                '${format(this!.hour)}:${format(this!.minute)}:${format(this!.second)}';
  }
}
