import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/features/add_items/widgets/add_colors_list_widget.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';

import 'move_quantity_screen.dart';

class MoveScreen extends StatelessWidget {
  const MoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listOfFolders = [
      'Folder Testing For Multiple line text two lines',
      'Folder 2',
      'Folder 3'
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const AppText('Select Folder', style: TextStyle(fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextField(
                controller: TextEditingController(), onTyped: (s) {}, hintText: 'Search Folder'),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.folder),
                SizedBox(width: 6),
                AppText('All Folders', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 6),
            ...List.generate(
              listOfFolders.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: index == 0 ? Colors.orangeAccent[100] : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 6, bottom: 6, right: 2),
                    child: Row(
                      children: [
                        const Icon(Icons.folder),
                        const SizedBox(width: 6),
                        Flexible(
                          child: AppText(
                            listOfFolders[index],
                            maxLines: 1,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppButton(
            title: 'Next',
            color: Colors.orangeAccent,
            onPressed: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => const MoveQuantityScreen()));
            }),
      ),
    );
  }
}
