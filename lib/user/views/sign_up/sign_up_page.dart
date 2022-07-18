import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/exports/utils.dart';
import '/common/models/route_provider.dart';
import '/user/models/gender.dart';
import 'sign_up_model.dart';

class SignUpPage extends StatelessWidget {
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App logo
                    const FlutterLogo(),
                    const SizedBox(height: 4),
                    // App label
                    Text(
                      'Sign up',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 16),
                    // Name input
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.account_box),
                        border: const OutlineInputBorder(),
                        suffixIcon: state.nameInput.text.isNull
                            ? null
                            : !state.nameInput.invalid
                                ? const Icon(Icons.check)
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                        labelText: 'Name',
                        errorText: state.nameInput.errorText,
                      ),
                      onChanged: (text) {
                        context.read<SignUpCubit>().onNameChanged(text);
                      },
                    ),
                    const SizedBox(height: 12),
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
                                      groupValue: state.genderInput.data,
                                      onChanged: (gender) {
                                        Navigator.pop(context);
                                        context
                                            .read<SignUpCubit>()
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
                    const SizedBox(height: 12),
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
                        FocusScope.of(context).unfocus();
                        final now = DateTime.now();
                        await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: DateTime(1970),
                          lastDate: now,
                        ).then((dateTime) {
                          FocusScope.of(context).requestFocus();
                          context
                              .read<SignUpCubit>()
                              .onBirthdayChanged(dateTime);
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    // Phone number
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.phone),
                        border: const OutlineInputBorder(),
                        suffixIcon: state.phoneNumberInput.text.isNull
                            ? null
                            : !state.phoneNumberInput.invalid
                                ? const Icon(Icons.check)
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                        labelText: 'Phone number',
                        errorText: state.phoneNumberInput.errorText,
                      ),
                      onChanged: (text) {
                        context.read<SignUpCubit>().onPhoneNumberChanged(text);
                      },
                    ),
                    const SizedBox(height: 12),
                    // Email
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.email),
                        border: const OutlineInputBorder(),
                        suffixIcon: state.emailInput.text.isNull
                            ? null
                            : !state.emailInput.invalid
                                ? const Icon(Icons.check)
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                        labelText: 'Email',
                        errorText: state.emailInput.errorText,
                      ),
                      onChanged: (text) {
                        context.read<SignUpCubit>().onEmailChanged(text);
                      },
                    ),
                    const SizedBox(height: 8),
                    // Password
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.password),
                        border: const OutlineInputBorder(),
                        suffixIcon: state.passwordInput.text.isNull
                            ? null
                            : !state.passwordInput.invalid
                                ? const Icon(Icons.check)
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                        labelText: 'Password',
                        errorText: state.passwordInput.errorText,
                      ),
                      onChanged: (text) {
                        context.read<SignUpCubit>().onPasswordChanged(
                            text, _repasswordController.text);
                      },
                    ),
                    const SizedBox(height: 12),
                    // Confirm new password
                    TextField(
                      controller: _repasswordController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.password_sharp),
                        border: const OutlineInputBorder(),
                        suffixIcon: state.repasswordInput.text.isNull
                            ? null
                            : !state.repasswordInput.invalid
                                ? const Icon(Icons.check)
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                        labelText: 'Confirm new password',
                        errorText: state.repasswordInput.errorText,
                      ),
                      onChanged: (text) {
                        context
                            .read<SignUpCubit>()
                            .onPasswordChanged(_passwordController.text, text);
                      },
                    ),
                    const SizedBox(height: 12),
                    // Action buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: const Text('Back to sign in'),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, RouteProvider.signIn);
                          },
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          child: const Text('Sign up'),
                          onPressed: () {
                            context.read<SignUpCubit>().onSubmit();
                            final status =
                                context.read<SignUpCubit>().state.signUpStatus;
                            switch (status) {
                              case SignUpStatus.success:
                                RouteProvider.hide(context);
                                context.showSnackBar('Sign up successfully!');
                                break;
                              case SignUpStatus.failure:
                                context.showSnackBar('Sign up failed!');
                                break;
                              case SignUpStatus.invalid:
                                context.showSnackBar('Invalid input!');
                                break;
                              case SignUpStatus.exist:
                                context.showSnackBar('Email already exists!');
                                break;
                              default:
                                break;
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
