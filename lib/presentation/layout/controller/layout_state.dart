class LayoutState {
  LayoutState({
    required this.pageIndex,
  });
  int pageIndex;
  factory LayoutState.initialize() {
    return LayoutState(
      pageIndex: 0,
    );
  }

  LayoutState copyWith({
    int? nPageIndex,
  }) {
    return LayoutState(
      pageIndex: nPageIndex ?? pageIndex,
    );
  }
}
