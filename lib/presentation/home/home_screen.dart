import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:hospital/presentation/home/models/rubrique_model.dart';
// import 'package:hospital/presentation/home/rubrique/list/user_rubrique.dart';
import 'package:hospital/presentation/home/widgets/home_header.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<RubriqueModel> rubrique = userRubrique;
    // Size size = MediaQuery.of(context).size;
    return const AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(),
            ],
          ),
        ),
      ),
    );
  }
}
