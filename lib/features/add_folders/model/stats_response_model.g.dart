// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatsResponseModelImpl _$$StatsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StatsResponseModelImpl(
      result: Stats.fromJson(json['result'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$$StatsResponseModelImplToJson(
        _$StatsResponseModelImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'status': instance.status,
    };

_$StatsImpl _$$StatsImplFromJson(Map<String, dynamic> json) => _$StatsImpl(
      folder: (json['folder'] as num?)?.toInt() ?? 0,
      item: (json['item'] as num?)?.toInt() ?? 0,
      tag: (json['tag'] as num?)?.toInt() ?? 0,
      color: (json['color'] as num?)?.toInt() ?? 0,
      unit: (json['unit'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$StatsImplToJson(_$StatsImpl instance) =>
    <String, dynamic>{
      'folder': instance.folder,
      'item': instance.item,
      'tag': instance.tag,
      'color': instance.color,
      'unit': instance.unit,
    };
