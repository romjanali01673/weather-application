import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_application/core/util/constats/all_enum.dart';

class CBase extends GetxController {
  ViewState viewState = ViewState.initial;
  Object? _exception;

  Object? get exception => _exception;

  void setException({
    required Object? error,
    required StackTrace? stackTrace,
    bool showSnackbar = true,
    bool setExceptionOnly = false,
  }) {
    debugPrint("❌ Error: $error");
    _exception = error;

    if (!setExceptionOnly) {
      viewState = ViewState.error;
      update();
    }

    final message = _formatException(error);

    if (showSnackbar) {
      Get.snackbar("title", message);
    }

  }

  /// Dynamically format the error message
  String _formatException(Object? error) {
    if (error is DioException) {
      final response = error.response;
      final data = response?.data;

      debugPrint("============== Dio Error ==========");
      debugPrint("Type: ${error.type}");
      debugPrint("Message: ${error.message}");
      debugPrint("Response: $data");
      debugPrint("============== End ==========");


      switch (error.type) {
        case DioExceptionType.cancel:
          return "Request was cancelled.";
        case DioExceptionType.connectionTimeout:
          return "Connection timeout. Please check your internet.";
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return "The server took too long to respond.";
        case DioExceptionType.connectionError:
          return "No internet connection. Please try again.";
        case DioExceptionType.badCertificate:
          return "Security certificate error. Please contact support.";
        case DioExceptionType.badResponse:
          return _extractErrorMessage(data);
        default:
          return error.message ?? "An unexpected error occurred.";
      }
    }

    // For other types of exceptions
    return error?.toString() ?? "An unknown error occurred.";
  }

  /// Extracts readable error message from Dio response data
  String _extractErrorMessage(dynamic data) {
    try {
      if (data is Map<String, dynamic>) {
      debugPrint("hello romjan ali $data");

        return data['message'] ??
            ((data['error'] is Map)? data['error']["message"] : data['error'])?? // weather error message extract 
            data['error']??
            data['Message'] ??
            data['error_description'] ??
            "Unexpected error occurred.";
      } else if (data is String) {
        return data;
      }
    } catch (e) {
      // No-op
      debugPrint("romjan$e");
    }
    return "An unexpected server error occurred.";
  }
}
