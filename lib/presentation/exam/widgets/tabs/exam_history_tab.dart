import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/exam/widgets/tabs/exam_tab.dart';
import 'package:hospital/res/colors.dart';

import '../../controller/exam_controller.dart';
import '../../controller/exam_state.dart';

@RoutePage()
class ExamHistoryTab extends HookConsumerWidget {
  const ExamHistoryTab({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ExamController controller = ref.read(examControllerProvider.notifier);
    TabController tabBarController = useTabController(initialLength: 2);
    controller.context = context;
    ExamState state = ref.watch(examControllerProvider);
    return Center(
      child: Text(
        "Aucun examen\neffectué",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}
