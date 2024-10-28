import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart';
import 'package:inventory/features/add_folders/view/add_folder_screen.dart';
import 'package:inventory/features/move/view/move_screen.dart';
import 'package:inventory/global/widgets/app_text.dart';

class FolderItemMoreBottomModalSheet {
  final Folder folder;
  final BuildContext context;
  final int folderId;

  FolderItemMoreBottomModalSheet(this.context, this.folder, this.folderId);

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
                            maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
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
                    child: listTileAddFileFolder(Icons.move_down_rounded, 'Move')),
                listTileAddFileFolder(Icons.history_rounded, 'History'),
                listTileAddFileFolder(Icons.upload_file_rounded, 'Export'),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  AddFolderScreen(isEditScreen: true, folder: folder, folderId: folderId)));
                    },
                    child: listTileAddFileFolder(Icons.details_rounded, 'Details')),
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                      BlocProvider.of<FolderCubit>(context).deleteFolder(folderId);
                    },
                    child: listTileAddFileFolder(Icons.delete_forever, 'Delete')),
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
          children: [Icon(iconData, size: 24), const SizedBox(width: 20), AppText(title,style: TextStyle().defaultTextStyle(fontWeight: FontWeight.w600),)],
        ),
      ),
    ),
  );
}
