// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemModelResponseImpl _$$ItemModelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemModelResponseImpl(
      result: (json['result'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      message: json['message'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$$ItemModelResponseImplToJson(
        _$ItemModelResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'count': instance.count,
      'message': instance.message,
      'status': instance.status,
    };

_$FolderModelImpl _$$FolderModelImplFromJson(Map<String, dynamic> json) =>
    _$FolderModelImpl(
      result: (json['result'] as List<dynamic>)
          .map((e) => Folder.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      message: json['message'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$$FolderModelImplToJson(_$FolderModelImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'count': instance.count,
      'message': instance.message,
      'status': instance.status,
    };

_$FolderImpl _$$FolderImplFromJson(Map<String, dynamic> json) => _$FolderImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      parentFolderId: (json['parent_folder_id'] as num?)?.toInt(),
      totalPrice: json['total_price'],
      totalUnits: json['total_units'],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      subFolders: (json['subFolders'] as List<dynamic>?)
              ?.map((e) => Folder.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FolderImplToJson(_$FolderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'parent_folder_id': instance.parentFolderId,
      'total_price': instance.totalPrice,
      'total_units': instance.totalUnits,
      'images': instance.images,
      'subFolders': instance.subFolders,
      'tags': instance.tags,
      'items': instance.items,
    };

_$ImageImpl _$$ImageImplFromJson(Map<String, dynamic> json) => _$ImageImpl(
      id: (json['id'] as num).toInt(),
      fileId: (json['file_id'] as num?)?.toInt(),
      name: json['name'] as String,
      tag: json['tag'] as String,
      metadata: json['metadata'] as String?,
      type: json['type'] as String,
      path: json['path'] as String,
      tableName: json['table_name'] as String?,
      model: json['model'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$$ImageImplToJson(_$ImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_id': instance.fileId,
      'name': instance.name,
      'tag': instance.tag,
      'metadata': instance.metadata,
      'type': instance.type,
      'path': instance.path,
      'table_name': instance.tableName,
      'model': instance.model,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      fabricNumber: json['fabric_number'] as String? ?? '',
      shopName: json['shop_name'] as String? ?? '',
      width: (json['width'] as num?)?.toInt() ?? 0,
      gsm: json['gsm'] as String? ?? '',
      kgToMeterRatio: (json['kg_to_meter_ratio'] as num?)?.toDouble(),
      average: (json['average'] as num?)?.toDouble() ?? 0,
      shortage: (json['shortage'] as num?)?.toDouble() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      unitId: (json['unit_id'] as num?)?.toInt() ?? 1,
      accessoriesNotes: json['accessories_notes'] as String? ?? '',
      folder_id: (json['folder_id'] as num?)?.toInt() ?? 0,
      sku: json['sku'] as String? ?? '',
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fabric_number': instance.fabricNumber,
      'shop_name': instance.shopName,
      'width': instance.width,
      'gsm': instance.gsm,
      'kg_to_meter_ratio': instance.kgToMeterRatio,
      'average': instance.average,
      'shortage': instance.shortage,
      'quantity': instance.quantity,
      'unit_id': instance.unitId,
      'accessories_notes': instance.accessoriesNotes,
      'folder_id': instance.folder_id,
      'sku': instance.sku,
    };
