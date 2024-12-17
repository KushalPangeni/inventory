import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart' as import_item;
import 'package:inventory/features/add_items/cubits/add_item_cubit.dart';
import 'package:inventory/features/add_items/view/add_item_screen.dart';
import 'package:inventory/features/history/history_screen.dart';
import 'package:inventory/features/move/for_items/view/move_screen.dart';
import 'package:inventory/global/widgets/app_text.dart';

class ItemMoreBottomModalSheet {
  final int itemId;
  final int folderId;
  final BuildContext context;
  final Function() onPop;

  ItemMoreBottomModalSheet(this.context, this.itemId, this.folderId, this.onPop);

  ValueNotifier<import_item.Item?> item = ValueNotifier(null);

  fetchItem() async {
    var (isSuccess, itemFetched) = await BlocProvider.of<AddItemCubit>(context).getItemsById(itemId: itemId);
    if (isSuccess) {
      item.value = itemFetched;
    }
  }

  showBottomSheet({String title = 'Folder/Item Name ;'}) {
    fetchItem();
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
                ValueListenableBuilder<import_item.Item?>(
                    valueListenable: item,
                    builder: (context, item, _) {
                      return item == null
                          ? SizedBox(
                              height: 350,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AppText(title,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle()
                                                  .defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
                                  const Divider(),
                                  const Spacer(),
                                  const CircularProgressIndicator(strokeCap: StrokeCap.round),
                                  const Spacer(),
                                ],
                              ),
                            )
                          : Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AppText(title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle()
                                              .defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
                              const Divider(),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                ItemsMoveScreen(selectedItem: item, parentId: itemId)));
                                  },
                                  child: listTileAddFileFolder(Image.asset('assets/move.png', height: 28), 'Move')),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                HistoryScreen(folderItemId: itemId, isFolder: false)));
                                  },
                                  child:
                                      listTileAddFileFolder(Image.asset('assets/history.png', height: 28), 'History')),
                              listTileAddFileFolder(Image.asset('assets/export.png', height: 28), 'Export'),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                AddItemScreen(folderId: folderId, isEditScreen: true, item: item,onPop: (){
                                                  onPop();
                                                },)));
                                  },
                                  child: listTileAddFileFolder(Image.asset('assets/edit.png', height: 28), 'Edit')),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    BlocProvider.of<AddItemCubit>(context).deleteItem(itemId);
                                    BlocProvider.of<AddItemCubit>(context).getItems();
                                  },
                                  child: listTileAddFileFolder(Image.asset('assets/delete.png', height: 28), 'Delete')),
                            ]);
                    }),
              ],
            ),
          );
        });
  }

/*showDialogModal() {
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
  }*/
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
            AppText(title, style: const TextStyle().defaultTextStyle(fontWeight: FontWeight.w600))
          ],
        ),
      ),
    ),
  );
}
