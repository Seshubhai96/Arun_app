class Appvalidator {
  static String? emailvalidator(String? val) {
    final RegExp emailRegex = RegExp(
      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    if (val!.isEmpty) {
      return "Email can't be empty";
    } else if (!emailRegex.hasMatch(val)) {
      return "Please enter valid email";
    }
    return null;
  }

  static String? namevalidator(String? name) {
    if (name!.isEmpty) {
      return "Name can't be empty";
    }
    return null;
  }

  static String? passwordvalidate(String? password) {
    final RegExp emailRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$',
      caseSensitive: false,
      multiLine: false,
    );
    if (password!.isEmpty) {
      return "";
    } else if (!emailRegex.hasMatch(password)) {
      return "Password should be more than 6 digit incude oneuppercase,lowercase,symbol,numbers";
    }
    return null;
  }
}
