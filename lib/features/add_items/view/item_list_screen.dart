import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart';
import 'package:inventory/features/add_items/cubits/add_item_cubit.dart';
import 'package:inventory/global/bottom_modal_sheets/add_new_items_bottom_modal_sheet.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/global/widgets/folder_widget.dart';

import 'item_widget.dart';

class ItemsListScreen extends StatefulWidget {
  final int index;
  final Folder folder;

  const ItemsListScreen({super.key, required this.folder, required this.index});

  @override
  State<ItemsListScreen> createState() => _ItemsListScreenState();
}

class _ItemsListScreenState extends State<ItemsListScreen> {
  ValueNotifier<Folder?> folderNotifier = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    getFoldersUsingId();
    // callApi();
  }

  callApi() {
    final jsonResponse = {
      "result": {
        "id": 2,
        "name": "folder 2",
        "description": "folder 2",
        "parent_folder_id": 0,
        "total_price": 0,
        "total_units": 0,
        "images": [],
        "subFolders": [
          {"id": 1, "name": "abcda 1", "description": "folder 1", "total_price": 0, "total_units": 0}
        ],
        "tags": [
          {"id": 1, "name": "add"},
          {"id": 2, "name": "tag"}
        ],
        "items": []
      },
      "message": "Success",
      "status": 1
    };
    try {
      final historyResponse = FolderOnlyModel.fromJson(jsonResponse);
      log('FOlder response ==> $historyResponse');
    } catch (e) {
      log("Json Parsing Error: $e");
    }
  }

  getFoldersUsingId() async {
    Folder? folder = await BlocProvider.of<FolderCubit>(context).getFolders(folderId: widget.folder.id);
    folderNotifier.value = folder;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          title: AppText(
            widget.folder.name,
            style: const TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          )),
      body: RefreshIndicator(
        onRefresh: () async {
          await getFoldersUsingId();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          child: ValueListenableBuilder<Folder?>(
            valueListenable: folderNotifier,
            builder: (context, folder, _) {
              return BlocBuilder<AddItemCubit, AddItemState>(
                builder: (context, state) {
                  return folder == null
                      ? const SizedBox(height: 500, child: Center(child: CircularProgressIndicator(strokeWidth: 1)))
                      : folder.items.isEmpty && folder.subFolders.isEmpty
                          ? const SizedBox(height: 500, child: Center(child: AppText('No Folders/Items here.')))
                          : ConstrainedBox(
                              constraints: const BoxConstraints(minHeight: 500),
                              child: Column(
                                children: [
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: folder.subFolders.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  ItemsListScreen(folder: folder.subFolders[index], index: index)),
                                        );
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: FolderWidget(
                                          folder: folder.subFolders[index],
                                          parentFolderId: widget.folder.id,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: folder.items.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => ItemWidget(
                                      folderId: folder.id,
                                      item: folder.items[index],
                                    ),
                                  ),
                                ],
                              ),
                            );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          AddNewItemsBottomModalSheet(context, widget.folder.id).showBottomSheet();
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
