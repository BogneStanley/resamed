import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/common/widgets/bar/custom_app_bar.dart';
import 'package:hospital/presentation/consultation/consultation_screen.dart';
import 'package:hospital/presentation/exam/exam_screen.dart';
import 'package:hospital/presentation/home/home_screen.dart';
import 'package:hospital/presentation/layout/controller/layout_controller.dart';
import 'package:hospital/presentation/layout/controller/layout_state.dart';
import 'package:hospital/presentation/settings/settings_screen.dart';
import 'package:hospital/res/colors.dart';

import '../common/dialogs/search_dialog/search_dialog.dart';
import '../common/widgets/button/c_icon_button.dart';

@RoutePage()
class LayoutScreen extends HookConsumerWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    const List<Widget> screen = [
      HomeScreen(),
      ExamScreen(),
      ConsultationScreen(),
      SettingsScreen(),
    ];
    LayoutController controller = ref.read(layoutControllerProvider.notifier);
    LayoutState state = ref.watch(layoutControllerProvider);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: state.pageIndex != 3 ? customAppBar(context) : null,
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        body: screen[state.pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: 'Accueil'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bloodtype), label: "Examens"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_search_rounded), label: "Consulter"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_rounded), label: "Plus"),
          ],
          onTap: (value) {
            controller.changePageIndex(value);
          },
          currentIndex: state.pageIndex,
        ),
      ),
    );
  }
}
