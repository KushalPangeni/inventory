import 'package:inventory/features/tags/model/tag_model.dart';
import 'package:inventory/features/tags/repository/tag_repository.dart';
import 'package:inventory/network/api_service.dart';
import 'package:inventory/network/request.dart';
import 'package:inventory/network/response_type_def.dart';

class TagRepositoryImpl implements TagRepository {
  final DioClient _client;

  TagRepositoryImpl(this._client);

  @override
  EitherResponse deleteTags(int tagId) async {
    var request = _client.delete(
      endPoint: Request.createUrl('api/tags/$tagId'),
    );
    return await _client.handleNetworkCall(request);
  }

  @override
  EitherResponse editTags() {
    // TODO: implement editTags
    throw UnimplementedError();
  }

  @override
  EitherResponse getTags() async {
    var request = _client.get(
      endPoint: Request.createUrl('api/tags'),
    );
    return await _client.handleNetworkCall(request, TagModel.fromJson);
  }

  @override
  EitherResponse postTags(String tag) async{

    var request = _client.post(
      endPoint: Request.createUrl('api/tags'),
      data: {'name':tag}
    );
    return await _client.handleNetworkCall(request);
  }
}
