import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart' as folder_model;
import 'package:inventory/features/add_items/cubits/add_item_cubit.dart';
import 'package:inventory/features/add_items/widgets/add_colors_list_widget.dart';
import 'package:inventory/features/add_items/widgets/image_upload_button.dart';
import 'package:inventory/features/colors/cubit/color_cubit.dart';
import 'package:inventory/features/units/cubit/unit_cubit.dart';
import 'package:inventory/features/units/model/unit_model.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

class AddItemScreen extends StatefulWidget {
  final bool isEditScreen;
  final int? folderId;
  final folder_model.Item? item;

  const AddItemScreen({super.key, this.folderId, this.isEditScreen = false, this.item});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  ValueNotifier<List<File>> listOfImages = ValueNotifier([]);
  ValueNotifier<List<folder_model.Image>> listOfUrlImages = ValueNotifier([]);
  ValueNotifier<int?> dropdownValue = ValueNotifier(null);
  ValueNotifier<int?> unitId = ValueNotifier(null);

  updateListOfImages(List<File> pickedImages) {
    listOfImages.value = [...listOfImages.value, ...pickedImages];
  }

  removeListOfImages(int index) {
    listOfImages.value.removeAt(index);
  }

  @override
  void initState() {
    super.initState();
    if (widget.isEditScreen && widget.item != null) {
      listOfUrlImages.value = widget.item!.images ?? listOfUrlImages.value;
      unitId.value = widget.item!.unitId;
      BlocProvider.of<AddItemCubit>(context).initializeEditScreenTextController(widget.item!);
    } else {
      BlocProvider.of<AddItemCubit>(context).initializeTextController();
    }
    BlocProvider.of<UnitCubit>(context).getUnits();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AddItemCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          scrolledUnderElevation: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: AppText(
            '${widget.isEditScreen ? 'Edit' : 'Add'} Item',
            style: const TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                  valueListenable: listOfImages,
                  builder: (context, list, _) {
                    return AddImageButton(
                      onTap: () {
                        showBottomSheet(context);
                      },
                      isEditScreen: false,
                      onDelete: (a) {},
                      isFromDraftScreen: false,
                      listOfImages: listOfImages.value,
                      listOfUrlImages: listOfUrlImages.value,
                    );
                  }),
              const SizedBox(height: 16),

              //Name
              AppText('Name', style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Name',
                  inputType: TextInputType.text,
                  controller: bloc.itemNameController,
                  onTyped: (s) {}),
              //Fabric No.
              AppText('Fabric Number',
                  style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Fabric Number',
                  inputType: TextInputType.number,
                  controller: bloc.fabricNumberController,
                  onTyped: (s) {}),
              // Party Name
              AppText('Party Name',
                  style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Party Name',
                  inputType: TextInputType.text,
                  controller: bloc.partyNameController,
                  onTyped: (s) {}),
              //Shop name
              AppText('Shop name',
                  style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Shop Name',
                  inputType: TextInputType.text,
                  controller: bloc.shopNameController,
                  onTyped: (s) {}),
              // Order Quantity
              AppText('Order Quantity',
                  style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Eg. 1000',
                  inputType: TextInputType.number,
                  controller: bloc.orderQuantityController,
                  onTyped: (s) {}),
              Row(
                children: [
                  Expanded(
                      child: AppText('Width',
                          style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: AppText('GSM',
                          style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: customTextField(
                          hintText: '150 cm',
                          inputType: TextInputType.number,
                          controller: bloc.widthController,
                          onTyped: (s) {})),
                  const SizedBox(width: 10),
                  Expanded(
                      child: customTextField(
                          hintText: 'GSM',
                          inputType: TextInputType.number,
                          controller: bloc.gsmController,
                          onTyped: (s) {})),
                ],
              ),
              AppText('Shortage (%)',
                  style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Shortage',
                  inputType: TextInputType.number,
                  controller: bloc.shortageController,
                  onTyped: (s) {}),
              BlocBuilder<UnitCubit, UnitState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                          child: AppText('Min. Quantity',
                              style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                      const SizedBox(width: 10),
                      Expanded(
                          child: AppText('Unit',
                              style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                    ],
                  );
                },
              ),
              BlocBuilder<UnitCubit, UnitState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                          child: customTextField(
                              hintText: '0',
                              inputType: TextInputType.number,
                              controller: bloc.minQuantityController,
                              onTyped: (s) {})),
                      const SizedBox(width: 10),
                      state.listOfUnits.isNotEmpty
                          ? Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 0, right: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: const Color(0xFFE4E4E7))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: ValueListenableBuilder<int?>(
                                      valueListenable: unitId,
                                      builder: (context, colorId, _) => DropdownButton<int?>(
                                        value: unitId.value,
                                        icon: const SizedBox(),
                                        elevation: 16,
                                        style: const TextStyle(color: Colors.deepPurple),
                                        underline: const SizedBox(),
                                        onChanged: (int? value) {
                                          // This is called when the user selects an item.
                                          log("$value ?? 'No id'");
                                          unitId.value = value;
                                        },
                                        items: state.listOfUnits.map<DropdownMenuItem<int>>((Unit unit) {
                                          return DropdownMenuItem<int>(
                                            value: unit.id,
                                            child: Text(unit.name),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const Text("No Units available", style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  );
                },
              ),
              AppText('Kg / meter',
                  style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Enter in meter',
                  inputType: TextInputType.number,
                  controller: bloc.oneKgController,
                  onTyped: (s) {}),
              Row(
                children: [
                  Expanded(
                      child: AppText('Average',
                          style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                  Expanded(
                      child: AppText('Avg Unit',
                          style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: customTextField(
                        hintText: 'Average',
                        inputType: TextInputType.number,
                        controller: bloc.averageController,
                        onTyped: (s) {}),
                  ),
                  Expanded(
                    child: customTextField(
                        hintText: 'Avg Unit',
                        inputType: TextInputType.text,
                        controller: bloc.averageUnitController,
                        onTyped: (s) {}),
                  ),
                ],
              ),

              ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: AppText('Selected Colors',
                      style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                ),
                Table(
                  children: [
                    TableRow(children: [
                      AppText('Color',
                          style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      AppText('Number',
                          style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      AppText('Quantity',
                          style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      AppText('Rolls',
                          style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    ]),
                  ],
                ),
                BlocBuilder<ColorCubit, ColorState>(
                  builder: (context, colorState) {
                    return BlocBuilder<AddItemCubit, AddItemState>(
                        builder: (context, state) => ListView.builder(
                            itemCount: state.colorList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (state.colorList[index].colorId != null) {
                                log("ColorList ==> ${state.colorList[index].colorId} '${colorState.listOfUnits.firstWhere((color) => color.id == state.colorList[index].colorId).name}'");
                                return Table(
                                  children: [
                                    TableRow(children: [
                                      AppText(colorState.listOfUnits
                                          .firstWhere((color) => color.id == state.colorList[index].colorId)
                                          .name),
                                      AppText(state.colorList
                                          .firstWhere((color) => color.colorId == state.colorList[index].colorId)
                                          .number
                                          .toString()),
                                      AppText(state.colorList
                                          .firstWhere((color) => color.colorId == state.colorList[index].colorId)
                                          .quantity
                                          .toString()),
                                      AppText(state.colorList
                                          .firstWhere((color) => color.colorId == state.colorList[index].colorId)
                                          .roll
                                          .toString()),
                                    ])
                                  ],
                                  /*child: AppText(colorState.listOfUnits
                                      .firstWhere((color) => color.id == state.colorList[index].colorId)
                                      .name),*/
                                );
                              } else {
                                return const SizedBox();
                              }
                            }));
                  },
                ),
              ],
              TextButton(
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => const AddColorsListWidget()));
                  },
                  child: Text('Add Colors',
                      style: const TextStyle()
                          .defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blue))),
              AppText('Notes', style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Notes', inputType: TextInputType.text, controller: bloc.notesController, onTyped: (s) {}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<AddItemCubit, AddItemState>(
        builder: (context, state) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 8.0, right: 16, left: 16, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    flex: 2,
                    child: AppButton(
                        title: 'Cancel',
                        color: Colors.grey,
                        onPressed: () {
                          if (state.status is! LoadingState) {
                            Navigator.of(context).pop();
                          }
                        })),
                const SizedBox(width: 10),
                Flexible(
                  flex: 2,
                  child: AppButton(
                    title: widget.isEditScreen ? 'Update' : 'Save',
                    isLoading: state.status is LoadingState,
                    color: Colors.orangeAccent,
                    onPressed: () {
                      var bloc = BlocProvider.of<AddItemCubit>(context);
                      if (bloc.itemNameController.text.trim().isNotEmpty &&
                          bloc.fabricNumberController.text.trim().isNotEmpty &&
                          bloc.notesController.text.trim().isNotEmpty &&
                          bloc.shopNameController.text.trim().isNotEmpty) {
                        if (state.status is! LoadingState) {
                          if (widget.isEditScreen) {
                            BlocProvider.of<AddItemCubit>(context).editItems(
                              context,
                              widget.folderId,
                              listOfImages.value,
                              unitId.value ?? 0,
                              widget.item!.id,
                            );
                          } else {
                            BlocProvider.of<AddItemCubit>(context)
                                .addItems(context, widget.folderId, listOfImages.value, unitId.value!);
                          }
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            elevation: 10,
                            backgroundColor: Colors.white,
                            duration: Duration(seconds: 1),
                            content: AppText(
                              'Item name, Fabric number, Shop Name and Notes is required.',
                              maxLines: 2,
                            )));
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AppText('Pick Images',
                            maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8), color: Colors.black.withOpacity(0.1)),
                          child: const Icon(Icons.close_rounded)),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                pickOptionWidget('Gallery', () async {
                  Navigator.of(context).pop();
                  final List<XFile>? pickedImages = await ImagePicker().pickMultiImage();
                  log(pickedImages!.toString());
                  if (pickedImages != null && pickedImages.isNotEmpty) {
                    List<File> images = pickedImages.map((xFile) => File(xFile.path)).toList();
                    updateListOfImages(images);
                  }
                }),
                pickOptionWidget('Camera', () async {
                  Navigator.of(context).pop();
                  final XFile? pickedImages = await ImagePicker().pickImage(source: ImageSource.camera);
                  log(pickedImages!.toString());
                  updateListOfImages([File(pickedImages.path)]);
                }),
              ],
            ),
          );
        });
  }
}

/*Widget customTextField({String hintText = '', TextInputType inputType = TextInputType.text}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: TextFormField(
      minLines: 1,
      maxLines: 5,
      inputFormatters: inputType == TextInputType.number
          ? [
              FilteringTextInputFormatter.singleLineFormatter, // Only allows digits
              SingleDecimalInputFormatter(), // Custom formatter for decimal
            ]
          : [],
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      keyboardType: inputType,
      onSaved: (phone) {
        // Save it
      },
    ),
  );
}*/

pickOptionWidget(String text, void Function()? onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(text),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          )
        ],
      ),
    ),
  );
}

class SingleDecimalInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only numbers and one decimal point
    if (newValue.text.isEmpty) {
      return newValue; // Allow empty input
    }

    final regex = RegExp(r'^\d*\.?\d*$');
    if (regex.hasMatch(newValue.text)) {
      return newValue; // Valid input
    }

    return oldValue; // Invalid input, revert to old value
  }
}
