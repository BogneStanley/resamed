import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:hospital/presentation/home/models/rubrique_model.dart';
// import 'package:hospital/presentation/home/rubrique/list/user_rubrique.dart';
import 'package:hospital/presentation/home/widgets/home_header.dart';
import 'package:hospital/presentation/home/widgets/home_post_view.dart';
import 'package:hospital/res/colors.dart';
import 'package:hospital/tools/extensions.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<RubriqueModel> rubrique = userRubrique;
    //Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HomeHeader(),
              20.ph,
              const HomePostsView(),
            ],
          ),
        ),
      ),
    );
  }
}
