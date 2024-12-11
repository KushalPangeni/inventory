import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_response_model.freezed.dart';
part 'stats_response_model.g.dart';

@freezed
class StatsResponseModel with _$StatsResponseModel {
  const factory StatsResponseModel({
    required Stats result,
    required String message,
    required int status,
  }) = _StatsResponseModel;

  factory StatsResponseModel.fromJson(Map<String, dynamic> json) => _$StatsResponseModelFromJson(json);
}

@freezed
class Stats with _$Stats {
  const factory Stats({
    @Default(0) int? folder,
    @Default(0) int? item,
    @Default(0) int? tag,
    @Default(0) int? color,
    @Default(0) int? unit,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}