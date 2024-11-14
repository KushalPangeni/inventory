// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ColorResponseModelImpl _$$ColorResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ColorResponseModelImpl(
      result: (json['result'] as List<dynamic>)
          .map((e) => Color.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      message: json['message'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$$ColorResponseModelImplToJson(
        _$ColorResponseModelImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'count': instance.count,
      'message': instance.message,
      'status': instance.status,
    };

_$ColorImpl _$$ColorImplFromJson(Map<String, dynamic> json) => _$ColorImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$$ColorImplToJson(_$ColorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
