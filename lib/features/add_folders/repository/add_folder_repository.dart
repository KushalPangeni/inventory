import 'dart:io';

import 'package:dio/dio.dart';
import 'package:inventory/network/response_type_def.dart';

abstract class AddFolderRepository {
  EitherResponse postFolders(String tag, List<MultipartFile> images,
      {String folderName = '', String folderDescription = '', int? parentFolderId, required List<int> listOfTagsId});

  EitherResponse editFolders(String tag, List<File> images,
      {required int folderId,
      String folderName = '',
      String folderDescription = '',
      required List<int> listOfTagsId});

  EitherResponse getFolders({int? folderId});

  EitherResponse deleteFolders(int tagId);
  EitherResponse getStats();


  EitherResponse moveFolder({required int folderId, required int destinationFolderId, required String reasonToMove,required String note});
}
