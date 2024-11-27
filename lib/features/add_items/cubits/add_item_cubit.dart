import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
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
  TextEditingController partyNameController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController gsmController = TextEditingController();
  TextEditingController orderQuantityController = TextEditingController();
  TextEditingController minQuantityController = TextEditingController();
  TextEditingController oneKgController = TextEditingController();
  TextEditingController averageController = TextEditingController();
  TextEditingController averageUnitController = TextEditingController();
  TextEditingController shortageController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  initializeTextController() {
    itemNameController.text = '';
    fabricNumberController.text = '';
    partyNameController.text = '';
    orderQuantityController.text = '';
    shortageController.text = '0';
    shopNameController.text = '';
    widthController.text = '0';
    gsmController.text = '0';
    minQuantityController.text = '0';
    oneKgController.text = '0';
    averageController.text = '0';
    averageUnitController.text = '';
    notesController.text = ' ';
  }

  initializeEditScreenTextController(Item item) {
    List<ColorModelF> colorsList = [];
    itemNameController.text = item.name;
    fabricNumberController.text = item.fabricNumber ?? '';
    partyNameController.text = item.partyName ?? '';
    shortageController.text = item.shortage.toString() ?? '0';
    orderQuantityController.text = item.orderQuantity ?? '';
    shopNameController.text = item.shopName ?? '';
    widthController.text = item.width.toString();
    gsmController.text = item.gsm.toString();
    minQuantityController.text = item.quantity.toString();
    oneKgController.text = item.kgToMeterRatio.toString();
    averageController.text = item.average.toString();
    averageUnitController.text = item.averageUnit.toString();
    notesController.text = item.accessoriesNotes ?? '';

    if (item.colors != null && item.colors!.isNotEmpty) {
      colorsList = item.colors!
          .map((color) =>
              ColorModelF(colorId: color.colorId, number: color.number, quantity: color.quantitys, roll: color.rolls))
          .toList();
    }
    emit(state.copyWith(colorList: colorsList));
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

  addItems(BuildContext context, int? folderId, List<File> listOfFiles, int unitId) async {
    emit(state.copyWith(status: const LoadingState()));
    List<MultipartFile> listOfMultipartFiles = [];
    for (int i = 0; i < listOfFiles.length; i++) {
      listOfMultipartFiles.add(await MultipartFile.fromFile(
        listOfFiles[i].path,
        filename: listOfFiles[i].path.split('/').last, // Specify the file name explicitly
      ));
    }
    List listOfColors = state.colorList
        .map((colorModelF) => {
              "color_id": colorModelF.colorId,
              "quantitys": colorModelF.quantity,
              "rolls": colorModelF.roll,
              "number": colorModelF.number
            })
        .toList();

    var response = await repository.postItems(listOfMultipartFiles,
        folderId: folderId,
        itemName: itemNameController.text,
        fabricNumber: fabricNumberController.text,
        partyName: partyNameController.text,
        shopName: shopNameController.text,
        width: widthController.text,
        gsm: gsmController.text,
        unitId: unitId,
        quantity: int.parse(minQuantityController.text),
        minimumQuantity: minQuantityController.text,
        kgToMeter: oneKgController.text,
        shortage: shortageController.text,
        notes: notesController.text,
        listOfColors: listOfColors,
        average: averageController.text,
        orderQuantity: orderQuantityController.text,
        averageUnit: averageUnitController.text,
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

  editItems(BuildContext context, int? folderId, List<File> listOfFiles, int unitId, int? itemId) async {
    emit(state.copyWith(status: const LoadingState()));

    List<MultipartFile> listOfMultipartFiles = [];
    for (int i = 0; i < listOfFiles.length; i++) {
      listOfMultipartFiles.add(await MultipartFile.fromFile(
        listOfFiles[i].path,
        filename: listOfFiles[i].path.split('/').last,
      ));
    }
    List listOfColors = state.colorList
        .map((colorModelF) => {
              "color_id": colorModelF.colorId,
              "quantitys": colorModelF.quantity,
              "rolls": colorModelF.roll,
              "number": colorModelF.number
            })
        .toList();

    var response = await repository.editItems(listOfMultipartFiles,
        folderId: folderId,
        itemName: itemNameController.text,
        fabricNumber: fabricNumberController.text,
        partyName: partyNameController.text,
        shopName: shopNameController.text,
        width: widthController.text,
        gsm: gsmController.text,
        unitId: unitId,
        quantity: int.parse(minQuantityController.text),
        minimumQuantity: minQuantityController.text,
        kgToMeter: oneKgController.text,
        shortage: shortageController.text,
        notes: notesController.text,
        listOfColors: listOfColors,
        average: averageController.text,
        orderQuantity: orderQuantityController.text,
        averageUnit: averageUnitController.text,
        itemId: itemId,
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

  addColorInColorList(ColorModelF color) {
    List<ColorModelF> listOfColorModel = List.from(state.colorList);
    listOfColorModel.add(const ColorModelF(quantity: 0, roll: 0));
    emit(state.copyWith(colorList: listOfColorModel));
  }

  deleteColorInColorList(int index) {
    List<ColorModelF> listOfColorModel = List.from(state.colorList);
    listOfColorModel.removeAt(index);
    emit(state.copyWith(colorList: listOfColorModel));
  }

  editColorItem(int index, {int? colorId, int? number, int? quantity, int? roll}) {
    List<ColorModelF> listOfColorModel = List.from(state.colorList);

    listOfColorModel[index] = listOfColorModel[index].copyWith(
      colorId: colorId ?? listOfColorModel[index].colorId,
      number: number ?? listOfColorModel[index].number,
      quantity: quantity ?? listOfColorModel[index].quantity,
      roll: roll ?? listOfColorModel[index].roll,
    );

    // state.copyWith(colorList: )
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
    averageUnitController.clear();
    orderQuantityController.clear();
    shortageController.clear();
    notesController.clear();
  }
}
