import 'package:flutter/material.dart';
import 'package:hospital/main.dart';
import 'package:hospital/tools/error_display.dart';
import 'package:pocketbase/pocketbase.dart';

//Global tools
class GTools {
  static Widget expand() {
    return const Expanded(child: SizedBox());
  }

  static String errorCodeToMessage(String code) {
    switch (code) {
      case "validation_invalid_email":
        return "Email invalide ou déja utilisé";
      case "validation_required":
        return "Ce champ est obligatoire";
      case "validation_not_unique":
        return "La valeur entrer est déja utilisée";
      default:
        return "Une erreur est survenue";
    }
  }

  static clientExceptionErrorDisplay(
      ClientException e, BuildContext context) async {
    logger.e(e);
    String message = "";
    if (e.response["message"].toString().contains("Failed to authenticate")) {
      message = "Email ou mot de passe incorrect";
    }

    e.response["data"].forEach((key, value) {
      message +=
          "$key : ${GTools.errorCodeToMessage(value['code'].toString())}\n";
    });
    if (message.isNotEmpty) {
      ErrorDisplay.fromCode(context, e.response["code"], message);
    } else {
      ErrorDisplay.fromCode(
          context, e.response["code"], "Une erreur est survenue");
    }
  }
}
