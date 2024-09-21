import 'package:ainalsaqer/app/translations/lang_keys.dart';
import 'package:get/get.dart';

class FormValidator {
  // General required field validation
  static String? validateRequired(String? value,
      {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName ${LangKeys.isRequired.tr}';
    }
    return null;
  }

  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return LangKeys.emailIsRequired.tr;
    }
    // Simple regex to check if email format is valid
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return LangKeys.emailNotValid.tr;
    }
    return null;
  }

  // Password validation (minimum length 6 characters)
  static String? validatePassword(String? value, {int minLength = 8}) {
    if (value == null || value.isEmpty) {
      return LangKeys.passwordIsRequired.tr;
    }
    if (value.length < minLength) {
      return '${LangKeys.passwordMustBeAtLeast.tr} $minLength ${LangKeys.charactersLong.tr}';
    }
    return null;
  }

  // Phone number validation (10+ digits)
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    // Basic phone number validation (only digits, at least 10 digits)
    if (!RegExp(r'^[0-9]{10,}$').hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null; // Valid phone number
  }

  // Number validation (for numeric fields)
  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (double.tryParse(value) == null) {
      return 'Enter a valid number';
    }
    return null; // Valid number
  }

  // Custom regex validation (for more specific patterns)
  static String? validateWithRegex(String? value, String pattern,
      {String errorMessage = 'Invalid format'}) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(pattern).hasMatch(value)) {
      return errorMessage;
    }
    return null; // Valid pattern
  }
}
