part of 'language.dart';

class LanguageDictionary {
  static final Map<String, String> en = {};

  static final Map<String, String> vi = {
    LanguageKey.password: 'Mật khẩu',
    LanguageKey.theme: 'Chủ đề',
    LanguageKey.language: 'Ngôn ngữ',
    LanguageKey.email: 'Email',
    LanguageKey.myProfile: 'Thông tin cá nhân',
    // Sign in
    LanguageKey.welcomeTo: 'Chào mừng đến với',
    LanguageKey.signIn: 'Đăng nhập',
    LanguageKey.signUp: 'Đăng ký',
    LanguageKey.forgotPassword: 'Quên mật khẩu',
    LanguageKey.signInStatusFailure: 'Đăng nhập thất bại',
    // Invalid fields
    LanguageKey.invalidEmail: 'Email không hợp lệ',
    LanguageKey.invalidPassword: 'Mật khẩu không hợp lệ',
    LanguageKey.invalidName: 'Tên không hợp lệ',
    LanguageKey.invalidPhone: 'Số điện thoại không hợp lệ',
  };
}
