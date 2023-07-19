// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hospital/presentation/common/widgets/button/custom_button.dart';
import 'package:hospital/tools/g_tools.dart';

class HomeActivityCard extends HookConsumerWidget {
  const HomeActivityCard({
    super.key,
    required this.image,
    required this.title,
    this.onPressed,
  });

  final String image;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(right: 15),
      shape: SmoothRectangleBorder(
          borderRadius:
              SmoothBorderRadius(cornerRadius: 30, cornerSmoothing: 0.8)),
      child: Container(
        height: 250,
        width: 180,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: 180,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textScaleFactor: 1.3,
                      maxLines: 2,
                    ),
                    GTools.expand(),
                    CButton(
                      label: "Suivre",
                      onPressed: onPressed,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
