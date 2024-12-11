import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart';
import 'package:inventory/features/add_folders/model/stats_response_model.dart';
import 'package:inventory/features/add_folders/repository/add_folder_repository.dart';
import 'package:inventory/network/api_service.dart';
import 'package:inventory/network/request.dart';
import 'package:inventory/network/response_type_def.dart';

class AddFolderRepositoryImpl implements AddFolderRepository {
  final DioClient _client;

  AddFolderRepositoryImpl(this._client);

  @override
  EitherResponse deleteFolders(int folderId) async {
    var request = _client.delete(
      endPoint: Request.createUrl('api/folders/$folderId'),
    );
    return await _client.handleNetworkCall(request);
  }

  @override
  EitherResponse editFolders(String tag, List<File> images,
      {required int folderId,
      String folderName = '',
      String folderDescription = '',
      required List<int> listOfTagsId}) async {
    FormData formData = FormData.fromMap({
      "name": folderName,
      "images[]": images,
      "description": folderDescription,
      "total_price": 0,
      "total_units": "0",
      "tag_ids[]": listOfTagsId,
      "_method": "PUT"
    });
    var request = _client.uploadFiles(endPoint: Request.createUrl('api/folders/$folderId'), formData: formData);
    return await _client.handleNetworkCall(request);
  }

  @override
  EitherResponse getFolders({int? folderId}) async {
    if (folderId != null) {
      var request = _client.get(
        endPoint: Request.createUrl('api/folders/$folderId'),
      );
      return await _client.handleNetworkCall(request, FolderOnlyModel.fromJson);
    } else {
      var request = _client.get(
        endPoint: Request.createUrl('api/folders/0'),
      );
      return await _client.handleNetworkCall(request, FolderModel.fromJson);
    }
  }

  @override
  EitherResponse postFolders(String tag, List<MultipartFile> images,
      {String folderName = '',
      String folderDescription = '',
      int? parentFolderId,
      required List<int> listOfTagsId}) async {
    FormData formData;
    if (parentFolderId == null) {
      formData = FormData.fromMap({
        "name": folderName,
        "images[]": images,
        "description": folderDescription,
        "total_price": 0,
        "total_units": "0",
        "tag_ids[]": listOfTagsId, // Directly included; FormData handles lists automatically
      });
    } else {
      formData = FormData.fromMap({
        "name": folderName,
        "image[]": images,
        "description": folderDescription,
        "parent_folder_id": parentFolderId,
        "total_price": 0,
        "total_units": "0",
        "tag_ids[]": listOfTagsId, // Directly included; FormData handles lists automatically
      });
    }
    var request = _client.uploadFiles(endPoint: Request.createUrl('api/folders'), formData: formData);
    return await _client.handleNetworkCall(request);
  }

  @override
  EitherResponse moveFolder(
      {required int folderId,
      required int destinationFolderId,
      required String reasonToMove,
      required String note}) async {
    var request = _client.post(endPoint: Request.createUrl('api/folder/move'), data: {
      "folder_id": folderId,
      "destination_folder_id": destinationFolderId,
      "reason": reasonToMove,
      "note": note
    });
    return await _client.handleNetworkCall(request);
  }

  @override
  EitherResponse getStats() async {
    var request = _client.get(endPoint: Request.createUrl('api/stat'));
    return await _client.handleNetworkCall(request, StatsResponseModel.fromJson);
  }
}
