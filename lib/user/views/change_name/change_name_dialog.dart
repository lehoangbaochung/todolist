import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/models/app_localization.dart';
import '/app/utils/context_utils.dart';
import '/user/models/user.dart';
import '/user/views/my_profile/my_profile_model.dart';
import 'change_name_model.dart';

/// A dialog that allows the user to change name.
class ChangeNameDialog extends StatelessWidget {
  final _nameController = TextEditingController(
    text: UserProvider.instance?.name,
  );

  ChangeNameDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChangeNameCubit(),
      child: BlocBuilder<ChangeNameCubit, ChangeNameState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name input.
                TextField(
                  maxLines: 1,
                  autofocus: true,
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: AppLocalizations.get(11),
                    errorText: state.nameInput.errorText,
                  ),
                  onChanged: (text) {
                    context.read<ChangeNameCubit>().onNameChanged(text);
                  },
                ),
                const SizedBox(height: 12),
                // Action buttons.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Cancel button
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        AppLocalizations.get(23),
                      ),
                    ),
                    // Save button
                    ElevatedButton(
                      onPressed: !state.saveButton.enable
                          ? null
                          : () {
                              Navigator.pop(context);
                              context.read<ChangeNameCubit>().onSubmit();
                              context.read<MyProfileCubit>().onRefresh();
                              context.showSnackBar(
                                AppLocalizations.get(67),
                              );
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
      ),
    );
  }
}
