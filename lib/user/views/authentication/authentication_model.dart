import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/app/models/app_localization.dart';
import 'package:todolist/app/utils/datetime_utils.dart';

import '/user/models/gender.dart';

part 'authentication_cubit.dart';
part 'authentication_state.dart';

abstract class AuthenticationInput {
  final String? text;

  AuthenticationInput(this.text);

  bool get invalid => text == null || text!.trim().isEmpty;

  String? get errorText => !invalid ? null : AppLocalizations.get(20);
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
  bool get invalid => text == null
      ? false
      : super.invalid || !text!.contains('@') || !text!.contains('.');

  @override
  String? get errorText =>
      !invalid ? super.errorText : AppLocalizations.get(7);
}

class GenderInput extends AuthenticationInput {
  final Gender data;

  GenderInput([this.data = Gender.other]) : super(data.name);
}

class NameInput extends AuthenticationInput {
  NameInput([String? text]) : super(text?.trim());

  @override
  bool get invalid => text == null ? false : super.invalid;
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
  bool get invalid => text == null ? false : super.invalid || text!.length < 6;

  @override
  String? get errorText {
    if (target != null) {
      if (text != target) {
        return AppLocalizations.get(22);
      }
    }
    return !invalid
        ? super.errorText
        : AppLocalizations.get(8);
  }
}

class PhoneNumberInput extends AuthenticationInput {
  PhoneNumberInput([String? text]) : super(text?.trim());

  @override
  bool get invalid => text == null ? false : super.invalid || text!.length < 10;

  @override
  String? get errorText => !invalid
      ? super.errorText
      : AppLocalizations.get(21);
}

class SubmitButton {
  bool enable;

  SubmitButton({this.enable = false});
}
