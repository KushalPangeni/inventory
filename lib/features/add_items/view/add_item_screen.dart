import 'package:flutter/material.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});

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
              //Add photo
              GestureDetector(
               onTap: (){
                 showBottomSheet(context);
               },

                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 2, color: Colors.black.withOpacity(0.5))),
                  child: const Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText("Add photo"),
                      SizedBox(height: 5),
                      Icon(Icons.add_a_photo),
                    ],
                  )),
                ),
              ),
              const SizedBox(height: 16),

              //Name
              const AppText('Name'),
              customTextField(hintText: 'Name', inputType: TextInputType.text),
              //Fabric No.
              const AppText('Fabric Number'),
              customTextField(hintText: 'Fabric Number', inputType: TextInputType.number),
              //Shop name
              const AppText('Shop name'),
              customTextField(hintText: 'Shop Name', inputType: TextInputType.text),
              const Row(
                children: [
                  Expanded(child: AppText('Width')),
                  SizedBox(width: 10),
                  Expanded(child: AppText('GSM')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: customTextField(hintText: '150 cm', inputType: TextInputType.number)),
                  const SizedBox(width: 10),
                  Expanded(child: customTextField(hintText: 'GSM', inputType: TextInputType.text)),
                ],
              ),
              const AppText('1 kg'),
              customTextField(hintText: 'Enter in meter', inputType: TextInputType.text),
              const AppText('Average'),
              customTextField(hintText: 'Average', inputType: TextInputType.text),
              const AppText('Shortage'),
              customTextField(hintText: 'Shortage', inputType: TextInputType.text),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 8.0, right: 16, left: 16, top: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(flex: 2, child: AppButton(title: 'Cancel', color: Colors.grey, onPressed: () {
              Navigator.of(context).pop();
            })),
            const SizedBox(width: 10),
            Flexible(flex: 2, child: AppButton(title: 'Save', color: Colors.orangeAccent, onPressed: () {})),
          ],
        ),
      ),
    );
  }
}

Widget customTextField({String hintText = '', TextInputType inputType = TextInputType.text}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: TextFormField(
      minLines: 1,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        // fillColor: Colors.orange[300],
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
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
              pickOptionWidget('Gallery',(){}),
              pickOptionWidget('Camera',(){}),
            ],
          ),
        );
      });
}
pickOptionWidget(String text, void Function()? onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(text),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          )
        ],
      ),
    ),
  );
}
