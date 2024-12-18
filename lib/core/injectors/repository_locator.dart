import 'package:inventory/features/add_folders/repository/add_folder_repository.dart';
import 'package:inventory/features/add_folders/repository/add_folder_repository_impl.dart';
import 'package:inventory/features/add_items/repository/add_item_repository.dart';
import 'package:inventory/features/add_items/repository/add_item_repository_impl.dart';
import 'package:inventory/features/auth/repository/auth_repository.dart';
import 'package:inventory/features/auth/repository/auth_repository_impl.dart';
import 'package:inventory/features/colors/repository/color_repository.dart';
import 'package:inventory/features/colors/repository/color_repository_impl.dart';
import 'package:inventory/features/search/repository/search_repository.dart';
import 'package:inventory/features/search/repository/search_repository_impl.dart';
import 'package:inventory/features/tags/repository/tag_repository.dart';
import 'package:inventory/features/tags/repository/tag_repository_impl.dart';
import 'package:inventory/features/units/repository/unit_repository.dart';
import 'package:inventory/features/units/repository/unit_repository_impl.dart';

import 'dependency_injectors.dart';

void setupRepositoryLocator() {
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(di()),
  );

  di.registerLazySingleton<AddFolderRepository>(
    () => AddFolderRepositoryImpl(di()),
  );

  di.registerLazySingleton<AddItemRepository>(
    () => AddItemRepositoryImpl(di()),
  );

  di.registerLazySingleton<TagRepository>(
    () => TagRepositoryImpl(di()),
  );

  di.registerLazySingleton<UnitRepository>(
    () => UnitRepositoryImpl(di()),
  );

  di.registerLazySingleton<ColorRepository>(
    () => ColorRepositoryImpl(di()),
  );

  di.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(di()),
  );
}
