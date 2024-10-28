import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart';
import 'package:inventory/features/add_items/cubits/add_item_cubit.dart';
import 'package:inventory/global/bottom_modal_sheets/add_new_items_bottom_modal_sheet.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

import 'item_widget.dart';

class ItemsListScreen extends StatefulWidget {
  final int index;
  final Folder folder;

  const ItemsListScreen({super.key, required this.folder, required this.index});

  @override
  State<ItemsListScreen> createState() => _ItemsListScreenState();
}

class _ItemsListScreenState extends State<ItemsListScreen> {
  late ValueNotifier<Folder> folderNotifier;

  @override
  void initState() {
    super.initState();
    folderNotifier = ValueNotifier(widget.folder);
    folderNotifier.value = widget.folder;
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
            style: const TextStyle().defaultTextStyle(fontSize: 18,fontWeight: FontWeight.w600),
          )),
      body: ValueListenableBuilder<Folder>(
        valueListenable: folderNotifier,
        builder: (context, folder, _) {
          return BlocBuilder<AddItemCubit, AddItemState>(
            builder: (context, state) {
              return state.status is LoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : widget.folder.items.isEmpty
                      ? const Center(child: AppText('No Items here.'))
                      : ListView.builder(
                          itemCount: widget.folder.items.length,
                          itemBuilder: (context, index) => ItemWidget(
                            item: widget.folder.items[index],
                          ),
                        );
            },
          );
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          AddNewItemsBottomModalSheet(context, widget.folder.id,canBuildFolder: false).showBottomSheet();
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
