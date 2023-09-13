class LoginState {
  LoginState({
    this.loginInProgress = false,
  });
  bool loginInProgress;
  factory LoginState.initialize() {
    return LoginState();
  }

  LoginState copyWith({
    bool? loginInProgress,
  }) {
    return LoginState(
      loginInProgress: loginInProgress ?? this.loginInProgress,
    );
  }
}
