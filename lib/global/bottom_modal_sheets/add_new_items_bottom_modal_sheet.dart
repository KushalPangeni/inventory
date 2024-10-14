import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/features/add_items/view/add_item_screen.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:page_transition/page_transition.dart';

class AddNewItemsBottomModalSheet {
  final BuildContext context;

  AddNewItemsBottomModalSheet(this.context);

  showBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.white,
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
                        child: AppText('Add Items and Folders',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black.withOpacity(0.1)),
                          child: const Icon(Icons.close_rounded)),
                    )
                  ],
                ),
                const SizedBox(height: 36),
                const Divider(),
                const SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context, CupertinoPageRoute(builder: (context) => const AddItemScreen()));
                    },
                    child: listTileAddFileFolder(Icons.file_open_outlined, 'Add Items')),
                listTileAddFileFolder(Icons.folder_outlined, 'Add Folders'),
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
          children: [Icon(iconData, size: 36), const SizedBox(width: 20), AppText(title)],
        ),
      ),
    ),
  );
}
