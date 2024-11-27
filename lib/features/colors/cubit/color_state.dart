part of 'color_cubit.dart';

@freezed
class ColorState with _$ColorState {
  const factory ColorState({
    @Default(InitialState()) ApiRequestState? status,
    @Default(InitialState()) ApiRequestState? historyStatus,
     @Default([]) List<HistoryModel?> historyModel,
    @Default([]) List<ColorModel> listOfUnits,
    @Default([]) List<ColorModel> listOfSelectedUnits,
}) = _ColorState;
}
