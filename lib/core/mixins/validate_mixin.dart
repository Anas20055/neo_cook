mixin CustomTextFieldValidator {
  String? validateNotEmpty(String? value) {
    if (value?.isEmpty == true) {
      return 'Field cannot be empty';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value?.isEmpty == true) {
      return 'Field cannot be empty';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value?.isEmpty == true) {
      return 'Field cannot be empty';
    } else if (value!.length < 8 || value.length > 15) {
      return 'Length must be between 8 and 15 characters';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Must contain at least one number';
    } else if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>+=\-_]').hasMatch(value)) {
      return 'Must contain at least one special symbol';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])').hasMatch(value)) {
      return 'Must contain both lowercase and uppercase letters';
    }
    return null;
  }
}
