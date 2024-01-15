import 'package:get/get.dart';
import 'package:print_color/print_color.dart';

dynamic errorHandle(dynamic responseData) {
  Map<String, String> validationErrors = {};

  if (responseData is Map<String, dynamic>) {
    // Handling validation errors
    if (responseData.containsKey('errors')) {
      Map<String, dynamic> errors = responseData['errors'];

      errors.forEach((key, value) {
        if (value is List && value.isNotEmpty) {
          // Check if the error message contains 'is required'
          String firstErrorMessage = value.first;
          if (firstErrorMessage.contains('is required')) {
            validationErrors[key] = firstErrorMessage;
          }
        }
      });
    }

    // Return validation errors if any were found
    if (validationErrors.isNotEmpty) {
      return validationErrors;
    }

    // Handling general error message
    if (responseData.containsKey('message')) {
      if (responseData['message']
          .toString()
          .contains('The provided credentials are incorrect.')) {
        Get.snackbar(
            "Some thing went wrong!", 'Email or Password are incurect');

        return;
      }
      Get.snackbar("Some thing went wrong!", responseData['message']);
      return;
    }
  }

  // Default error message for unknown cases
  Get.snackbar("Some thing went wrong!", 'An unknown error occurred');
}
