import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/exports/utils.dart';
import '/user/models/gender.dart';
import 'edit_profile_model.dart';

class EditProfileDialog extends StatelessWidget {
  const EditProfileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Gender
              TextField(
                readOnly: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.visibility),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  border: OutlineInputBorder(),
                  labelText: 'Gender',
                ),
                controller: TextEditingController(
                  text: state.genderInput.text?.toUpperCaseAt(0) ??
                      StringUtils.empty,
                ),
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: context.read<EditProfileCubit>(),
                      child: AlertDialog(
                        title: const Text('Gender'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final gender in Gender.values)
                              RadioListTile<Gender>(
                                title: Text(gender.name.toUpperCaseAt(0)),
                                value: gender,
                                groupValue: state.genderInput.data,
                                onChanged: (gender) {
                                  Navigator.pop(context);
                                  context
                                      .read<EditProfileCubit>()
                                      .onGenderChanged(gender!);
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              // Birthday
              TextField(
                readOnly: true,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  icon: Icon(Icons.cake),
                  suffixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(),
                  labelText: 'Birthday',
                ),
                controller: TextEditingController(
                  text: state.birthdayInput.text ?? StringUtils.empty,
                ),
                onTap: () async {
                  final now = DateTime.now();
                  await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: DateTime(1970),
                    lastDate: now,
                  ).then((dateTime) {
                    context
                        .read<EditProfileCubit>()
                        .onBirthdayChanged(dateTime);
                  });
                },
              ),
              const SizedBox(height: 8),
              // Phone number
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: const Icon(Icons.phone),
                  border: const OutlineInputBorder(),
                  labelText: 'Phone number',
                  errorText: state.phoneNumberInput.errorText,
                ),
                onChanged: (text) {
                  context.read<EditProfileCubit>().onPhoneNumberChanged(text);
                },
              ),
              const SizedBox(height: 8),
              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () {
                      context.read<EditProfileCubit>().onSave();
                    },
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
