class FormValidator {
  final String? value;
  final String? fieldName;
  String? errorMessage;
  FormValidator(this.value, this.fieldName);
  FormValidator isRequired() {
    if (value?.isEmpty ?? true) {
      errorMessage =
          "${errorMessage ?? ''}Le champ ${fieldName ?? ''} est obligatoire\n";
    }
    return this;
  }

  FormValidator email() {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value ?? '')) {
      errorMessage = "${errorMessage ?? ''}L'email est  invalide\n";
    }
    return this;
  }

  FormValidator password() {
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(value ?? '')) {
      errorMessage =
          "${errorMessage ?? ''}Le mot de passe doit contenir au moins 1 majuscule, 1 minuscule, 1 chiffre et 1 caractère spécial";
    }
    return this;
  }

  FormValidator confirmPassword(String password) {
    if (value != password) {
      errorMessage =
          "${errorMessage ?? ''}Les mots de passe ne correspondent pas";
    }
    return this;
  }

  // this method return the error message for check if the value is valid
  String? validate() {
    return errorMessage;
  }

  FormValidator phone() {
    if (!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
        .hasMatch(value ?? '')) {
      errorMessage = "${errorMessage ?? ''}Le numéro de téléphone est invalide";
    }
    return this;
  }
}
