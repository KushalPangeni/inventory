

import 'package:dio/dio.dart';
import 'package:inventory/global/bottom_modal_sheets/error_bottom_sheet.dart';
import 'package:inventory/main.dart';

import 'api_url.dart';

Future<String> handleApiResponse(Response<dynamic> response, [String? endPoint]) async {
  switch (response.statusCode) {
    case 401:
      if(endPoint == '${ApiUrl.baseUrl}}'){
        showErrorBottomSheet(
          navigatorKey.currentContext!,
          error: "Login Failed",
          description: "Incorrect username or password. Please check your credentials and try again.",
        );
      }else{
        showErrorBottomSheet(
          navigatorKey.currentContext!,
          error: "UnAuthorized",
          description: "Your session has expired. Please try again.",
        );
        await Future.delayed(const Duration(seconds: 1));
        // await StorageManager().clearAll();
        // Routes().navigateToLoginScreen(navigatorKey.currentContext!);
      }

      return 'Credentials mismatched';
    case 400:
      return 'Credentials mismatched';
    case 403:
      return 'Unauthorized request';

    case 404:
      return 'Not found';

    case 409:
      return 'Error due to a conflict';

    case 408:
      return 'Connection request timeout';
    case 500:
      showErrorBottomSheet(
        navigatorKey.currentContext!,
        error: "Internal Server Error",
        description: "Something went wrong. Please try again.",
      );
      return 'Internal Server Error';

    case 502:
      return 'Unreachable';

    case 503:
      return 'Service unavailable';
    case 506:
      showErrorBottomSheet(
        navigatorKey.currentContext!,
        error: "No Internet Connection",
        description: "Please check your internet connection and try again.",
      );
      return 'Service unavailable';

    default:
      return 'Received invalid status code: ${response.statusCode}';
  }
}
