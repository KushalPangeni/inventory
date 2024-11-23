import 'package:inventory/features/colors/model/color_model.dart';
import 'package:inventory/features/colors/repository/color_repository.dart';
import 'package:inventory/network/api_service.dart';
import 'package:inventory/network/request.dart';
import 'package:inventory/network/response_type_def.dart';

class ColorRepositoryImpl implements ColorRepository {
  final DioClient _client;

  ColorRepositoryImpl(this._client);

  @override
  EitherResponse deleteColors(int colorId) async {
    var request = _client.delete(
      endPoint: Request.createUrl('api/colors/$colorId'),
    );
    return await _client.handleNetworkCall(request);
  }

  @override
  EitherResponse editColors() {
    // TODO: implement editColors
    throw UnimplementedError();
  }

  @override
  EitherResponse getColors() async {
    var request = _client.get(
      endPoint: Request.createUrl('api/colors'),
    );
    return await _client.handleNetworkCall(request, ColorResponseModel.fromJson);
  }

  @override
  EitherResponse postColors(ColorModel color) async {
    var request =
        _client.post(endPoint: Request.createUrl('api/colors'), data: {'name': color.name, 'slug': color.slug});
    return await _client.handleNetworkCall(request);
  }
}
