import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/app/models/app_localization.dart';
import 'package:todolist/app/utils/datetime_utils.dart';
import 'package:todolist/user/views/sign_up/cubits/sign_up_cubit.dart';

class BirthdayTextField extends StatelessWidget {
  final DateTime? data;

  const BirthdayTextField({Key? key, this.data,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        icon: const Icon(Icons.cake),
        suffixIcon: const Icon(Icons.date_range),
        border: const OutlineInputBorder(),
        labelText: AppLocalizations.get(16),
      ),
      controller: TextEditingController(
        text: data.toLocalString(),
      ),
      onTap: () async {
        FocusScope.of(context).unfocus();
        final now = DateTime.now();
        await showDatePicker(
          context: context,
          initialDate: now,
          firstDate: DateTime(1970),
          lastDate: now,
        ).then((dateTime) {
          FocusScope.of(context).requestFocus();
          context.read<SignUpCubit>().onBirthdayChanged(dateTime);
        });
      },
    );
  }
}
