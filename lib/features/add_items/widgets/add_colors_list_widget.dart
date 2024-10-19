import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory/features/add_items/model/color_model.dart';
import 'package:inventory/features/add_items/view/add_item_screen.dart';
import 'package:inventory/features/cubits/add_item_cubit.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddColorsListWidget extends StatefulWidget {
  const AddColorsListWidget({super.key});

  @override
  State<AddColorsListWidget> createState() => _AddColorsListWidgetState();
}

class _AddColorsListWidgetState extends State<AddColorsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: AppText('Add Colors', style: const TextStyle().defaultTextStyle(fontSize: 18))),
      body: Padding(
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
      ),
      floatingActionButton: GestureDetector(
          onTap: () {
            BlocProvider.of<AddItemCubit>(context).addColorInColorList();
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
              ))),
    );
  }
}

Widget colorWidget(BuildContext context, int index, ColorModel colorModel) {
  TextEditingController colorController = TextEditingController(text: colorModel.colorName);
  TextEditingController quantityController =
      TextEditingController(text: colorModel.quantity.toString());
  TextEditingController rollController = TextEditingController(text: colorModel.roll.toString());

  return Table(
    children: [
      TableRow(
        children: [
          const AppText('Color'),
          const AppText('Quantity'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText('Roll'),
              InkWell(
                  onTap: () {
                    BlocProvider.of<AddItemCubit>(context).deleteColorInColorList(index);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(Icons.delete, color: Colors.red, size: 22),
                  ))
            ],
          ),
        ],
      ),
      TableRow(
        children: [
          customTextField(
              controller: colorController,
              hintText: 'Color name',
              onTyped: (s) {
                BlocProvider.of<AddItemCubit>(context)
                    .editColorItem(index, s, colorModel.quantity, colorModel.roll);
              }),
          customTextField(
              inputType: TextInputType.number,
              controller: quantityController,
              hintText: '0',
              onTyped: (s) {
                BlocProvider.of<AddItemCubit>(context)
                    .editColorItem(index, colorModel.colorName, int.parse(s), colorModel.roll);
              }),
          customTextField(
              inputType: TextInputType.number,
              controller: rollController,
              hintText: '0',
              onTyped: (s) {
                BlocProvider.of<AddItemCubit>(context)
                    .editColorItem(index, colorModel.colorName, colorModel.quantity, int.parse(s));
              }),
        ],
      ),
    ],
  );
}

Widget customTextField(
    {String hintText = '',
    TextInputType inputType = TextInputType.text,
    required TextEditingController controller,
    required Function(String) onTyped}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 4),
    child: TextFormField(
      minLines: 1,
      maxLines: 2,
      controller: controller,
      inputFormatters: inputType == TextInputType.number
          ? [
              FilteringTextInputFormatter.singleLineFormatter, // Only allows digits
              SingleDecimalInputFormatter(), // Custom formatter for decimal
            ]
          : [],
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
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
