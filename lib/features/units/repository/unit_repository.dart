import 'package:inventory/features/units/model/unit_model.dart';
import 'package:inventory/network/response_type_def.dart';

abstract class UnitRepository{
  EitherResponse postUnit(Unit unit);
  EitherResponse getUnits();
  EitherResponse editUnits();
  EitherResponse deleteUnits(int unitId);
}