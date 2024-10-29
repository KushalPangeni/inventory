import 'package:inventory/network/response_type_def.dart';

abstract class AddItemRepository {
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
      required String sku});

  EitherResponse getItems();

  EitherResponse editItems(
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
        int? itemId,
        required String sku});

  EitherResponse deleteItems(int tagId);
}
