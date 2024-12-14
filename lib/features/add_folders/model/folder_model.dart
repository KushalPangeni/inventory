import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/features/add_items/model/color_model.dart';
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
class ItemOnlyModel with _$ItemOnlyModel {
  const factory ItemOnlyModel({
    required Item result,
    required String message,
    required int status,
  }) = _ItemOnlyModel;

  factory ItemOnlyModel.fromJson(Map<String, dynamic> json) => _$ItemOnlyModelFromJson(json);
}

@freezed
class FolderOnlyModel with _$FolderOnlyModel {
  const factory FolderOnlyModel({
    required Folder result,
    required String message,
    required int status,
  }) = _FolderOnlyModel;

  factory FolderOnlyModel.fromJson(Map<String, dynamic> json) => _$FolderOnlyModelFromJson(json);
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
  const factory Item(
      {required int id,
        required String name,
        @JsonKey(name: 'fabric_number') @Default('') String? fabricNumber,
        @JsonKey(name: 'shop_name') @Default('') String? shopName,
        @JsonKey(name: 'party_name') @Default('') String? partyName,
        @Default('') String? width, // made nullable
        @Default('') String? gsm, // made nullable
        @JsonKey(name: 'kg_to_meter_ratio') String? kgToMeterRatio,
        @Default('') String? average, // made nullable
        @Default('') String? shortage, // made nullable
        @Default(0) int? quantity, // made nullable
        @JsonKey(name: 'unit_id') @Default(0) int? unitId,
        @JsonKey(name: 'avg_unit') @Default('') String? averageUnit,
        @JsonKey(name: 'order_quantity') @Default('') String? orderQuantity,
        @JsonKey(name: 'minimum_quantity') @Default('') String? minimumQuantity,
        @JsonKey(name: 'accessories_notes') @Default('') String? accessoriesNotes,
        @Default([]) List<Image>? images,
        @Default([]) List<ColorModel>? colors,
        @JsonKey(name: 'folder_id') @Default(0) int? folderId,
        @Default('') String? sku // made nullable
      }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class ColorModel with _$ColorModel {
  const factory ColorModel({
    @JsonKey(name: 'color_id') int? colorId,
    required int quantitys,
    required int rolls,
    @Default(0) int? number,
  }) = _ColorModel;

  factory ColorModel.fromJson(Map<String, dynamic> json) => _$ColorModelFromJson(json);
}
