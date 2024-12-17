import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart' as folder_model;
import 'package:inventory/features/add_folders/view/add_folder_screen.dart';
import 'package:inventory/features/history/history_screen.dart';
import 'package:inventory/features/move/view/move_screen.dart';
import 'package:inventory/global/bottom_modal_sheets/add_new_items_bottom_modal_sheet.dart';
import 'package:inventory/global/widgets/app_text.dart';

class SearchFolderItemMoreBottomModalSheet {
  final BuildContext context;
  final int folderId;

  SearchFolderItemMoreBottomModalSheet(this.context, this.folderId) {
    searchFolderDetails(folderId);
  }

  ValueNotifier<folder_model.Folder?> folder = ValueNotifier(null);

  searchFolderDetails(int id) async {
    folder.value = await BlocProvider.of<FolderCubit>(context).getFolders(folderId: id);
  }

  showBottomSheet({String title = 'Folder/Item Name ;'}) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return ValueListenableBuilder<folder_model.Folder?>(
            valueListenable: folder,
            builder: (context, folder, _) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: folder == null
                    ? SizedBox(
                        height: 320, width: MediaQuery.sizeOf(context).width, child: const Center(child: CircularProgressIndicator()))
                    : Wrap(
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
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) => MoveScreen(selectedFolder: folder,onPop: (){
                                      searchFolderDetails(folderId);
                                    },)));
                              },
                              child: listTileAddFileFolder(Image.asset('assets/move.png', height: 28), 'Move')),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) => HistoryScreen(folderItemId: folderId)));
                              },
                              child: listTileAddFileFolder(Image.asset('assets/history.png', height: 28), 'History')),
                          listTileAddFileFolder(Image.asset('assets/export.png', height: 28), 'Export'),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => AddFolderScreen(
                                            isEditScreen: true,
                                            folder: folder,
                                            folderId: folderId == 0 ? null : folderId,onPop: (){
                                          searchFolderDetails(folderId);
                                        },)));
                              },
                              child: listTileAddFileFolder(Image.asset('assets/edit.png', height: 28), 'Edit')),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                BlocProvider.of<FolderCubit>(context).deleteFolder(folderId);
                              },
                              child: listTileAddFileFolder(Image.asset('assets/delete.png', height: 28), 'Delete')),
                        ],
                      ),
              );
            },
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

/*Widget listTileAddFileFolder(IconData iconData, String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [Icon(iconData, size: 24), const SizedBox(width: 20), AppText(title,style: TextStyle().defaultTextStyle(fontWeight: FontWeight.w600),)],
        ),
      ),
    ),
  );
}*/
