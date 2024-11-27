

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inventory/global/bottom_modal_sheets/error_bottom_sheet.dart';
import 'package:inventory/main.dart';
import 'package:toastification/toastification.dart';

import 'api_url.dart';

Future<String> handleApiResponse(Response<dynamic> response, [String? endPoint]) async {
  switch (response.statusCode) {
    case 401:
      if(endPoint == '${ApiUrl.baseUrl}}'){
        showToast(navigatorKey.currentContext!, 'Error','Incorrect username or password. Please check your credentials and try again',ToastificationType.success);

        showErrorBottomSheet(
          navigatorKey.currentContext!,
          error: "Login Failed",
          description: "Incorrect username or password. Please check your credentials and try again.",
        );
      }else{
        log('Message Exception ==> UnAuthorized');
        showToast(navigatorKey.currentContext!, 'Error','UnAuthorized',ToastificationType.success);

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
      log('Message Exception ==> Credentials mismatched');

      return 'Credentials mismatched';
    case 403:
      log('Message Exception ==> Unauthorized request');

      return 'Unauthorized request';

    case 404:
      log('Message Exception ==> Not found');

      return 'Not found';

    case 409:
      log('Message Exception ==> Error due to a conflict');

      return 'Error due to a conflict';

    case 408:
      log('Message Exception ==> Connection request timeout');

      return 'Connection request timeout';
    case 500:
      log('Message Exception ==> Internal Server Error');

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
      // log('Message Exception ==> No Internet Connection');

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
void showToast(BuildContext context, String title, String description,
    ToastificationType type) {
  toastification.show(
    context: context,
    type: type,
    title: Text(title),
    description: Text(description),
    primaryColor: Colors.white,
    autoCloseDuration: const Duration(seconds: 3),
    progressBarTheme: ProgressIndicatorThemeData(
      color: type == ToastificationType.success
          ? Colors.green
          : type == ToastificationType.info
          ? Colors.blue
          : type == ToastificationType.warning
          ? Colors.orange
          : Colors.red,
    ),
    showProgressBar: true,
    backgroundColor: type == ToastificationType.success
        ? Colors.green
        : type == ToastificationType.info
        ? Colors.blue
        : type == ToastificationType.warning
        ? Colors.orange
        : Colors.red,
    foregroundColor: Colors.white,
  );
}
