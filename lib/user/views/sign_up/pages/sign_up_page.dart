import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/models/app_localization.dart';
import '/user/views/sign_up/cubits/sign_up_cubit.dart';
import '/user/views/sign_up/cubits/sign_up_state.dart';
import '/user/views/sign_up/cubits/sign_up_status.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          final fields = [
            // Labels
            Column(
              children: [
                const FlutterLogo(),
                const SizedBox(width: 12),
                Text(
                  AppLocalizations.get(5),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            // Text fields
            state.nameTextField,
            state.genderTextField,
            state.birthdayTextField,
            state.phoneTextField,
            state.emailTextField,
            state.passwordTextField,
            Center(
              child: Visibility(
                visible: state.signUpStatus != SignUpStatus.initial,
                child: Text(
                  state.signUpStatus.toString(),
                ),
              ),
            ),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state.signInButton,
                const SizedBox(width: 12),
                state.signUpButton,
              ],
            ),
          ];
          return Center(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: fields.length,
              itemBuilder: (_, index) => fields[index],
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
