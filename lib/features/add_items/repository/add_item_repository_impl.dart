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
  EitherResponse getItems() async {
    var request = _client.get(
      endPoint: Request.createUrl('api/items'),
    );
    return await _client.handleNetworkCall(request, ItemModelResponse.fromJson);
  }

  @override
  EitherResponse editItems(List<MultipartFile> listOfFiles,
      {required String itemName,
      required String fabricNumber,
      required String partyName,
      required String orderQuantity,
      required String minimumQuantity,
      required String shopName,
      required String width,
      required String gsm,
      required int unitId,
      required String kgToMeter,
      required String average,
      required String averageUnit,
      required String shortage,
      required int quantity,
      required String notes,
      int? folderId,
      int? itemId,
      required List listOfColors,
      required String sku}) async {
    final formData = FormData.fromMap({
      "name": itemName,
      "party_name": partyName,
      "images[]": listOfFiles,
      "fabric_number": fabricNumber,
      "shop_name": shopName,
      "width": width,
      "gsm": gsm,
      "kg_to_meter_ratio": kgToMeter,
      "average": average,
      "shortage": shortage,
      "quantity": quantity,
      "order_quantity": orderQuantity,
      "minimum_quantity": int.parse(minimumQuantity),
      "avg_unit": averageUnit,
      "unit_id": unitId,
      "accessories_notes": notes,
      "folder_id": folderId,
      "sku": "string",
      "colors": listOfColors,
      "_method": "PUT"
    });

    var request = _client.uploadFiles(endPoint: Request.createUrl('api/items/$itemId'), formData: formData);
    return await _client.handleNetworkCall(request);
  }

  @override
  EitherResponse postItems(List<MultipartFile> listOfFiles,
      {required String itemName,
      required String fabricNumber,
      required String partyName,
      required String orderQuantity,
      required String minimumQuantity,
      required String averageUnit,
      required String shopName,
      required String width,
      required String gsm,
      required int unitId,
      required String kgToMeter,
      required String average,
      required String shortage,
      required int quantity,
      required String notes,
      int? folderId,
      required List listOfColors,
      required String sku}) async {
    final formData = FormData.fromMap({
      "name": itemName,
      "party_name": partyName,
      "images[]": listOfFiles,
      "fabric_number": fabricNumber,
      "shop_name": shopName,
      "width": width,
      "gsm": gsm,
      "kg_to_meter_ratio": kgToMeter,
      "average": average,
      "shortage": shortage,
      "quantity": quantity,
      "order_quantity": orderQuantity,
      "minimum_quantity": int.parse(minimumQuantity),
      "avg_unit": averageUnit,
      "unit_id": unitId,
      "accessories_notes": notes,
      "folder_id": folderId,
      "sku": "string",
      "colors": listOfColors
    });
    /*[
        {"color_id": 0, "quantitys": 0, "rolls": 0}
      ]*/
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
