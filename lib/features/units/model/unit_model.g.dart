// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitResponseModelImpl _$$UnitResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UnitResponseModelImpl(
      result: (json['result'] as List<dynamic>)
          .map((e) => Unit.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      message: json['message'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$$UnitResponseModelImplToJson(
        _$UnitResponseModelImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'count': instance.count,
      'message': instance.message,
      'status': instance.status,
    };

_$UnitImpl _$$UnitImplFromJson(Map<String, dynamic> json) => _$UnitImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$UnitImplToJson(_$UnitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'label': instance.label,
    };
