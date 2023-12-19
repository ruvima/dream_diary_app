mixin FormMixin {
  String? emailValidator(String? text) {
    text ??= '';
    final isValidEmail = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    ).hasMatch(text);
    if (isValidEmail) {
      return null;
    }
    return '';
  }

  String? passwordValidator(String? text) {
    text ??= '';

    text = text.replaceAll(' ', '');

    final isValidPassword = text.length >= 6;

    if (isValidPassword) {
      return null;
    }
    return '';
  }

  String? usernameValidator(String? text) {
    text ??= '';
    text = text.replaceAll(' ', '');

    if (text.length >= 3) {
      return null;
    }
    return '';
  }

  String? phoneNumberValidator(String? text) {
    text ??= '';
    text = text.replaceAll(' ', '');

    if (text.length == 10) {
      return null;
    }
    return '';
  }

  String? notEmptyValidator(String? text) {
    text ??= '';
    text = text.replaceAll(' ', '');

    if (text.isNotEmpty) {
      return null;
    }
    return '';
  }
}
