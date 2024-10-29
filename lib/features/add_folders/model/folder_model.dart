import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/features/tags/model/tag_model.dart';

part 'folder_model.freezed.dart';
part 'folder_model.g.dart';

@freezed
class ItemModelResponse with _$ItemModelResponse {
  const factory ItemModelResponse({
    required List<Item> result,
    required int count,
    required String message,
    required int status,
  }) = _ItemModelResponse;

  factory ItemModelResponse.fromJson(Map<String, dynamic> json) => _$ItemModelResponseFromJson(json);
}

@freezed
class FolderModel with _$FolderModel {
  const factory FolderModel({
    required List<Folder> result,
    required int count,
    required String message,
    required int status,
  }) = _FolderModel;

  factory FolderModel.fromJson(Map<String, dynamic> json) => _$FolderModelFromJson(json);
}

@freezed
class Folder with _$Folder {
  const factory Folder({
    required int id,
    required String name,
    required String description,
    @JsonKey(name: 'parent_folder_id') int? parentFolderId,
    @JsonKey(name: 'total_price') dynamic totalPrice, // to handle both int and double types
    @JsonKey(name: 'total_units') dynamic totalUnits, // made nullable
    @Default([]) List<Image> images, // defaults to an empty list if null
    @Default([]) List<Folder> subFolders, // defaults to an empty list if null
    @Default([]) List<Tag> tags, // defaults to an empty list if null
    @Default([]) List<Item> items, // defaults to an empty list if null
  }) = _Folder;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    required int id,
    @JsonKey(name: 'file_id') int? fileId,
    required String name,
    required String tag,
    String? metadata, // made nullable
    required String type,
    required String path,
    @JsonKey(name: 'table_name') String? tableName,
    String? model, // made nullable
    String? description, // made nullable
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}


@freezed
class Item with _$Item {
  const factory Item({
    required int id,
    required String name,
    @JsonKey(name: 'fabric_number') @Default('') String? fabricNumber,
    @JsonKey(name: 'shop_name') @Default('') String? shopName,
    @Default(0) int? width, // made nullable
    @Default('') String? gsm, // made nullable
    @JsonKey(name: 'kg_to_meter_ratio') double? kgToMeterRatio,
    @Default(0) double? average, // made nullable
    @Default(0) double? shortage, // made nullable
    @Default(0) int? quantity, // made nullable
    @JsonKey(name: 'unit_id') @Default(1) int? unitId,
    @JsonKey(name: 'accessories_notes') @Default('') String? accessoriesNotes,
    @Default(0) int? folder_id,
    @Default('') String? sku// made nullable
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}