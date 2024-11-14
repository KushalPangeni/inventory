part of 'color_cubit.dart';

@freezed
class ColorState with _$ColorState {
  const factory ColorState({
    @Default(InitialState()) ApiRequestState? status,
    @Default([]) List<Color> listOfUnits,
    @Default([]) List<Color> listOfSelectedUnits,
}) = _ColorState;
}
