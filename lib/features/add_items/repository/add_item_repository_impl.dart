import 'package:dio/dio.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart';
import 'package:inventory/network/api_service.dart';
import 'package:inventory/network/request.dart';
import 'package:inventory/network/response_type_def.dart';

import 'add_item_repository.dart';

class AddItemRepositoryImpl implements AddItemRepository {
  final DioClient _client;

  AddItemRepositoryImpl(this._client);

  @override
  EitherResponse deleteItems(int itemId) async {
    var request = _client.delete(
      endPoint: Request.createUrl('api/items/$itemId'),
    );
    return await _client.handleNetworkCall(request);
  }

  @override
  EitherResponse editItems() {
    // TODO: implement editItems
    throw UnimplementedError();
  }

  @override
  EitherResponse getItems() async {
    var request = _client.get(
      endPoint: Request.createUrl('api/items'),
    );
    return await _client.handleNetworkCall(request, ItemModelResponse.fromJson);
  }

  @override
  EitherResponse postItems(
      {required String itemName,
      required String fabricNumber,
      required String shopName,
      required int width,
      required int gsm,
      required int kgToMeter,
      required int average,
      required int shortage,
      required int quantity,
      required String notes,
       int? folderId,
      required String sku}) async {
    final formData = FormData.fromMap({
      "name": itemName,
      "fabric_number": fabricNumber,
      "shop_name": shopName,
      "width": width,
      "gsm": 0,
      "kg_to_meter_ratio": kgToMeter,
      "average": average,
      "shortage": shortage,
      "quantity": quantity,
      "unit_id": 1,
      "accessories_notes": notes,
      "folder_id": folderId,
      "sku": "string",
    });
    /*final formData = FormData.fromMap({
      "name": itemName,
      "fabric_number": fabricNumber,
      "shop_name":shopName,
      "width": width,
      "gsm": gsm,
      "kg_to_meter_ratio": kgToMeter,
      "average": average,
      "shortage": shortage,
      "quantity": quantity,
      "unit_id": 0,
      "accessories_notes": "string",
      "folder_id": 28,
      "sku": "string",
    });*/
    var request = _client.uploadFiles(endPoint: Request.createUrl('api/items'), formData: formData);
    return await _client.handleNetworkCall(request);
  }
}