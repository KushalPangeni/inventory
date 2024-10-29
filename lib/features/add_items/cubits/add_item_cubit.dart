import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart';
import 'package:inventory/features/add_items/model/color_model.dart';
import 'package:inventory/features/add_items/repository/add_item_repository.dart';
import 'package:inventory/features/tags/cubit/tags_cubit.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

part 'add_item_state.dart';

part 'add_item_cubit.freezed.dart';

class AddItemCubit extends Cubit<AddItemState> {
  AddItemRepository repository;

  AddItemCubit(this.repository) : super(const AddItemState());

  TextEditingController itemNameController = TextEditingController();
  TextEditingController fabricNumberController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController gsmController = TextEditingController();
  TextEditingController minQuantityController = TextEditingController();
  TextEditingController oneKgController = TextEditingController();
  TextEditingController averageController = TextEditingController();
  TextEditingController shortageController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  initializeTextController() {
    itemNameController.text = '';
    fabricNumberController.text = '';
    shortageController.text = '0';
    shopNameController.text = '';
    widthController.text = '0';
    gsmController.text = '0';
    minQuantityController.text = '0';
    oneKgController.text = '0';
    averageController.text = '0';
    notesController.text = ' ';
  }

  initializeEditScreenTextController(Item item) {
    itemNameController.text = item.name;
    fabricNumberController.text = item.fabricNumber ?? '';
    shortageController.text = item.shortage.toString() ?? '0';
    shopNameController.text = item.shopName ?? '';
    widthController.text = item.width.toString();
    gsmController.text = item.gsm.toString();
    minQuantityController.text = item.quantity.toString();
    oneKgController.text = item.kgToMeterRatio.toString();
    averageController.text = item.average.toString();
    notesController.text = item.accessoriesNotes ?? '';
  }

  getItems({bool showLoading = true}) async {
    emit(state.copyWith(status: showLoading ? const LoadingState() : const InitialState()));
    var response = await repository.getItems();
    response.fold((l) {
      emit(state.copyWith(status: const ErrorState()));
      log('Get Items === > $l');
    }, (r) {
      log('Get Items === > ${r.data}');
      ItemModelResponse itemModelResponse = r.data;
      emit(state.copyWith(status: const LoadedState(), listOfItems: itemModelResponse.result));
    });
  }

  addItems(BuildContext context, int? folderId) async {
    emit(state.copyWith(status: const LoadingState()));
    var response = await repository.postItems(
        folderId: folderId,
        itemName: itemNameController.text,
        fabricNumber: fabricNumberController.text,
        shopName: shopNameController.text,
        width: int.parse(widthController.text),
        gsm: int.parse(gsmController.text),
        quantity: int.parse(minQuantityController.text),
        kgToMeter: int.parse(oneKgController.text),
        shortage: int.parse(shortageController.text),
        notes: notesController.text,
        average: int.parse(averageController.text),
        sku: '');
    response.fold((l) {
      emit(state.copyWith(status: const ErrorState()));
      log('Post Items === > $l');
    }, (r) {
      log('Post Items === > ${r.data}');
      emit(state.copyWith(status: const LoadedState()));
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      BlocProvider.of<FolderCubit>(context).getFolders();
      BlocProvider.of<TagsCubit>(context).getTags();
      initializeTextController();
    });
  }

  editItems(BuildContext context, int? folderId, int? itemId) async {
    emit(state.copyWith(status: const LoadingState()));
    var response = await repository.editItems(
        folderId: folderId,
        itemId: itemId,
        itemName: itemNameController.text,
        fabricNumber: fabricNumberController.text,
        shopName: shopNameController.text,
        width: int.parse(widthController.text),
        gsm: int.parse(gsmController.text),
        quantity: int.parse(minQuantityController.text),
        kgToMeter: double.parse(oneKgController.text).toInt(),
        shortage: double.parse(shortageController.text).toInt(),
        notes: notesController.text,
        average: double.parse(averageController.text).toInt(),
        sku: '');
    response.fold((l) {
      emit(state.copyWith(status: const ErrorState()));
      log('Post Items === > $l');
    }, (r) {
      log('Post Items === > ${r.data}');
      emit(state.copyWith(status: const LoadedState()));
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      BlocProvider.of<FolderCubit>(context).getFolders();
      BlocProvider.of<TagsCubit>(context).getTags();
      initializeTextController();
    });
  }

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

  deleteItem(int itemId) async {
    var response = await repository.deleteItems(itemId);
    response.fold((l) {
      emit(state.copyWith(status: const ErrorState()));
      log('Delete Items === > $l');
    }, (r) {
      log('Delete Items === > ${r.data}');
    });
  }

  clearTextFields() {
    itemNameController.clear();
    fabricNumberController.clear();
    shopNameController.clear();
    widthController.clear();
    gsmController.clear();
    minQuantityController.clear();
    oneKgController.clear();
    averageController.clear();
    shortageController.clear();
    notesController.clear();
  }
}
