import 'package:dio/dio.dart';
import 'package:inventory/network/response_type_def.dart';

abstract class AddItemRepository {
  EitherResponse postItems(List<MultipartFile> listOfFiles,
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
      required List listOfColors,
      required String sku});

  EitherResponse getItems();

  EitherResponse getItemsById(int itemId);

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
      required String sku});

  EitherResponse deleteItems(int itemId);

  EitherResponse moveFolder({required int itemId, required int moveQuantity,required int destinationFolderId, required String reasonToMove,required String note});

  EitherResponse deleteImages({required int deletedId});

}
