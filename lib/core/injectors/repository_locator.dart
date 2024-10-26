import 'package:inventory/features/add_folders/repository/add_folder_repository.dart';
import 'package:inventory/features/add_folders/repository/add_folder_repository_impl.dart';
import 'package:inventory/features/tags/repository/tag_repository.dart';
import 'package:inventory/features/tags/repository/tag_repository_impl.dart';

import 'dependency_injectors.dart';

void setupRepositoryLocator() {
  di.registerLazySingleton<AddFolderRepository>(
    () => AddFolderRepositoryImpl(di()),
  );

  di.registerLazySingleton<TagRepository>(
    () => TagRepositoryImpl(di()),
  );

}
