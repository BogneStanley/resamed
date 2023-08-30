import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'exam_state.dart';

var examControllerProvider = StateNotifierProvider<ExamController, ExamState>(
  (ref) => ExamController(ExamState.initialize()),
);

class ExamController extends StateNotifier<ExamState> {
  ExamController(
    super.state,
  );
  late PageController pageController;
  late BuildContext context;
}
