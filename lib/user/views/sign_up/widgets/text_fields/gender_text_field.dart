import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/app/models/app_localization.dart';
import 'package:todolist/user/models/gender.dart';
import 'package:todolist/user/views/sign_up/cubits/sign_up_cubit.dart';

class GenderTextField extends StatelessWidget {
  final Gender data;

  const GenderTextField({
    Key? key,
    this.data = Gender.other,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        icon: const Icon(Icons.visibility),
        suffixIcon: const Icon(Icons.arrow_drop_down),
        border: const OutlineInputBorder(),
        labelText: AppLocalizations.get(12),
      ),
      controller: TextEditingController(
        text: data.toString(),
      ),
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (_) => BlocProvider.value(
            value: context.read<SignUpCubit>(),
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
                      groupValue: data,
                      onChanged: (gender) {
                        Navigator.pop(context);
                        context.read<SignUpCubit>().onGenderChanged(gender!);
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
