import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/features/add_items/widgets/add_colors_list_widget.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';

class MoveReasonScreen extends StatefulWidget {
  const MoveReasonScreen({super.key});

  @override
  State<MoveReasonScreen> createState() => _MoveReasonScreenState();
}

class _MoveReasonScreenState extends State<MoveReasonScreen> {
  ValueNotifier<String?> moveReason = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    List<String> listOfDropDown = ['Completed', 'Sold Out', 'Dispatched', 'By Air'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const AppText('Move Folder', style: TextStyle(fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText("Do you want to move 'Folder 1' to 'Folder 2'?",
                maxLines: 3, style: TextStyle(fontSize: 16)),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: AppText("Select Reason to Move (Optional)",
                  maxLines: 3, style: TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 6),
            Container(
              width: MediaQuery.sizeOf(context).width - 32,
              padding: const EdgeInsets.only(left: 8, right: 8),
              decoration:
                  BoxDecoration(color: Colors.teal[50], borderRadius: BorderRadius.circular(8)),
              child: ValueListenableBuilder<String?>(
                valueListenable: moveReason,
                builder: (context, reason, _) {
                  return DropdownButton<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      value: moveReason.value,
                      isExpanded: true,
                      autofocus: true,
                      alignment: Alignment.centerLeft,
                      underline: const SizedBox(),
                      menuMaxHeight: 150,
                      items: [
                        ...List.generate(
                          listOfDropDown.length,
                          (index) => DropdownMenuItem(
                            value: listOfDropDown[index],
                            child: Text(listOfDropDown[index]),
                          ),
                        ),
                      ],
                      onChanged: (s) {
                        moveReason.value = s;
                      });
                },
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 12),
                child: AppText('Move Note', maxLines: 3, style: TextStyle(fontSize: 14))),
            customTextField(controller: TextEditingController(), onTyped: (s) {})
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppButton(title: 'Move', color: Colors.orangeAccent, onPressed: () {}),
      ),
    );
  }
}
