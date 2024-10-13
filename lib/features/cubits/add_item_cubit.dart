import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/features/add_items/model/color_model.dart';

part 'add_item_state.dart';

part 'add_item_cubit.freezed.dart';

class AddItemCubit extends Cubit<AddItemState> {
  AddItemCubit() : super(const AddItemState());

  addColorInColorList() {
    List<ColorModel> listOfColorModel = List.from(state.colorList);
    listOfColorModel.add(ColorModel(colorName: '', quantity: 0, roll: 0));
    emit(state.copyWith(colorList: listOfColorModel));
  }

  deleteColorInColorList(int index) {
    List<ColorModel> listOfColorModel = List.from(state.colorList);
    listOfColorModel.removeAt(index);
    emit(state.copyWith(colorList: listOfColorModel));
  }

  editColorItem(int index, String colorName, int quantity, int roll) {
    List<ColorModel> listOfColorModel = List.from(state.colorList);
    listOfColorModel[index].colorName = colorName;
    listOfColorModel[index].quantity = quantity;
    listOfColorModel[index].roll = roll;
    emit(state.copyWith(colorList: listOfColorModel));
  }
}
