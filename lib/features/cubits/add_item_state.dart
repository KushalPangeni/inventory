part of 'add_item_cubit.dart';

@freezed
class AddItemState with _$AddItemState {
  const factory AddItemState({
    @Default('') String title,
    @Default([]) List<ColorModel> colorList,
})=_AddItemState;
}
