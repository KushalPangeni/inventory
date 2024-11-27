// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryResponseImpl _$$HistoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoryResponseImpl(
      result: (json['result'] as List<dynamic>)
          .map((e) => HistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      message: json['message'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$$HistoryResponseImplToJson(
        _$HistoryResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'count': instance.count,
      'message': instance.message,
      'status': instance.status,
    };

_$HistoryModelImpl _$$HistoryModelImplFromJson(Map<String, dynamic> json) =>
    _$HistoryModelImpl(
      itemId: (json['item_id'] as num).toInt(),
      itemType: json['item_type'] as String,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      date: DateTime.parse(json['date'] as String),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      sourceFolder:
          Folder.fromJson(json['source_folder'] as Map<String, dynamic>),
      destinationFolder:
          Folder.fromJson(json['destination_folder'] as Map<String, dynamic>),
      message: json['message'] as String? ?? '',
      reason: json['reason'] as String,
      action: json['action'] as String? ?? '',
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$$HistoryModelImplToJson(_$HistoryModelImpl instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_type': instance.itemType,
      'quantity': instance.quantity,
      'date': instance.date.toIso8601String(),
      'user': instance.user,
      'source_folder': instance.sourceFolder,
      'destination_folder': instance.destinationFolder,
      'message': instance.message,
      'reason': instance.reason,
      'action': instance.action,
      'note': instance.note,
    };

_$FolderImpl _$$FolderImplFromJson(Map<String, dynamic> json) => _$FolderImpl(
      name: json['name'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FolderImplToJson(_$FolderImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };
