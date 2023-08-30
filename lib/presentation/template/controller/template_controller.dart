import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'template_state.dart';

var templateControllerProvider =
    StateNotifierProvider<TemplateController, TemplateState>(
  (ref) => TemplateController(TemplateState.initialize()),
);

class TemplateController extends StateNotifier<TemplateState> {
  TemplateController(
    super.state,
  );
  late PageController pageController;
  late BuildContext context;
}
