import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/data/pb_client.dart';
import 'package:pocketbase/pocketbase.dart';

import 'consultation_state.dart';

var consultationControllerProvider =
    StateNotifierProvider<ConsultationController, ConsultationState>(
  (ref) => ConsultationController(ConsultationState.initialize(),
      pb: ref.read(pbClientProvider)),
);

class ConsultationController extends StateNotifier<ConsultationState> {
  PocketBase pb;
  ConsultationController(
    super.state, {
    required this.pb,
  });
  late PageController pageController;
  late BuildContext context;
}
