import 'package:inventory/features/auth/model/auth_model.dart';
import 'package:inventory/features/auth/repository/auth_repository.dart';
import 'package:inventory/network/api_service.dart';
import 'package:inventory/network/request.dart';
import 'package:inventory/network/response_type_def.dart';

class AuthRepositoryImpl implements AuthRepository {
  final DioClient _client;

  AuthRepositoryImpl(this._client);

  @override
  EitherResponse signIn(String username, String password) async {
    var request =
        _client.post(endPoint: Request.createUrl('api/login'), data: {'email': username, 'password': password});
    return await _client.handleNetworkCall(request, AuthResponse.fromJson);
  }
}
