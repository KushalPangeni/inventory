import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart' as import_item;
import 'package:inventory/features/add_items/cubits/add_item_cubit.dart';
import 'package:inventory/features/add_items/view/add_item_screen.dart';
import 'package:inventory/features/move/view/move_screen.dart';
import 'package:inventory/global/widgets/app_text.dart';

class ItemMoreBottomModalSheet {
  final import_item.Item item;
  final int folderId;
  final BuildContext context;

  ItemMoreBottomModalSheet(this.context, this.folderId, this.item);

  showBottomSheet({String title = 'Folder/Item Name ;'}) {
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
                        child: AppText(title,
                            maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 18)),
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
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => const MoveScreen()));
                    },
                    child: listTileAddFileFolder(const Icon(Icons.move_down_rounded), 'Move')),
                listTileAddFileFolder(const Icon(Icons.history_rounded), 'History'),
                listTileAddFileFolder(const Icon(Icons.upload_file_rounded), 'Export'),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>AddItemScreen(folderId: folderId,)));
                    },
                    child: listTileAddFileFolder(const Icon(Icons.details_rounded), 'Details')),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      BlocProvider.of<AddItemCubit>(context).deleteItem(item.id);
                      BlocProvider.of<AddItemCubit>(context).getItems();
                    },
                    child: listTileAddFileFolder(const Icon(Icons.delete_forever), 'Delete')),
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
                  listTileAddFileFolder(Image.asset('assets/folder.png', height: 24), 'Add Folders'),
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
            icon, const SizedBox(width: 20), AppText(title)],
        ),
      ),
    ),
  );
}
