import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_model.freezed.dart';
part 'color_model.g.dart';

@freezed
class ColorResponseModel with _$ColorResponseModel {
  const factory ColorResponseModel({
    required List<ColorModel> result,
    required int count,
    required String message,
    required int status,
  }) = _ColorResponseModel;

  factory ColorResponseModel.fromJson(Map<String, dynamic> json) => _$ColorResponseModelFromJson(json);
}

@freezed
class ColorModel with _$ColorModel {
  const factory ColorModel({
    required int id,
    required String name,
    required String slug
  }) = _ColorModel;

  factory ColorModel.fromJson(Map<String, dynamic> json) => _$ColorModelFromJson(json);
}
