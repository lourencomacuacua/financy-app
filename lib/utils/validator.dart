class Validator {
  Validator._();
  static String? validateName(String? value) {
    final condition = RegExp(r"\b([A-ZÀ-ÿ][-,a-z.' ]+)+");

    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Nome inválido. Digite um nome válido";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (value == null || value.isEmpty) {
      return "Esse campo não pode ser vazio";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "E-mail inválido. Digite um e-mail válido";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    // Requer no mínimo 8 caracteres, ao menos uma letra maiúscula, uma minúscula, um número e um caractere especial
    final condition = RegExp(
        r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

    if (value == null || value.isEmpty) {
      return "Esse campo não pode ser vazio";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Senha inválida. Digite uma senha válida";
    }
    return null;
  }

  static String? validateConfirmPassword(String? first, String? second) {
    if (first != second) {
      return "As senhas são diferentes. Por favor, corrija para continuar";
    }
  }
}
