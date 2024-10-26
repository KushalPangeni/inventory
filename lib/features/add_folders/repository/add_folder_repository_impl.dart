import 'package:inventory/features/add_folders/repository/add_folder_repository.dart';
import 'package:inventory/network/api_service.dart';

class AddFolderRepositoryImpl implements AddFolderRepository {
  final DioClient _client;

  AddFolderRepositoryImpl(this._client);
}
