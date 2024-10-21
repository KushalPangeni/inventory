import 'package:flutter/material.dart';
import 'package:inventory/features/add_items/widgets/add_colors_list_widget.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';

class AddTagsScreen extends StatelessWidget {
  const AddTagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: AppText(
          'Tags',
          style: const TextStyle().defaultTextStyle(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {
                addTags(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

addTags(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppText('Add Tags', style: TextStyle(fontSize: 18)),
                  const Divider(),
                  TextField(controller: TextEditingController()),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(child: AppButton(height: 40, title: 'Cancel', onPressed: () {})),
                      SizedBox(width: 8),
                      Flexible(
                          child: AppButton(
                              height: 40,
                              title: 'Save',
                              color: Colors.orangeAccent,
                              onPressed: () {})),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
