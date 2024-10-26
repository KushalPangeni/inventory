

import 'api_request_state/api_request_state.dart';

class DataResponse<T> {
  ApiRequestState status;
  T? data;
  String? message;
  String? modelType;
  int responseStatus;

  DataResponse.loading(this.message)
      : status = const ApiRequestState.loading(),
        responseStatus = 0;

  DataResponse.success(this.data, {this.modelType})
      : status = const ApiRequestState.loading(),
        responseStatus = 0;

  DataResponse.error(this.message, [int statusCode = 0])
      : status = const ApiRequestState.error(),
        responseStatus = statusCode;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
