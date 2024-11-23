import 'api_url.dart';

abstract class Request {
  static const _authentication = 'Authorization';

  static Map<String, String> createHeader({isFormData = false}) {
    final authHeader = <String, String>{
      "ngrok-skip-browser-warning": "69420",
    };
    authHeader['Accept'] = 'application/json';
    authHeader['Content-Type'] = 'application/json';
    return authHeader;
  }

  static String getBaseUrl() {
    String host = ApiUrl.baseUrl;
    return host;
  }

  static String createUrl(String path) {
    String host = getBaseUrl();
    return '$host/$path';
  }

  static String createUrlWithId(String path, String id) {
    String host = getBaseUrl();
    return '$host/$path/$id';
  }

  static String createGetUrl(String path, Map<String, dynamic> parameters) {
    final uri = Uri.parse(createUrl(path));
    final ret = uri.replace(queryParameters: parameters);
    return ret.toString();
  }

  static String createGetUrlWithId(
      String path, String id, Map<String, dynamic> parameters) {
    final uri = Uri.parse(createUrlWithId(path, id));
    final ret = uri.replace(queryParameters: parameters);
    return ret.toString();
  }

  static Map<String, String> createAuthHeader(String token,
      {bool isFormData = false}) {
    final authHeader = <String, String>{};

    if (token.isNotEmpty) {
      authHeader[_authentication] = 'Basic $token';
      authHeader['Accept'] = 'application/json';
      authHeader['Content-Type'] =
          isFormData ? 'multipart/form-data' : 'application/json';
    }
    return authHeader;
  }

  static String encodeQueryParameters(Map<String, dynamic> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}')
        .join('&');
  }

  static addParameter(Map<String, dynamic> queryParams, String key, String? value) {
    if (value != null && value.isNotEmpty) {
      queryParams[key] = value;
    }
  }
}
