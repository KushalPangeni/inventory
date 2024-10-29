import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_model.freezed.dart';
part 'unit_model.g.dart';

@freezed
class UnitResponseModel with _$UnitResponseModel {
  const factory UnitResponseModel({
    required List<Unit> result,
    required int count,
    required String message,
    required int status,
  }) = _UnitResponseModel;

  factory UnitResponseModel.fromJson(Map<String, dynamic> json) => _$UnitResponseModelFromJson(json);
}

@freezed
class Unit with _$Unit {
  const factory Unit({
    required int id,
    required String name,
    required String slug,
    required String label,
  }) = _Unit;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
}
