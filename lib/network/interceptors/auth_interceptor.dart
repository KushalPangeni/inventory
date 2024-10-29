/*
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String token = await _getBasicAuthToken();
    if (token.isNotEmpty) {
      options.headers.addAll({
        'Authorization': 'Basic $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });
    }
    return handler.next(options);
  }

 */
/* Future<String> _getBasicAuthToken() async {
    final basicAuthToken = await ReadStorageKeys().readAuthToken();
    if (basicAuthToken.isNotEmpty) {
      return basicAuthToken;
    }
    return '';
  }*//*

}
*/
