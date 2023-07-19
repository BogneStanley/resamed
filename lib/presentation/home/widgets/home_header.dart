import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/common/widgets/bar/custom_app_bar.dart';
import 'package:hospital/presentation/home/widgets/home_activity_card.dart';
import 'package:hospital/res/colors.dart';
import 'package:hospital/tools/extensions.dart';

class HomeHeader extends HookConsumerWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: AppColors.dark.withOpacity(1),
      height: 400,
      child: Column(
        children: [
          const CustomAppBar(),
          0.ph,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                15.pw,
                const HomeActivityCard(
                  image: "assets/img/reservation.jpg",
                  title: "Activité 1",
                ),
                const HomeActivityCard(
                  image: "assets/img/reservation.jpg",
                  title: "Activité 2",
                ),
                const HomeActivityCard(
                  image: "assets/img/reservation.jpg",
                  title: "Activité 3",
                ),
                const HomeActivityCard(
                  image: "assets/img/reservation.jpg",
                  title: "Activité 4",
                ),
                const HomeActivityCard(
                  image: "assets/img/reservation.jpg",
                  title: "Activité 5",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
