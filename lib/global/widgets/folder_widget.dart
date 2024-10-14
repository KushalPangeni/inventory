import 'package:flutter/material.dart';
import 'package:inventory/global/bottom_modal_sheets/folder_item_more_bottom_modal_sheet.dart';

class FolderWidget extends StatelessWidget {
  final String folderName;

  const FolderWidget({super.key, required this.folderName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image
          Container(
            decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.ac_unit, size: 80),
          ),
          const SizedBox(width: 10),
          //Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fabric number',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(folderName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                const Text('1500 Units / \$1,00,000',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
          ),
          //Menu
          GestureDetector(
              onTap: () {
                FolderItemMoreBottomModalSheet(context).showBottomSheet(title: folderName);
              },
              child: const Icon(Icons.more_vert_rounded))
        ],
      ),
    );
  }
}
