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
      partyName: json['party_name'] as String? ?? '',
      width: json['width'] as String? ?? '',
      gsm: json['gsm'] as String? ?? '',
      kgToMeterRatio: json['kg_to_meter_ratio'] as String?,
      average: json['average'] as String? ?? '',
      shortage: json['shortage'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      unitId: (json['unit_id'] as num?)?.toInt() ?? 0,
      averageUnit: json['avg_unit'] as String? ?? '',
      orderQuantity: json['order_quantity'] as String? ?? '0',
      minimumQuantity: (json['minimum_quantity'] as num?)?.toInt() ?? 0,
      accessoriesNotes: json['accessories_notes'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      colors: (json['colors'] as List<dynamic>?)
              ?.map((e) => ColorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      folderId: (json['folder_id'] as num?)?.toInt() ?? 0,
      sku: json['sku'] as String? ?? '',
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fabric_number': instance.fabricNumber,
      'shop_name': instance.shopName,
      'party_name': instance.partyName,
      'width': instance.width,
      'gsm': instance.gsm,
      'kg_to_meter_ratio': instance.kgToMeterRatio,
      'average': instance.average,
      'shortage': instance.shortage,
      'quantity': instance.quantity,
      'unit_id': instance.unitId,
      'avg_unit': instance.averageUnit,
      'order_quantity': instance.orderQuantity,
      'minimum_quantity': instance.minimumQuantity,
      'accessories_notes': instance.accessoriesNotes,
      'images': instance.images,
      'colors': instance.colors,
      'folder_id': instance.folderId,
      'sku': instance.sku,
    };

_$ColorModelImpl _$$ColorModelImplFromJson(Map<String, dynamic> json) =>
    _$ColorModelImpl(
      colorId: (json['color_id'] as num?)?.toInt(),
      quantitys: (json['quantitys'] as num).toInt(),
      rolls: (json['rolls'] as num).toInt(),
      number: (json['number'] as num).toInt(),
    );

Map<String, dynamic> _$$ColorModelImplToJson(_$ColorModelImpl instance) =>
    <String, dynamic>{
      'color_id': instance.colorId,
      'quantitys': instance.quantitys,
      'rolls': instance.rolls,
      'number': instance.number,
    };
