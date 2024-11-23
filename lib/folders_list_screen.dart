import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/tags/cubit/tags_cubit.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';
import 'package:toastification/toastification.dart';

import 'features/add_items/cubits/add_item_cubit.dart';
import 'features/add_items/view/item_list_screen.dart';
import 'global/bottom_modal_sheets/add_new_items_bottom_modal_sheet.dart';
import 'global/widgets/folder_summary_top_bar.dart';
import 'global/widgets/folder_widget.dart';
import 'main.dart';
import 'network/exception.dart';

class FoldersListScreen extends StatefulWidget {
  const FoldersListScreen({super.key});

  @override
  State<FoldersListScreen> createState() => _FoldersListScreenState();
}

class _FoldersListScreenState extends State<FoldersListScreen> {
  ValueNotifier<int?> folderId = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FolderCubit>(context).getFolders();
    BlocProvider.of<AddItemCubit>(context).getItems();
    BlocProvider.of<TagsCubit>(context).getTags();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(scrolledUnderElevation: 0.0, backgroundColor: Colors.white, title: const FolderSummaryTopBar()),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<FolderCubit>(context).getFolders();
          BlocProvider.of<TagsCubit>(context).getTags();
          // BlocProvider.of<AddItemCubit>(context).getItems();
          //          BlocProvider.of<AddItemCubit>(context).deleteItem(5);
        },
        child: BlocBuilder<AddItemCubit, AddItemState>(
          builder: (context, itemState) {
            return BlocBuilder<FolderCubit, FolderState>(
              builder: (context, state) {
                return itemState.status is LoadingState || state.status is LoadingState
                    ? const Center(child: CircularProgressIndicator(strokeWidth: 1))
                    : itemState.listOfItems.isEmpty && state.listOfFolders.isEmpty
                        ? SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Container(
                                height: 500,
                                color: Colors.white,
                                child: const Center(child: AppText('No folders or Items Found'))),
                          )
                        : ListView.builder(
                            itemCount: state.listOfFolders.length,
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  // folderId.value = state.listOfFolders[index].id;
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              ItemsListScreen(folder: state.listOfFolders[index], index: index)));
                                },
                                child: FolderWidget(folder: state.listOfFolders[index])));
              },
            );
          },
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          AddNewItemsBottomModalSheet(context, folderId.value, canBuildItem: false).showBottomSheet();
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
