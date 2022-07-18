import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/user/views/sign_in/cubits/sign_in_cubit.dart';
import 'package:todolist/user/views/sign_in/cubits/sign_in_state.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(
                children: [
                  const FlutterLogo(size: 120),
                  const SizedBox(height: 8),
                  Text(
                    'Welcome to To-do list!',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 16),
                  state.emailTextField,
                  const SizedBox(height: 8),
                  state.passwordTextField,
                  const SizedBox(height: 8),
                  state.signInText,
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      state.signUpButton,
                      const SizedBox(width: 8),
                      state.signInButton,
                      const SizedBox(width: 8),
                      state.forgotPasswordButton,
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
