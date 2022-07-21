import 'package:flutter_bloc/flutter_bloc.dart';

import '/user/models/gender.dart';
import '/common/exports/utils.dart';

part 'authentication_cubit.dart';
part 'authentication_state.dart';

abstract class AuthenticationInput {
  final String? text;

  AuthenticationInput(this.text);

  bool get invalid => text.isNull || text!.trim().isEmpty;

  String? get errorText => !invalid ? null : 'This field is required';
}

class BirthdayInput extends AuthenticationInput {
  final DateTime? data;

  BirthdayInput([this.data]) : super(data?.toLocalString());
}

mixin EmailInputEvent {
  void onEmailChanged(String text);
}

class EmailInput extends AuthenticationInput {
  EmailInput([String? text]) : super(text?.trim());

  @override
  bool get invalid => text.isNull
      ? false
      : super.invalid || !text!.contains('@') || !text!.contains('.');

  @override
  String? get errorText =>
      !invalid ? super.errorText : 'This email address is not valid';
}

class GenderInput extends AuthenticationInput {
  final Gender data;

  GenderInput([this.data = Gender.other]) : super(data.name);
}

class NameInput extends AuthenticationInput {
  NameInput([String? text]) : super(text?.trim());

  @override
  bool get invalid => text.isNull ? false : super.invalid;
}

class PasswordInput extends AuthenticationInput {
  final String? target;
  bool visible;

  PasswordInput({
    String? source,
    this.target,
    this.visible = false,
  }) : super(source?.trim());

  PasswordInput copyWith({
    String? source,
    String? target,
    bool? visible,
  }) {
    return PasswordInput(
      source: source ?? text,
      target: target ?? this.target,
      visible: visible ?? this.visible,
    );
  }

  @override
  bool get invalid => text.isNull ? false : super.invalid || text!.length < 6;

  @override
  String? get errorText {
    if (target.isNotNull) {
      if (text.difference(target)) {
        return 'Passwords do not match';
      }
    }
    return !invalid
        ? super.errorText
        : 'Password must be at least 6 characters';
  }
}

class PhoneNumberInput extends AuthenticationInput {
  PhoneNumberInput([String? text]) : super(text?.trim());

  @override
  bool get invalid => text.isNull ? false : super.invalid || text!.length < 10;

  @override
  String? get errorText => !invalid
      ? super.errorText
      : 'Phone number must be at least 10 characters';
}

class SubmitButton {
  bool enable;

  SubmitButton({this.enable = false});
}
