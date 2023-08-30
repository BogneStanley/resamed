import 'package:flutter/material.dart';
import 'package:hospital/presentation/common/dialogs/search_dialog/search_dialog.dart';
import 'package:hospital/presentation/common/widgets/button/c_icon_button.dart';
import 'package:hospital/res/colors.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    title: const Text(
      "Resamed",
      textScaleFactor: 1,
    ),
    elevation: 0,
    actions: [
      RoundedIconButton(
        iconData: Icons.search,
        elevation: 0,
        size: 30,
        iconColor: AppColors.dark,
        iconSize: 30,
        bgColor: Colors.transparent,
        onTap: () {
          showSearchDialog(context: context);
        },
      ),
      RoundedIconButton(
        iconData: Icons.account_circle_sharp,
        elevation: 0,
        size: 35,
        iconColor: AppColors.dark,
        iconSize: 35,
        bgColor: Colors.transparent,
      ),
    ],
  );
}
