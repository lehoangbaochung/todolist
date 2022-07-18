import 'package:flutter/material.dart';

abstract class TextInput extends StatelessWidget {
  final String? text;

  const TextInput(
    Key? key,
    this.text,
  ) : super(key: key);

  bool get invalid => text == null || text!.trim().isEmpty;

  String? get errorText => !invalid ? null : 'This field is required';
}
