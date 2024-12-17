import 'package:flutter/material.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart';
import 'package:inventory/global/bottom_modal_sheets/item_more_bottom_sheet.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/main.dart';

class ItemWidget extends StatelessWidget {
  final int folderId;
  final Item item;
  final Function() onPop;

  const ItemWidget({super.key, required this.item, required this.folderId, required this.onPop});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;

    return screenWidth > maxScreenWidth
        ? Container(
            height: 170,
            width: 240,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.05), borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 80,
                    width: 85,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://static.vecteezy.com/system/resources/previews/047/311/511/non_2x/paper-note-3d-graphic-free-png.png'))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        children: [
                          AppText(item.name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                          AppText(
                            '000${item.id}',
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          AppText('${item.fabricNumber ?? 'No fabric number'} / ${item.quantity}',
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          ItemMoreBottomModalSheet(
                            context,
                            item.id,
                            folderId,
                            () {
                              onPop();
                            },
                          ).showBottomSheet(title: item.name);
                        },
                        icon: const Icon(Icons.more_vert_rounded))
                  ],
                )
              ],
            ),
          )
        : Container(
            height: 90,
            padding: const EdgeInsets.only(top: 5, left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: const Color(0xffefefea)),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://static.vecteezy.com/system/resources/previews/047/311/511/non_2x/paper-note-3d-graphic-free-png.png'))),
                ),
                const SizedBox(width: 10),
                //Description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        '000${item.id}',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      AppText(item.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      AppText('${item.fabricNumber ?? 'No fabric number'} / ${item.quantity}',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
                //Menu
                IconButton(
                    onPressed: () {
                      ItemMoreBottomModalSheet(
                        context,
                        item.id,
                        folderId,
                        () {
                          onPop();
                        },
                      ).showBottomSheet(title: item.name);
                    },
                    icon: const Icon(Icons.more_vert_rounded))
              ],
            ),
          );
  }
}
