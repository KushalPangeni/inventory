import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/features/add_folders/view/add_folder_screen.dart';
import 'package:inventory/features/add_items/view/add_item_screen.dart';
import 'package:inventory/global/widgets/app_text.dart';

class AddNewItemsBottomModalSheet {
  final int? folderId;
  final BuildContext context;
  final bool canBuildItem;
  final bool canBuildFolder;


  AddNewItemsBottomModalSheet(this.context, this.folderId, {this.canBuildItem = true, this.canBuildFolder = true});

  showBottomSheet(Function() onPop) {
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
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppText('Add Items and Folders',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle().defaultTextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
                const SizedBox(height: 36),
                const Divider(),
                const SizedBox(height: 10),
                if (canBuildItem)
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context, CupertinoPageRoute(builder: (context) => AddItemScreen(folderId: folderId,onPop: (){
                              onPop();
                        },)));
                      },
                      child: listTileAddFileFolder(Image.asset('assets/inventory.png', height: 40), 'Add Items')),
                if (canBuildFolder)
                  GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context, CupertinoPageRoute(builder: (context) => AddFolderScreen(folderId: folderId,onPop: (){
                              onPop();
                        },)));
                      },
                      child: listTileAddFileFolder(Image.asset('assets/folder.png', height: 40), 'Add Folders')),
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
                  listTileAddFileFolder(Image.asset('assets/inventory.png', height: 24), 'Add Items'),
                  listTileAddFileFolder(Image.asset('assets/inventory.png', height: 24), 'Add Folders'),
                ],
              ),
            ),
          );
        });
  }
}

Widget listTileAddFileFolder(Widget icon, String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 20),
            AppText(title, style: const TextStyle().defaultTextStyle(fontSize: 16, fontWeight: FontWeight.w600))
          ],
        ),
      ),
    ),
  );
}
