import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/common/widgets/button/c_icon_button.dart';
import 'package:hospital/presentation/common/widgets/field/custom_text_form_field.dart';
import 'package:hospital/res/colors.dart';
import 'package:hospital/tools/extensions.dart';

showSearchDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    barrierColor: Colors.white,
    builder: (context) {
      return const SearchDialog();
    },
  );
}

class SearchDialog extends HookConsumerWidget {
  const SearchDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SizedBox(
        width: size.width,
        child: Column(children: [
          15.ph,
          Row(
            children: [
              RoundedIconButton(
                iconData: Icons.arrow_back,
                elevation: 0,
                size: 40,
                iconColor: AppColors.dark,
                iconSize: 24,
                bgColor: Colors.transparent,
                onTap: () {
                  context.router.pop();
                },
              ),
              const Expanded(
                child: SizedBox(
                  height: 60,
                  child: CTextFormField(
                    minHeight: 30,
                    hintText: "Recherche...",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              10.pw,
            ],
          )
        ]),
      ),
    );
  }
}
