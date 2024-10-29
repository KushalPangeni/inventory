part of 'unit_cubit.dart';

@freezed
class UnitState with _$UnitState {
  const factory UnitState({
    @Default(InitialState()) ApiRequestState? status,
    @Default([]) List<Unit> listOfUnits,
    @Default([]) List<Unit> listOfSelectedUnits,
}) = _UnitState;
}
