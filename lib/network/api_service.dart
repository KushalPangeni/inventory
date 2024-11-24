import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inventory/network/request.dart';
import 'package:inventory/network/response_type_def.dart';
import 'package:toastification/toastification.dart';
import 'data_response.dart';
import 'exception.dart';

class DioClient {
  factory DioClient() {
    _instance ??= DioClient._internal();
    return _instance!;
  }

  DioClient._internal() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      // 60 seconds
      receiveTimeout: const Duration(seconds: 60),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json, // 60 seconds
    );
    _client = Dio(options);
    init();
    _client.options.requestEncoder = (string, request) => utf8.encode(string);
  }

  static const String userAgent = 'User-Agent';
  static const String contentType = 'Content-Type';
  static const String accept = 'Accept';

  static DioClient? _instance;
  late Dio _client;

  init() async {
    _client.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    // _client.interceptors.add(AuthInterceptor());
    _client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          handler.next(options);
        },
        onResponse: (r, handler) {
          handler.next(r);
        },
        onError: (error, handler) async {
          if (error.response == null) {
            if (error.type == DioExceptionType.connectionError) {
              handleApiResponse(Response(
                requestOptions: RequestOptions(),
                statusCode: 506,
                statusMessage: "No Internet Connection",
              ));
            } else {
              handleApiResponse(Response(
                requestOptions: RequestOptions(),
                statusCode: 500,
                statusMessage: "Internal Server Error",
              ));
            }
            handler.next(error);
          } else if (error.response?.statusCode == 500 || error.response?.statusCode == 502) {
            handler.reject(error);
          } else {
            handleApiResponse(error.response!, error.response!.requestOptions.path);
            handler.next(error);
          }
        },
      ),
    );
  }

  Future<Response?> get({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    Response response = await _client.get(endPoint,
        options: Options(
          headers: headers,
        ),
        data: data,
        queryParameters: queryParameters);
    return request(endPoint: endPoint, response: response);
  }

  Future<Response?> post({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    Response response = await _client.post(endPoint,
        options: Options(
          headers: Request.createHeader(),
        ),
        data: data,
        queryParameters: queryParameters);
    return request(endPoint: endPoint, response: response);
  }

  Future<Response?> uploadFiles({
    required String endPoint,
    Map<String, String>? headers,
    required FormData formData,
  }) async {
    Response response = await _client.post(endPoint,
        options: Options(
          headers: Request.createHeader(/*isFormData: true*/),
        ),
        data: formData);
    return request(endPoint: endPoint, response: response);
  }

  Future<Response?> editFiles({
    required String endPoint,
    Map<String, String>? headers,
    required FormData formData,
  }) async {
    Response response = await _client.put(endPoint,
        options: Options(
          headers: Request.createHeader(isFormData: true),
        ),
        data: formData);
    return request(endPoint: endPoint, response: response);
  }

  Future<Response?> put({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await _client.put(endPoint,
        options: Options(
          headers: Request.createHeader(),
        ),
        data: body,
        queryParameters: queryParameters);
    return request(endPoint: endPoint, response: response);
  }

  Future<Response?> delete({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    Response response = await _client.delete(endPoint,
        data: data,
        options: Options(
          headers: Request.createHeader(),
        ),
        queryParameters: queryParameters);
    return request(endPoint: endPoint, response: response);
  }

  Future<Response?> request({required String endPoint, required Response response}) async {
    try {
      handleApiResponse(response, endPoint);
      return response;
    } on DioException catch (e) {
      debugPrint(e.response.toString());
      handleApiResponse(e.response!, endPoint);
      return e.response;
    }
  }

  EitherResponse handleNetworkCall(request, [dynamic fromJsonModel]) async {
    try {
      final response = await request;
      if (response.statusCode >= 200 && response.statusCode < 300) {
        log('Response ===> $response');
        try {
          if (fromJsonModel != null) {
            if (response.data is List) {
              return Right(DataResponse.success((response.data as List).map((e) => fromJsonModel(e)).toList()));
            } else {
              return Right(DataResponse.success(fromJsonModel(response.data)));
            }
          } else {
            if (response.data == '') {
              return Right(DataResponse.success(''));
            } else {
              return Right(DataResponse.success(''));
            }
          }
        } catch (e) {
          debugPrint("Json Parsing Error ${e.toString()}");
          return Left(DataResponse.error("Internal Server Error!"));
        }
      } else {
        return Left(DataResponse.error("Error!"));
      }
    } catch (e) {
      if (e is DioException) {
        log('Message Exception 5 ==> ${e.message}');
        if (e.type == DioExceptionType.connectionError) {
          return Left(DataResponse.error('No Internet Connection'));
        } else {
          return Left(DataResponse.error('Error'));
        }
      }
      return Left(DataResponse.error("Error!"));
    }
  }
}

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
