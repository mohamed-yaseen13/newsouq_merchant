import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/api/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    debugPrint('error from api error handler ${error.toString()}');
    switch (error.toString()) {
      case '[firebase_auth/invalid-email] The email address is badly formatted.':
        return ApiErrorModel(message: 'Please Enter a valid Email');
      case '[firebase_auth/email-already-in-use] The email address is already in use by another account.':
        return ApiErrorModel(message: 'Email already in use try login');
      case '[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.':
        return ApiErrorModel(message: 'Email or Password is incorrect');
      default:
        return ApiErrorModel(message: 'Somthing went Wrong');
    }
  }
}
