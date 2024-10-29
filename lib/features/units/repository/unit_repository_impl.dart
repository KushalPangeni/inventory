import 'package:inventory/features/units/model/unit_model.dart';
import 'package:inventory/features/units/repository/unit_repository.dart';
import 'package:inventory/network/api_service.dart';
import 'package:inventory/network/request.dart';
import 'package:inventory/network/response_type_def.dart';

class UnitRepositoryImpl implements UnitRepository {
  DioClient _client;

  UnitRepositoryImpl(this._client);

  @override
  EitherResponse deleteUnits(int unitId) async {
    var request = _client.delete(
      endPoint: Request.createUrl('api/units/$unitId'),
    );
    return await _client.handleNetworkCall(request);
  }

  @override
  EitherResponse editUnits() {
    // TODO: implement editUnits
    throw UnimplementedError();
  }

  @override
  EitherResponse getUnits() async {
    var request = _client.get(
      endPoint: Request.createUrl('api/units'),
    );
    return await _client.handleNetworkCall(request, UnitResponseModel.fromJson);
  }

  @override
  EitherResponse postUnit(Unit unit) async {
    var request = _client.post(
        endPoint: Request.createUrl('api/units'), data: {'name': unit.name, 'slug': unit.slug, 'label': unit.label});
    return await _client.handleNetworkCall(request);
  }
}

/*
{
  "name": "string",
  "slug": "string",
  "label": "string"
}
 */
