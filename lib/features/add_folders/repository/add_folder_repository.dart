import 'dart:io';

import 'package:inventory/network/response_type_def.dart';

abstract class AddFolderRepository {
  EitherResponse postFolders(String tag, List<File> images,
      {String folderName = '',
      String folderDescription = '',
      int parentFolderName = 0,
      required List<int> listOfTagsId});

  EitherResponse editFolders(String tag, List<File> images,
      {
        required int folderId,
        String folderName = '',
      String folderDescription = '',
      int parentFolderName = 0,
      required List<int> listOfTagsId});

  EitherResponse getFolders();


  EitherResponse deleteFolders(int tagId);
}
