import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/exam/widgets/tabs/exam_history_tab.dart';
import 'package:hospital/presentation/exam/widgets/tabs/exam_tab.dart';
import 'package:hospital/res/colors.dart';

import 'controller/exam_controller.dart';
import 'controller/exam_state.dart';

@RoutePage()
class ExamScreen extends HookConsumerWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ExamController controller = ref.read(examControllerProvider.notifier);
    TabController tabBarController = useTabController(initialLength: 2);
    controller.context = context;
    ExamState state = ref.watch(examControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Column(
        children: [
          BottomAppBar(
            color: Colors.white,
            elevation: 0,
            child: TabBar(
              controller: tabBarController,
              tabs: const [
                Tab(
                  text: "Examens",
                ),
                Tab(
                  text: "Historique",
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: tabBarController, children: const [
              ExamTab(),
              ExamHistoryTab(),
            ]),
          ),
        ],
      ),
    );
  }
}
