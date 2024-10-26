// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralResponseImpl _$$GeneralResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GeneralResponseImpl(
      (json['status'] as num).toInt(),
      json['message'] as String,
    );

Map<String, dynamic> _$$GeneralResponseImplToJson(
        _$GeneralResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
