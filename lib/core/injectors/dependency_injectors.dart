import 'package:get_it/get_it.dart';
import '../../core/injectors/repository_locator.dart';
import '../../network/api_service.dart';

GetIt di = GetIt.instance;

setupLocator() {
  di.registerSingleton(DioClient());
  setupRepositoryLocator();
}
