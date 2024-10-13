import 'package:flutter/material.dart';

import 'global/bottom_modal_sheets/add_new_items_bottom_modal_sheet.dart';
import 'global/widgets/folder_summary_top_bar.dart';
import 'global/widgets/folder_widget.dart';

class FoldersListScreen extends StatefulWidget {
  const FoldersListScreen({super.key});

  @override
  State<FoldersListScreen> createState() => _FoldersListScreenState();
}

class _FoldersListScreenState extends State<FoldersListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          title: FolderSummaryTopBar()),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            FolderWidget(folderName: 'Folder 1'),
            FolderWidget(folderName: 'Folder 2'),
            FolderWidget(folderName: 'Folder 1 Folder 1 Folder 1 Folder 1 Folder 1'),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          AddNewItemsBottomModalSheet(context).showBottomSheet();
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(color: Colors.orangeAccent, borderRadius: BorderRadius.circular(16)),
          child: const Icon(Icons.add, size: 36, color: Colors.white),
        ),
      ),
    );
  }
}
