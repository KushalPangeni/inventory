import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart';
import 'package:inventory/features/add_items/widgets/add_colors_list_widget.dart';
import 'package:inventory/features/add_items/widgets/image_upload_button.dart';
import 'package:inventory/features/tags/cubit/tags_cubit.dart';
import 'package:inventory/features/tags/view/add_tags_screen.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/global/widgets/chip_widget.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

class AddFolderScreen extends StatefulWidget {
  final bool isEditScreen;
  final Folder? folder;
  final int folderId;

  const AddFolderScreen({super.key, this.isEditScreen = false, this.folder, this.folderId = 0});

  @override
  State<AddFolderScreen> createState() => _AddFolderScreenState();
}

class _AddFolderScreenState extends State<AddFolderScreen> {
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
    if (widget.isEditScreen && widget.folder != null) {
      BlocProvider.of<FolderCubit>(context)
        ..folderDescriptionController.text = widget.folder!.description
        ..folderNameController.text = widget.folder!.name
        // ..setFolderDetails(folderName: widget.folder!.name, folderDescription: widget.folder!.description)
        ..setTagForEditScreen(widget.folder!.tags);
    }
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<FolderCubit>(context);
    return PopScope(
      canPop: true,
      onPopInvoked: (s) {
        bloc.clearAll();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            scrolledUnderElevation: 0.0,
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: AppText(
              '${widget.isEditScreen ? 'Edit' : 'Add'} Folder',
              style: const TextStyle().defaultTextStyle(fontSize: 18),
            )),
        body: BlocBuilder<FolderCubit, FolderState>(
          builder: (context, state) {
            return Padding(
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
                    const AppText('Folder Name'),
                    customTextField(
                        hintText: 'Enter Folder Name',
                        inputType: TextInputType.text,
                        controller: bloc.folderNameController,
                        onTyped: (s) {
                          // bloc.setFolderDetails(folderName: s);
                        }),

                    //Tags
                    const AppText('Tags'),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) => const AddTagsScreen(saveToFolderTag: true)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFE4E4E7), width: 1.0),
                          ),
                          child: state.foldersTag.isEmpty
                              ? const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: AppText('Select Tag'),
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      runSpacing: 4,
                                      spacing: 4,
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      children: [
                                        ...List.generate(
                                          state.foldersTag.length,
                                          (index) => ChipWidget(
                                            text: state.foldersTag[index].name,
                                            onSelected: (s) {},
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),

                    //Description
                    const AppText('Description'),
                    customTextField(
                        hintText: 'Enter Description',
                        inputType: TextInputType.text,
                        controller: bloc.folderDescriptionController,
                        maxLines: 5,
                        onTyped: (s) {
                          // bloc.setFolderDetails(folderDescription: s);
                        }),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<FolderCubit, FolderState>(
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
                            Navigator.of(context).pop();
                          })),
                  const SizedBox(width: 10),
                  Flexible(
                      flex: 2,
                      child: AppButton(
                          isLoading: state.uploadStatus is LoadingState,
                          title: widget.isEditScreen ? 'Update' : 'Save',
                          color: Colors.orangeAccent,
                          onPressed: () {
                            if (bloc.folderNameController.text.trim().isNotEmpty &&
                                bloc.folderDescriptionController.text.trim().isNotEmpty) {
                              if (state.uploadStatus is! LoadingState) {
                                if (widget.isEditScreen) {
                                  log('Is Edit Screen');

                                  // BlocProvider.of<FolderCubit>(context)
                                  //     .editFolders(context, images: listOfImages.value, folderId: widget.folderId);
                                } else {
                                  BlocProvider.of<FolderCubit>(context).addFolders(context, images: listOfImages.value);
                                }
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  elevation: 10,
                                  backgroundColor: Colors.white,
                                  duration: const Duration(milliseconds: 800),
                                  content: AppText(
                                    'Folder Name and Description is required.',
                                    maxLines: 2,
                                    style: const TextStyle().defaultTextStyle(color: Colors.red),
                                  )));
                            }
                          })),
                ],
              ),
            );
          },
        ),
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
/*
Widget customTextField({String hintText = '', TextInputType inputType = TextInputType.text}) {
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
