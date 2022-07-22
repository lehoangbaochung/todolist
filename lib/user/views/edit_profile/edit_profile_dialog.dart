import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/models/app_localization.dart';
import '/common/utils/string_utils.dart';
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
                decoration: InputDecoration(
                  icon: const Icon(Icons.visibility),
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  border: const OutlineInputBorder(),
                  labelText: AppLocalizations.get(12),
                ),
                controller: TextEditingController(
                  text: state.genderInput.data.toString(),
                ),
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: context.read<EditProfileCubit>(),
                      child: AlertDialog(
                        title: Text(
                          AppLocalizations.get(12),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final gender in Gender.values)
                              RadioListTile<Gender>(
                                title: Text(gender.toString()),
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
                decoration: InputDecoration(
                  icon: const Icon(Icons.cake),
                  suffixIcon: const Icon(Icons.date_range),
                  border: const OutlineInputBorder(),
                  labelText: AppLocalizations.get(16),
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
                  labelText: AppLocalizations.get(17),
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
                    child: Text(
                      AppLocalizations.get(23),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      AppLocalizations.get(68),
                    ),
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
