import 'package:auto_route/auto_route.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:hospital/presentation/common/widgets/button/custom_button.dart';
import 'package:hospital/res/colors.dart';
import 'package:hospital/tools/extensions.dart';

class MessageDialog {
  static Future alert(
      {required DialogType type,
      required BuildContext context,
      String? title,
      String? message}) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 30,
                  cornerSmoothing: 1,
                ),
              ),
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    color: typeToBgColor(type),
                    shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                            cornerRadius: 20, cornerSmoothing: 0.8)),
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        title ?? typeToString(type),
                        style: TextStyle(
                          color: typeToColor(type),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  15.ph,
                  if (message != null)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        message,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  15.ph,
                  CButton(
                    label: "Fermer",
                    onPressed: () {
                      context.router.pop();
                    },
                    bgColor: typeToColor(type),
                    labelColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Color typeToColor(DialogType type) {
  switch (type) {
    case DialogType.error:
      return Colors.red;
    case DialogType.success:
      return Colors.green;
    case DialogType.info:
      return AppColors.primary;
    case DialogType.warning:
      return Colors.yellow;
    default:
      return AppColors.primary;
  }
}

Color typeToBgColor(DialogType type) {
  double opacity = 0.1;
  switch (type) {
    case DialogType.error:
      return Colors.red.withOpacity(opacity);
    case DialogType.success:
      return Colors.green.withOpacity(opacity);
    case DialogType.info:
      return AppColors.primary.withOpacity(opacity);
    case DialogType.warning:
      return Colors.yellow.withOpacity(opacity);
    default:
      return AppColors.primary.withOpacity(opacity);
  }
}

String typeToString(DialogType type) {
  switch (type) {
    case DialogType.error:
      return "Erreur";
    case DialogType.success:
      return "Success";
    case DialogType.info:
      return "Info";
    case DialogType.warning:
      return "Avertissement";
    default:
      return "Info";
  }
}

enum DialogType { error, success, info, warning }
