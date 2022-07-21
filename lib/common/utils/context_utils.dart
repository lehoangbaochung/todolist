import 'package:flutter/material.dart';
import 'package:todolist/common/exports/localization.dart';

extension ContextUtils on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this);
  
  /// Shows a [SnackBar] with a message [msg] across all registered [Scaffold]s.
  void showSnackBar(String msg, {SnackBarAction? action}) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(msg),
          action: action,
          duration: const Duration(seconds: 1),
        ),
      );
  }

  void showAlertDialog({
    required String title,
    required String description,
    List<Widget>? actions,
  }) async {
    await showDialog<void>(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: actions ??
            [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
      ),
    );
  }
}
