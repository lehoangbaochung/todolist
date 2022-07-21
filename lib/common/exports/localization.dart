import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_cubit.dart';

class AppLocalizations {
  // Sign in
  static const signInGreeting = 'sign_in_greeting';
  static const email = 'email';
  static const password = 'password';
  static const emailInvalid = 'email_invalid';
  static const passwordInvalid = 'password_invalid';
  static const showPassword = 'show_password';
  static const hidePassword = 'hide_password';
  static const signUp = 'sign_up';
  static const signIn = 'sign_in';
  static const forgotPassword = 'forgot_password';
  static const signInStatusFailure = 'sign_in_status_failure';
  static const signInStatusSuccess = 'sign_in_status_success';
  // Forgot password
  static const find = 'find';
  static const cancel = 'cancel';
  static const forgotPasswordStatusFailure = 'forgot_password_status_failure';
  static const forgotPasswordStatusSuccess = 'forgot_password_status_success';
  // Sign up
  static const name = 'name';
  static const signOut = 'log_out';
  static const delete = 'delete';
  static const myProfile = 'my_profile';
  // Primary
  static const appName = 'app_name';
  static const empty = 'empty';
  static const notes = 'notes';
  static const tasks = 'tasks';
  // Settings
  static const settings = 'settings';
  static const theme = 'theme';
  static const language = 'language';
  static const light = 'light';
  static const dark = 'dark';
  // Password
  static const myProfileGreeting = 'my_profile_greeting';
  static const confirmPassword = 'confirm_password';
  static const changePassword = 'change_password';
  static const editProfile = 'edit_profile';
  static const deleteAccount = 'delete_account';
  static const deleteAccountQuestion = 'delete_account_question';
  static const deleteAccountSuccessfully = 'delete_account_successfully';
  // Task
  static const addTask = 'add_task';
  static const editTask = 'edit_task';
  static const deleteTask = 'delete_task';
  static const allTask = 'all_task';
  static const completedTask = 'complete_task';
  static const uncompletedTask = 'uncompleted_task';

  static final _dictionaries = {
    AppLocale.en: {
      // Primary
      appName: 'To-do list',
      empty: 'Trống',
      notes: 'Notes',
      tasks: 'Tasks',
      // Sign in
      signInGreeting: 'Welcome to To-do list!',
      signInStatusFailure: 'Sign in successfully!',
      // My profile
      myProfileGreeting: 'Hi',
      signOut: 'Sign out',
      myProfile: 'My profile',
      changePassword: 'Change password',
      editProfile: 'Edit profile',
      deleteAccount: 'Delete account',
      deleteAccountQuestion: 'Are you sure to delete this account?\n'
          'This action cannot be undone.',
      deleteAccountSuccessfully: 'Delete account successfully',
      // Settings
      settings: 'Settings',
      theme: 'Theme',
      language: 'Language',
      light: 'Light',
      dark: 'Dark',
      // Task
      addTask: 'Add task',
      editTask: 'Edit task',
      deleteTask: 'Delete task',
      allTask: 'All task',
      completedTask: 'Completed task',
      uncompletedTask: 'Uncompleted task',
    },
    AppLocale.vi: {
      // Primary
      appName: 'To-do list',
      empty: 'Trống',
      notes: 'Ghi chú',
      tasks: 'Nhiệm vụ',
      // Sign in
      signInGreeting: 'Chào mừng đến với To-do list!',
      email: 'Email',
      password: 'Mật khẩu',
      emailInvalid: 'Email không hợp lệ',
      passwordInvalid: 'Mật khẩu không hợp lệ',
      showPassword: 'Hiện mật khẩu',
      hidePassword: 'Ẩn mật khẩu',
      signIn: 'Đăng nhập',
      signUp: 'Đăng ký',
      forgotPassword: 'Quên mật khẩu',
      signInStatusSuccess: 'Đăng nhập thành công',
      signInStatusFailure: 'Đăng nhập thất bại',
      // Forgot password
      cancel: 'Hủy',
      find: 'Tìm',
      forgotPasswordStatusFailure: 'Email không tồn tại',
      forgotPasswordStatusSuccess: 'Mật khẩu của bạn là ',
      delete: 'Xóa',
      // Settings
      settings: 'Cài đặt',
      theme: 'Chủ đề',
      language: 'Ngôn ngữ',
      light: 'Sáng',
      dark: 'Tối',
      // My profile
      myProfileGreeting: 'Chào',
      myProfile: 'Hồ sơ cá nhân',
      confirmPassword: 'Xác nhận mật khẩu',
      changePassword: 'Đổi mật khẩu',
      editProfile: 'Sửa thông tin',
      deleteAccount: 'Xóa tài khoản',
      deleteAccountQuestion: 'Bạn chắc chắn muốn xóa tài khoản?\n'
          'Thao tác này là không thể hoàn tác!',
      deleteAccountSuccessfully: 'Tài khoản đã được xóa thành công',
      signOut: 'Đăng xuất',
      addTask: 'Thêm nhiệm vụ',
      editTask: 'Sửa nhiệm vụ',
      deleteTask: 'Xoá nhiệm vụ',
      allTask: 'Tất cả nhiệm vụ',
      completedTask: 'Nhiệm vụ đã hoàn thành',
      uncompletedTask: 'Nhiệm vụ chưa hoàn thành',
    },
  };

  final Locale locale;
  static AppLocale? appLocale;

  AppLocalizations(this.locale) {
    appLocale = AppLocale.parse(locale.languageCode);
  }

  static String get(String key) => _dictionaries[appLocale]?[key] ?? key;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
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
