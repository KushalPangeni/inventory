import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/features/add_items/view/add_item_screen.dart';
import 'package:page_transition/page_transition.dart';

class AddNewItemsBottomModalSheet {
  final BuildContext context;

  AddNewItemsBottomModalSheet(this.context);

  showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                const Text('Adding to Items:'),
                const SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: const AddItemScreen(),
                              inheritTheme: true,
                              ctx: context));
                    },
                    child: listTileAddFileFolder(Icons.file_open_outlined, 'Add Items')),
                listTileAddFileFolder(Icons.file_open_outlined, 'Add Folders'),
              ],
            ),
          );
        });
  }

  showDialogModal() {
    showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text('Adding to Items:'),
                  const SizedBox(height: 10),
                  listTileAddFileFolder(Icons.file_open_outlined, 'Add Items'),
                  listTileAddFileFolder(Icons.file_open_outlined, 'Add Folders'),
                ],
              ),
            ),
          );
        });
  }
}

Widget listTileAddFileFolder(IconData iconData, String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [Icon(iconData, size: 40), const SizedBox(width: 20), Text(title)],
        ),
      ),
    ),
  );
}
