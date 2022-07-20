import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/common/utils/string_utils.dart';
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
      decoration: const InputDecoration(
        icon: Icon(Icons.visibility),
        suffixIcon: Icon(Icons.arrow_drop_down),
        border: OutlineInputBorder(),
        labelText: 'Gender',
      ),
      controller: TextEditingController(
        text: data.name.toUpperCaseAt(0),
      ),
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (_) => BlocProvider.value(
            value: context.read<SignUpCubit>(),
            child: AlertDialog(
              title: const Text('Gender'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final gender in Gender.values)
                    RadioListTile<Gender>(
                      title: Text(gender.name.toUpperCaseAt(0)),
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
