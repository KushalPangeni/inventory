import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inventory/global/bottom_modal_sheets/error_bottom_sheet.dart';
import 'package:inventory/main.dart';
import 'package:toastification/toastification.dart';

import 'api_url.dart';

Future<String> handleApiResponse(Response<dynamic> response,
    [String? endPoint]) async {
  switch (response.statusCode) {
    case 401:
      if (endPoint == 'https://sorty.margintopsolutions.com/api/login') {
        showToast(
            navigatorKey.currentContext!,
            'Error',
            'Incorrect username or password. Please try again',
            ToastificationType.error);
      } else {
        showToast(navigatorKey.currentContext!, 'Error', 'UnAuthorized',
            ToastificationType.error);

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
    case 422:
      showToast(
          navigatorKey.currentContext!,
          'Error',
          'Incorrect username or password. Please try again',
          ToastificationType.error);

      return 'Connection request timeout';
    case 500:
      log('Message Exception ==> Internal Server Error');
      showToast(navigatorKey.currentContext!, 'Error', 'Internal Server Error',
          ToastificationType.error);
      // showErrorBottomSheet(
      //   navigatorKey.currentContext!,
      //   error: "Internal Server Error",
      //   description: "Something went wrong. Please try again.",
      // );
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
    description: FittedBox(child: Text(description, maxLines: 2)),
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
