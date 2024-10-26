import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_response.freezed.dart';

part 'general_response.g.dart';

@freezed
abstract class GeneralResponse with _$GeneralResponse {
  const factory GeneralResponse(int status, String message) = _GeneralResponse;

  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralResponseFromJson(json);
}
