import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'consultation_state.dart';

var consultationControllerProvider =
    StateNotifierProvider<ConsultationController, ConsultationState>(
  (ref) => ConsultationController(ConsultationState.initialize()),
);

class ConsultationController extends StateNotifier<ConsultationState> {
  ConsultationController(
    super.state,
  );
  late PageController pageController;
  late BuildContext context;
}
