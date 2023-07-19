import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/common/dialogs/search_dialog/search_dialog.dart';
import 'package:hospital/presentation/common/widgets/button/c_icon_button.dart';
import 'package:hospital/tools/g_tools.dart';

class CustomAppBar extends HookConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          const Text(
            'Bienvenue',
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          GTools.expand(),
          RoundedIconButton(
            iconData: Icons.search,
            elevation: 0,
            size: 30,
            iconColor: Colors.white,
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
            iconColor: Colors.white,
            iconSize: 35,
            bgColor: Colors.transparent,
          ),
        ]),
      ),
    );
  }
}
