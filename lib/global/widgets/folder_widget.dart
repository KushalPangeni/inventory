import 'package:flutter/material.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart' as folder_model;
import 'package:inventory/global/bottom_modal_sheets/folder_item_more_bottom_modal_sheet.dart';
import 'package:inventory/global/widgets/app_text.dart';

class FolderWidget extends StatelessWidget {
  final folder_model.Folder folder;
  final int? parentFolderId;

  const FolderWidget({super.key, required this.folder, this.parentFolderId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: const Color(0xffefefea)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/folder.png'),
            ),
          ),
          const SizedBox(width: 10),
          //Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppText(
                  '000${folder.id}',
                  style: const TextStyle().defaultTextStyle(fontSize: 12),
                ),
                AppText(folder.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle()
                        .defaultTextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                AppText('${folder.totalUnits} / ${folder.totalPrice}',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
          ),
          //Menu
          IconButton(
              onPressed: () {
                FolderItemMoreBottomModalSheet(context, folder, folder.id,parentFolderId).showBottomSheet(title: folder.name);
              },
              icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
    );
  }
}
