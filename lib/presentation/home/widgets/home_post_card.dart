import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/common/widgets/button/c_icon_button.dart';
import 'package:hospital/res/colors.dart';
import 'package:hospital/tools/extensions.dart';
import 'package:hospital/tools/g_tools.dart';

class HomePostCard extends HookConsumerWidget {
  const HomePostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 50,
                ),
                10.pw,
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr John Doe",
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        "20 Juil 2023",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                RoundedIconButton(
                  iconData: Icons.more_vert,
                  elevation: 0,
                  size: 40,
                  iconColor: AppColors.dark,
                  iconSize: 25,
                  bgColor: Colors.transparent,
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Lorem Lorem description, une longue description, Lorem Lorem description, une longue description. Lorem Lorem description, une longue description",
                maxLines: 2,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: size.width,
                height: 220,
                color: const Color.fromARGB(255, 212, 212, 212),
              ),
            ),
            5.ph,
            Row(
              children: [
                RoundedIconButton(
                  iconData: Icons.favorite,
                  elevation: 0,
                  size: 25,
                  bgColor: Color.fromARGB(0, 0, 0, 0),
                  iconColor: Color.fromARGB(255, 255, 53, 53),
                  iconSize: 24,
                ),
                Text(
                  "21",
                  textScaleFactor: 0.9,
                ),
                8.pw,
                RoundedIconButton(
                  iconData: Icons.comment_rounded,
                  elevation: 0,
                  size: 35,
                  bgColor: Colors.transparent,
                  iconColor: AppColors.dark,
                  iconSize: 24,
                ),
                Text(
                  "09",
                  textScaleFactor: 0.9,
                ),
                8.pw,
                RoundedIconButton(
                  iconData: Icons.share,
                  elevation: 0,
                  size: 35,
                  bgColor: Colors.transparent,
                  iconColor: AppColors.dark,
                  iconSize: 24,
                ),
                Text(
                  "02",
                  textScaleFactor: 0.9,
                ),
                8.pw,
                GTools.expand(),
                RoundedIconButton(
                  iconData: Icons.bookmark_border_rounded,
                  elevation: 0,
                  size: 35,
                  bgColor: Colors.transparent,
                  iconColor: AppColors.dark,
                  iconSize: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
