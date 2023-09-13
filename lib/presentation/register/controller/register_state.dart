import 'dart:io';

class RegisterState {
  RegisterState(
      {this.studyCertificateFile,
      this.privatePracticeLicenseFile,
      this.creatingMedecinInfoInProgress = false});
  File? studyCertificateFile;
  File? privatePracticeLicenseFile;
  bool creatingMedecinInfoInProgress;
  factory RegisterState.initialize() {
    return RegisterState();
  }

  RegisterState copyWith({
    File? studyCertificateFile,
    File? privatePracticeLicenseFile,
    bool? creatingMedecinInfoInProgress,
  }) {
    return RegisterState(
      studyCertificateFile: studyCertificateFile ?? this.studyCertificateFile,
      privatePracticeLicenseFile:
          privatePracticeLicenseFile ?? this.privatePracticeLicenseFile,
      creatingMedecinInfoInProgress:
          creatingMedecinInfoInProgress ?? this.creatingMedecinInfoInProgress,
    );
  }
}
