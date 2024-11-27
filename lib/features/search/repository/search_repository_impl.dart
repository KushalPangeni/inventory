import 'package:inventory/features/search/model/search_response_model.dart';
import 'package:inventory/features/search/repository/search_repository.dart';
import 'package:inventory/network/api_service.dart';
import 'package:inventory/network/request.dart';
import 'package:inventory/network/response_type_def.dart';

class SearchRepositoryImpl implements SearchRepository {
  final DioClient _client;

  SearchRepositoryImpl(this._client);

  @override
  EitherResponse searchByString(String text) async {
    var request = _client.get(
      endPoint: Request.createUrl('api/search'),
      queryParameters: {"query":text}
    );
    return await _client.handleNetworkCall(request, SearchResponse.fromJson);
  }
}
