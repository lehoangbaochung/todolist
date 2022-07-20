import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/user/views/sign_in/cubits/sign_in_cubit.dart';
import 'package:todolist/user/views/sign_in/pages/sign_in_page.dart';
import 'package:todolist/user/views/sign_up/cubits/sign_up_cubit.dart';
import 'package:todolist/user/views/sign_up/pages/sign_up_page.dart';

import '/common/views/pages/error_page.dart';
import '/common/views/pages/primary_page.dart';
import '/user/views/my_profile/my_profile_model.dart';

class RouteProvider {
  // Common
  static const String primary = '/primary';
  static const String secondary = '/secondary';
  // User
  static const String changeName = '/change_name';
  static const String changePassword = '/change_password';
  static const String forgotPassword = '/forgot_password';
  static const String editProfile = '/edit_profile';
  static const String myProfile = '/my_profile';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  // Task
  static const String taskAdd = '/task_add';
  static const String taskEdit = '/task_edit';
  static const String taskList = '/task_list';

  static Route generate(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => {
            primary: const PrimaryPage(),
            signIn: BlocProvider(
              create: (_) => SignInCubit(),
              child: const SignInPage(),
            ),
            signUp: BlocProvider(
              create: (_) => SignUpCubit(),
              child: const SignUpPage(),
            ),
            myProfile: BlocProvider(
              create: (_) => MyProfileCubit(),
              child: const MyProfilePage(),
            ),
          }[settings.name] ?? const ErrorPage(),
    );
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }

  static void show(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
