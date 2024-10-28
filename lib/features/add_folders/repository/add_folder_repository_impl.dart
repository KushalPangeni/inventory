import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart';
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
      int parentFolderName = 0,
      required List<int> listOfTagsId}) async {
    log('Images ==> $images');
    /*var image = await MultipartFile.fromFile(
      images[0].path,
      contentType: MediaType('image', 'jpg'),
      filename: images[0].path.split('/').last,
    );*/
    // final File file = File(images[0].path);

    // Read the file as bytes
    // final bytes = await images[0].readAsBytes();
    //
    // // Convert bytes to Base64 string
    // final base64String = base64Encode(bytes);
    FormData formData = FormData.fromMap({
      "name": folderName,
      // "image":image,
      "description": folderDescription,
      // "parent_folder_id": 2, // Uncomment if you want to include this
      "total_price": 0,
      "total_units": "50",
      "tag_ids[]": listOfTagsId, // Directly included; FormData handles lists automatically
    });
    var request = _client.editFiles(endPoint: Request.createUrl('api/folders/$folderId'), formData: formData);
    return await _client.handleNetworkCall(request);
  }

  @override
  EitherResponse getFolders() async {
    var request = _client.get(
      endPoint: Request.createUrl('api/folders'),
    );
    return await _client.handleNetworkCall(request, FolderModel.fromJson);
  }

  @override
  EitherResponse postFolders(String tag, List<File> images,
      {String folderName = '',
      String folderDescription = '',
      int parentFolderName = 0,
      required List<int> listOfTagsId}) async {
    log('Images ==> $images');
    /*var image = await MultipartFile.fromFile(
      images[0].path,
      contentType: MediaType('image', 'jpg'),
      filename: images[0].path.split('/').last,
    );*/
    // final File file = File(images[0].path);

    // Read the file as bytes
    // final bytes = await images[0].readAsBytes();
    //
    // // Convert bytes to Base64 string
    // final base64String = base64Encode(bytes);
    FormData formData = FormData.fromMap({
      "name": folderName,
      // "image":image,
      "description": folderDescription,
      // "parent_folder_id": 2, // Uncomment if you want to include this
      "total_price": 0,
      "total_units": "0",
      "tag_ids[]": listOfTagsId, // Directly included; FormData handles lists automatically
    });
    var request = _client.uploadFiles(endPoint: Request.createUrl('api/folders'), formData: formData);
    return await _client.handleNetworkCall(request);
  }
}
