import 'package:inventory/features/colors/model/color_model.dart';
import 'package:inventory/network/response_type_def.dart';

abstract class ColorRepository {
  EitherResponse postColors(ColorModel color);

  EitherResponse getColors();

  EitherResponse editColors();

  EitherResponse deleteColors(int colorId);

  //history
  EitherResponse fetchHistory();

  EitherResponse fetchHistoryById(int folderItemId, {bool isFolder = true});
}
