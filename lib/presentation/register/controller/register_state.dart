import 'dart:io';

class RegisterState {
  RegisterState({
    this.studyCertificateFile,
    this.privatePracticeLicenseFile,
    this.creatingMedecinInfoInProgress = false,
    this.registrationInProgress = false,
  });
  File? studyCertificateFile;
  File? privatePracticeLicenseFile;
  bool creatingMedecinInfoInProgress;
  bool registrationInProgress;
  factory RegisterState.initialize() {
    return RegisterState();
  }

  RegisterState copyWith({
    File? studyCertificateFile,
    File? privatePracticeLicenseFile,
    bool? creatingMedecinInfoInProgress,
    bool? registrationInProgress,
  }) {
    return RegisterState(
      studyCertificateFile: studyCertificateFile ?? this.studyCertificateFile,
      privatePracticeLicenseFile:
          privatePracticeLicenseFile ?? this.privatePracticeLicenseFile,
      creatingMedecinInfoInProgress:
          creatingMedecinInfoInProgress ?? this.creatingMedecinInfoInProgress,
      registrationInProgress:
          registrationInProgress ?? this.registrationInProgress,
    );
  }
}
