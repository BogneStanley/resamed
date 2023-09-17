import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'layout_state.dart';

var layoutControllerProvider =
    StateNotifierProvider<LayoutController, LayoutState>(
  (ref) => LayoutController(
    LayoutState.initialize(),
  ),
);

class LayoutController extends StateNotifier<LayoutState> {
  LayoutController(
    super.state,
  );
  late PageController pageController;
  late BuildContext context;

  initializeState() {
    state = LayoutState.initialize();
  }

  changePageIndex(int newIndex) {
    state = state.copyWith(nPageIndex: newIndex);
  }
}
