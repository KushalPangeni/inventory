import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory/core/keyboard_utils.dart';
import 'package:inventory/features/add_items/cubits/add_item_cubit.dart';
import 'package:inventory/features/add_items/model/color_model.dart';
import 'package:inventory/features/add_items/view/add_item_screen.dart';
import 'package:inventory/features/colors/cubit/color_cubit.dart';
import 'package:inventory/features/colors/model/color_model.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

class AddColorsListWidget extends StatefulWidget {
  const AddColorsListWidget({super.key});

  @override
  State<AddColorsListWidget> createState() => _AddColorsListWidgetState();
}

class _AddColorsListWidgetState extends State<AddColorsListWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ColorCubit>(context).getColors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: AppText('Add Colors',
              style: const TextStyle().defaultTextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      body: BlocBuilder<ColorCubit, ColorState>(
        builder: (context, state) {
          return state.status is LoadingState
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BlocBuilder<AddItemCubit, AddItemState>(
                    builder: (context, state) {
                      return state.colorList.isEmpty
                          ? const Center(
                              child: AppText('Use Add Color Button To Add More Colors',
                                  maxLines: 4, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)))
                          : ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                              itemCount: state.colorList.length + 1,
                              itemBuilder: (context, index) {
                                if (index < state.colorList.length) {
                                  return colorWidget(context, index, state.colorList[index]);
                                } else {
                                  return const SizedBox(height: 60);
                                }
                              });
                    },
                  ),
                );
        },
      ),
      floatingActionButton: BlocBuilder<ColorCubit, ColorState>(
        builder: (context, state) {
          return GestureDetector(
              onTap: () {
                BlocProvider.of<AddItemCubit>(context).addColorInColorList(ColorModelF(quantity: 0, roll: 0));
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'Add Color',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )));
        },
      ),
    );
  }
}

Widget colorWidget(BuildContext context, int index, ColorModelF colorModel) {
  TextEditingController numberController = TextEditingController(text: colorModel.number.toString());
  TextEditingController quantityController = TextEditingController(text: colorModel.quantity.toString());
  TextEditingController rollController = TextEditingController(text: colorModel.roll.toString());
  ValueNotifier<int?> dropdownValue = ValueNotifier(colorModel.colorId);

  return BlocBuilder<ColorCubit, ColorState>(
    builder: (context, state) {
      List<ColorModel> listOfColors = state.listOfUnits;
      // dropdownValue.value = state.listOfUnits.first.id;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText('Color',
                      style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  state.listOfUnits.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 0, right: 4),
                          child: Container(
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: const Color(0xFFE4E4E7))),
                            child: ValueListenableBuilder<int?>(
                              valueListenable: dropdownValue,
                              builder: (context, colorId, _) => DropdownButton<int?>(
                                value: dropdownValue.value,
                                icon: const SizedBox(),
                                elevation: 16,
                                style: const TextStyle(color: Colors.deepPurple),
                                underline: const SizedBox(),
                                onChanged: (int? value) {
                                  // This is called when the user selects an item.
                                  log("$value ?? 'No id'");
                                  dropdownValue.value = value;
                                  BlocProvider.of<AddItemCubit>(context).editColorItem(index, colorId: value);
                                },
                                items: state.listOfUnits.map<DropdownMenuItem<int>>((ColorModel value) {
                                  return DropdownMenuItem<int>(
                                    value: value.id,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Text(value.name),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        )
                      : const Text("No Colors available", style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText('Number',
                      style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Flexible(
                    child: customTextField(
                        inputType: TextInputType.number,
                        controller: numberController,
                        hintText: '0',
                        onTyped: (s) {
                          BlocProvider.of<AddItemCubit>(context).editColorItem(index, number: int.parse(s));
                        }),
                  ),
                ],
              )),
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText('Quantity',
                      style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Flexible(
                    child: customTextField(
                        inputType: TextInputType.number,
                        controller: quantityController,
                        hintText: '0',
                        onTyped: (s) {
                          BlocProvider.of<AddItemCubit>(context).editColorItem(index, quantity: int.parse(s));
                        }),
                  ),
                ],
              )),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText('Roll',
                            style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              BlocProvider.of<AddItemCubit>(context).deleteColorInColorList(index);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Icon(Icons.delete, color: Colors.red, size: 18),
                            ))
                      ],
                    ),
                    Flexible(
                      child: customTextField(
                          inputType: TextInputType.number,
                          controller: rollController,
                          hintText: '0',
                          onTyped: (s) {
                            BlocProvider.of<AddItemCubit>(context).editColorItem(index, roll: int.parse(s));
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

Widget customTextField(
    {String hintText = '',
    int maxLines = 2,
    TextInputType inputType = TextInputType.text,
    required TextEditingController controller,
    required Function(String) onTyped}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 4),
    child: TextFormField(
      minLines: 1,
      maxLines: maxLines,
      controller: controller,
      onTapOutside: (a){
        KeyboardUtils().hideKeyBoard();
      },
      inputFormatters: inputType == TextInputType.number
          ? [
              FilteringTextInputFormatter.singleLineFormatter, // Only allows digits
              SingleDecimalInputFormatter(), // Custom formatter for decimal
            ]
          : [],
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE4E4E7), width: 1.0),
        ),
        hintText: hintText,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.orange, width: 1.0),
        ),
      ),
      onChanged: (s) {
        onTyped(s);
      },
      keyboardType: inputType,
      onSaved: (phone) {
        // Save it
      },
    ),
  );
}
