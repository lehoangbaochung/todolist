import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/views/pages/error_page.dart';
import '/common/views/pages/primary_page.dart';
import '/task/models/task.dart';
import '/task/views/task_detail/task_detail_model.dart';
import '/task/views/task_list/task_list_model.dart';
import '/user/views/change_password/change_password_model.dart';
import '/user/views/forgot_password/forgot_password_model.dart';
import '/user/views/my_profile/my_profile_model.dart';
import '/user/views/sign_in/sign_in_model.dart';
import '/user/views/sign_up/sign_up_model.dart';

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

  static late RouteSettings settings;

  static Route generate() {
    return MaterialPageRoute(
      builder: (context) =>
          {
            // Common
            primary: const PrimaryPage(),
            // User
            signIn: BlocProvider(
              create: (_) => SignInCubit(),
              child: SignInPage(),
            ),
            signUp: BlocProvider(
              create: (_) => SignUpCubit(),
              child: SignUpPage(),
            ),
            myProfile: BlocProvider(
              create: (_) => MyProfileCubit(),
              child: const MyProfilePage(),
            ),
            changePassword: BlocProvider(
              create: (_) => ChangePasswordCubit(),
              child: ChangePasswordDialog(),
            ),
            forgotPassword: BlocProvider(
              create: (_) => ForgotPasswordCubit(),
              child: const ForgotPasswordDialog(),
            ),
            editProfile: BlocProvider(
              create: (_) => MyProfileCubit(),
              child: const MyProfilePage(),
            ),
            // Task
            taskAdd: BlocProvider(
              create: (_) => TaskDetailCubit(),
              child: TaskDetailDialog(),
            ),
            taskEdit: BlocProvider(
              create: (_) => TaskDetailCubit(
                initialTask: settings.arguments as Task?,
              ),
              child: TaskDetailDialog(),
            ),
            taskList: BlocProvider(
              create: (_) => TaskListCubit(),
              child: const TaskListPage(),
            ),
          }[settings.name] ??
          const ErrorPage(),
    );
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }

  static void show(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
