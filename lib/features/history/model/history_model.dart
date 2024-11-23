import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_model.freezed.dart';

part 'history_model.g.dart';

@freezed
class HistoryResponse with _$HistoryResponse {
  const factory HistoryResponse({
    required List<HistoryModel> result,
    required int count,
    required String message,
    required int status,
  }) = _HistoryResponse;

  factory HistoryResponse.fromJson(Map<String, dynamic> json) => _$HistoryResponseFromJson(json);
}

@freezed
class HistoryModel with _$HistoryModel {
  const factory HistoryModel({
    @JsonKey(name: 'item_id') required int itemId,
    @JsonKey(name: 'item_type') required String itemType,
    @Default(0) int? quantity,
    required DateTime date,
    User? user,
    @JsonKey(name: 'source_folder') required Folder sourceFolder,
    @JsonKey(name: 'destination_folder') required Folder destinationFolder,
    @Default('') String? message,
    required String reason,
    @Default('') String? action,
    @Default('') String? note,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => _$HistoryModelFromJson(json);
}

@freezed
class Folder with _$Folder {
  const factory Folder({
    @Default('') String? name,
    @Default(0) int? id,
  }) = _Folder;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @Default('') String? name,
    @Default('') String? email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
