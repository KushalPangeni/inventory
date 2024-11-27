import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response_model.freezed.dart';
part 'search_response_model.g.dart';

@freezed
class SearchResponse with _$SearchResponse {
  factory SearchResponse({
    required Result result,
    required int count,
    required String message,
    required int status,
  }) = _SearchResponse;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}

@freezed
class Result with _$Result {
  factory Result({
    @Default([]) List<Folder>? folders,
    @Default([]) List<Item>? items,
    @JsonKey(name: 'total_counts') required TotalCounts totalCounts,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Folder with _$Folder {
  factory Folder({
    required int id,
    @Default('') String? name,
    @Default('') String? description,
    @Default('') String? type,
    Folder? parent, // Recursive relationship, can be null
  }) = _Folder;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);
}

@freezed
class Item with _$Item {
  factory Item({
    required int id,
    @Default('') String name,
    @Default('') String? description, // Nullable description
    @Default('') String type,
     Folder? folder, // Folder association
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class TotalCounts with _$TotalCounts {
  factory TotalCounts({
    @Default(0) int? folders,
    @Default(0) int? items,
    @Default(0) int? total,
  }) = _TotalCounts;

  factory TotalCounts.fromJson(Map<String, dynamic> json) =>
      _$TotalCountsFromJson(json);
}
