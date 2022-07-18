import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/models/route_provider.dart';
import 'sign_in_model.dart';

class SignInPage extends StatelessWidget {
  static const _verticalMargin = 16.0;
  static const _horizontalMargin = 8.0;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SignInCubit, SignInState>(
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: _verticalMargin,
                  vertical: _horizontalMargin,
                ),
                child: Column(
                  children: [
                    // App logo
                    const FlutterLogo(size: 120),
                    const SizedBox(height: _verticalMargin),
                    // App label
                    Text(
                      'Welcome to To-do list!',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: _verticalMargin),
                    // Email input
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.email),
                        border: const OutlineInputBorder(),
                        labelText: 'Email',
                        errorText: state.emailInput.errorText,
                      ),
                      onChanged: (text) {
                        context.read<SignInCubit>().onEmailChanged(text);
                      },
                    ),
                    const SizedBox(height: _verticalMargin),
                    // Password input
                    TextField(
                      obscureText: !state.passwordInput.visible,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.password),
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        errorText: state.passwordInput.errorText,
                        suffixIcon: IconButton(
                          tooltip: 'Toggle password',
                          icon: Icon(!state.passwordInput.visible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            context.read<SignInCubit>().onPasswordChecked(
                                  !state.passwordInput.visible,
                                );
                          },
                        ),
                      ),
                      onChanged: (text) {
                        context.read<SignInCubit>().onPasswordChanged(text);
                      },
                    ),
                    const SizedBox(height: _verticalMargin),
                    Visibility(
                      visible: state.signInStatus == SignInStatus.failure,
                      child: const Text(
                        'Invalid email or password',
                      ),
                    ),
                    const SizedBox(height: _verticalMargin),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Sign up.
                        OutlinedButton(
                          child: const Text('Sign up'),
                          onPressed: () {
                            RouteProvider.hide(context);
                            RouteProvider.show(context, RouteProvider.signUp);
                          },
                        ),
                        const SizedBox(width: _horizontalMargin),
                        // Sign in.
                        ElevatedButton(
                          child: const Text('Sign in'),
                          onPressed: () {
                            context.read<SignInCubit>().onSubmit();
                            if (context
                                    .read<SignInCubit>()
                                    .state
                                    .signInStatus ==
                                SignInStatus.success) {
                              RouteProvider.show(
                                context,
                                RouteProvider.primary,
                              );
                            }
                          },
                        ),
                        const SizedBox(width: _horizontalMargin),
                        // Forgot password.
                        TextButton(
                          child: const Text('Forgot password?'),
                          onPressed: () {
                            RouteProvider.show(
                              context,
                              RouteProvider.forgotPassword,
                            );
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
