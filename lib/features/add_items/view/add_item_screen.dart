import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart';
import 'package:inventory/features/add_items/cubits/add_item_cubit.dart';
import 'package:inventory/features/add_items/widgets/add_colors_list_widget.dart';
import 'package:inventory/features/add_items/widgets/image_upload_button.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

class AddItemScreen extends StatefulWidget {
  final bool isEditScreen;
  final int? folderId;
  final Item? item;

  const AddItemScreen({super.key, this.folderId, this.isEditScreen = false, this.item});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  ValueNotifier<List<File>> listOfImages = ValueNotifier([]);

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
      BlocProvider.of<AddItemCubit>(context).initializeEditScreenTextController(widget.item!);
    } else {
      BlocProvider.of<AddItemCubit>(context).initializeTextController();
    }
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
                        listOfImages: listOfImages.value);
                  }),
              const SizedBox(height: 16),

              //Name
               AppText('Name',style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Name',
                  inputType: TextInputType.text,
                  controller: bloc.itemNameController,
                  onTyped: (s) {}),
              //Fabric No.
               AppText('Fabric Number',style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Fabric Number',
                  inputType: TextInputType.number,
                  controller: bloc.fabricNumberController,
                  onTyped: (s) {}),
              //Shop name
               AppText('Shop name',style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Shop Name',
                  inputType: TextInputType.text,
                  controller: bloc.shopNameController,
                  onTyped: (s) {}),
               Row(
                children: [
                  Expanded(child: AppText('Width',style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                  SizedBox(width: 10),
                  Expanded(child: AppText('GSM',style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
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
               Row(
                children: [
                  Expanded(child: AppText('Min. Quantity',style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                  SizedBox(width: 10),
                  Expanded(child: AppText('Unit',style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: customTextField(
                          hintText: '0',
                          inputType: TextInputType.number,
                          controller: bloc.minQuantityController,
                          onTyped: (s) {})),
                  const SizedBox(width: 10),
                  Expanded(
                      child: customTextField(
                          hintText: 'meter',
                          inputType: TextInputType.number,
                          controller: TextEditingController(),
                          onTyped: (s) {})),
                ],
              ),
               AppText('1 kg',style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Enter in meter',
                  inputType: TextInputType.number,
                  controller: bloc.oneKgController,
                  onTyped: (s) {}),
               AppText('Average',style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Average',
                  inputType: TextInputType.number,
                  controller: bloc.averageController,
                  onTyped: (s) {}),
               AppText('Shortage (%)',style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              customTextField(
                  hintText: 'Shortage',
                  inputType: TextInputType.number,
                  controller: bloc.shortageController,
                  onTyped: (s) {}),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => const AddColorsListWidget()));
                  },
                  child:  Text('Add Colors',style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.blue))),
               AppText('Notes',style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
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
                            BlocProvider.of<AddItemCubit>(context).editItems(context, widget.folderId, widget.item!.id);
                          } else {
                            BlocProvider.of<AddItemCubit>(context).addItems(context, widget.folderId);
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
