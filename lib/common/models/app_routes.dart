import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/views/pages/error_page.dart';
import '/common/views/pages/primary_page.dart';
import '/common/views/pages/splash_page.dart';
import '/user/views/my_profile/my_profile_model.dart';
import '/user/views/sign_in/pages/sign_in_page.dart';
import '/user/views/sign_up/cubits/sign_up_cubit.dart';
import '/user/views/sign_up/pages/sign_up_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String primary = '/primary';
  static const String secondary = '/secondary';
  static const String myProfile = '/my_profile';

  static Route generate(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) =>
          {
            splash: const SplashPage(),
            primary: const PrimaryPage(),
            signIn: const SignInPage(),
            signUp: BlocProvider(
              create: (_) => SignUpCubit(),
              child: const SignUpPage(),
            ),
            myProfile: const MyProfilePage(),
          }[settings.name] ??
          const ErrorPage(),
    );
  }
}
