import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_model.freezed.dart';
part 'color_model.g.dart';

@freezed
class ColorResponseModel with _$ColorResponseModel {
  const factory ColorResponseModel({
    required List<Color> result,
    required int count,
    required String message,
    required int status,
  }) = _ColorResponseModel;

  factory ColorResponseModel.fromJson(Map<String, dynamic> json) => _$ColorResponseModelFromJson(json);
}

@freezed
class Color with _$Color {
  const factory Color({
    required int id,
    required String name,
    required String slug
  }) = _Color;

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
}
