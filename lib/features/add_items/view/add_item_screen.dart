import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/features/add_items/widgets/image_upload_button.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0.0,
          surfaceTintColor: Colors.white,
          elevation: 0.0,
          title: AppText(
            'Add Items',
            style: const TextStyle().defaultTextStyle(fontSize: 18),
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
              const AppText('Name'),
              customTextField(hintText: 'Name', inputType: TextInputType.text),
              //Fabric No.
              const AppText('Fabric Number'),
              customTextField(
                  hintText: 'Fabric Number', inputType: TextInputType.number),
              //Shop name
              const AppText('Shop name'),
              customTextField(
                  hintText: 'Shop Name', inputType: TextInputType.text),
              const Row(
                children: [
                  Expanded(child: AppText('Width')),
                  SizedBox(width: 10),
                  Expanded(child: AppText('GSM')),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: customTextField(
                          hintText: '150 cm', inputType: TextInputType.number)),
                  const SizedBox(width: 10),
                  Expanded(
                      child: customTextField(
                          hintText: 'GSM', inputType: TextInputType.text)),
                ],
              ),
              const AppText('1 kg'),
              customTextField(
                  hintText: 'Enter in meter', inputType: TextInputType.text),
              const AppText('Average'),
              customTextField(
                  hintText: 'Average', inputType: TextInputType.text),
              const AppText('Shortage (%)'),
              customTextField(
                  hintText: 'Shortage', inputType: TextInputType.number),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 8.0,
            right: 16,
            left: 16,
            top: 4),
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
                    title: 'Save',
                    color: Colors.orangeAccent,
                    onPressed: () {})),
          ],
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
                const AppText('Pick Images'),
                const SizedBox(height: 10),
                pickOptionWidget('Gallery', () async {
                  Navigator.of(context).pop();
                  final List<XFile>? pickedImages =
                      await ImagePicker().pickMultiImage();
                  log(pickedImages!.toString());
                  if (pickedImages != null && pickedImages.isNotEmpty) {
                    List<File> images =
                        pickedImages.map((xFile) => File(xFile.path)).toList();
                    updateListOfImages(images);
                  }
                }),
                pickOptionWidget('Camera', () async {
                  Navigator.of(context).pop();
                  final XFile? pickedImages =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  log(pickedImages!.toString());
                  updateListOfImages([File(pickedImages.path)]);
                }),
              ],
            ),
          );
        });
  }
}

Widget customTextField(
    {String hintText = '', TextInputType inputType = TextInputType.text}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: TextFormField(
      minLines: 1,
      maxLines: 5,
      inputFormatters: inputType == TextInputType.number
          ? [
              FilteringTextInputFormatter
                  .singleLineFormatter, // Only allows digits
              SingleDecimalInputFormatter(), // Custom formatter for decimal
            ]
          : [],
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      keyboardType: inputType,
      onSaved: (phone) {
        // Save it
      },
    ),
  );
}

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
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
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
