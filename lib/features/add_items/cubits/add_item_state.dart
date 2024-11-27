part of 'add_item_cubit.dart';

@freezed
class AddItemState with _$AddItemState {
  const factory AddItemState({
    @Default(InitialState()) ApiRequestState? status,
    @Default(InitialState()) ApiRequestState? uploadStatus,
    @Default([]) List<Item> listOfItems,
    @Default([]) List<Item> listOfItemsFromSelectedFolder,
    @Default('') String title,
    @Default([]) List<ColorModelF> colorList,
  }) = _AddItemState;
}
