class SettingsState {
  SettingsState({required this.medecinInfoIsValidate, required this.isMedecin});
  bool medecinInfoIsValidate;
  bool isMedecin;
  factory SettingsState.initialize() {
    return SettingsState(
      medecinInfoIsValidate: false,
      isMedecin: false,
    );
  }

  SettingsState copyWith({
    bool? medecinInfoIsValidate,
    bool? isMedecin,
  }) {
    return SettingsState(
      medecinInfoIsValidate:
          medecinInfoIsValidate ?? this.medecinInfoIsValidate,
      isMedecin: isMedecin ?? this.isMedecin,
    );
  }
}
