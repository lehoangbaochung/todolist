import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_cubit.dart';

class AppLocalizations {
  static const email = 'email';
  // Sign in
  static const signIn = 'sign_in';
  static const signInGreeting = 'sign_in_greeting';
  // Sign up
  static const signUp = 'sign_up';
  // Password
  static const password = 'password';
  static const confirmPassword = 'confirm_password';
  static const forgotPassword = 'forgot_password';
  static const showPassword = 'show_password';
  static const hidePassword = 'hide_password';

  static final _dictionaries = {
    'en': {
      signInGreeting: 'Welcome to To-do list!',
    },
    'vi': {
      email: 'Email',
      password: 'Mật khẩu',
      confirmPassword: 'Xác nhận mật khẩu',
      forgotPassword: 'Quên mật khẩu',
      hidePassword: 'Ẩn mật khẩu',
      showPassword: 'Hiện mật khẩu',
      signIn: 'Đăng nhập',
      signInGreeting: 'Chào mừng đến với To-do list!',
      signUp: 'Đăng ký',
    },
  };

  final Locale locale;

  AppLocalizations(this.locale);

  String? get(String key) => _dictionaries[locale.languageCode]?[key];

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    )!;
  }
}

class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocale.languageCodes.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(
      AppLocalizations(locale),
    );
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
