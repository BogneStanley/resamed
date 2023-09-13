import 'package:flutter/material.dart';
import 'package:hospital/presentation/common/dialogs/message/message_dialog.dart';

class ErrorDisplay {
  static fromCode(BuildContext context, int code, String? message) {
    if (code == 400) {
      MessageDialog.alert(
          type: DialogType.error,
          context: context,
          message: message ?? 'Une erreur est survenue');
    }
  }
}
