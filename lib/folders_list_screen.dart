import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/add_items/view/item_widget.dart';
import 'package:inventory/features/tags/cubit/tags_cubit.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

import 'features/add_folders/view/add_folder_screen.dart';
import 'features/add_items/cubits/add_item_cubit.dart';
import 'features/add_items/view/add_item_screen.dart';
import 'features/add_items/view/item_list_screen.dart';
import 'global/bottom_modal_sheets/add_new_items_bottom_modal_sheet.dart';
import 'global/widgets/folder_summary_top_bar.dart';
import 'global/widgets/folder_widget.dart';
import 'main.dart';

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
    callOnScreenInitRefresh();
  }

  callOnScreenInitRefresh() {
    BlocProvider.of<FolderCubit>(context).getFolders();
    BlocProvider.of<AddItemCubit>(context).getItems();
    BlocProvider.of<TagsCubit>(context).getTags();
    //          BlocProvider.of<AddItemCubit>(context).deleteItem(5);
  }

  @override
  Widget build(BuildContext context) {
    if(kIsWeb){
      log('It is running in Web.');
    }else{
      log('It is running in Web Not.');
    }

    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          bottom: const PreferredSize(
            preferredSize: Size(double.infinity,1),
            child: Divider(),
          ),
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                  'All Items',
                  style: const TextStyle().defaultTextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                if (screenWidth > maxScreenWidth) ...[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => AddItemScreen(
                                    folderId: folderId.value,
                                    onPop: () {
                                      callOnScreenInitRefresh();
                                    },
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppText(
                          'Add Items',
                          style: const TextStyle()
                              .defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => AddFolderScreen(
                                    folderId: folderId.value,
                                    onPop: () {
                                      callOnScreenInitRefresh();
                                    },
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppText(
                          'Add Folders',
                          style: const TextStyle()
                              .defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: FolderSummaryTopBar(),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                callOnScreenInitRefresh();
              },
              child: BlocBuilder<AddItemCubit, AddItemState>(
                builder: (context, itemState) {
                  return BlocBuilder<FolderCubit, FolderState>(
                    builder: (context, state) {
                      return itemState.status is LoadingState || state.status is LoadingState
                          ? const SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: SizedBox(
                                  height: 500, child: Center(child: CircularProgressIndicator(strokeWidth: 1))))
                          : itemState.listOfItems.isEmpty && state.listOfFolders.isEmpty
                              ? SingleChildScrollView(
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  child: Container(
                                      height: 500,
                                      color: Colors.transparent,
                                      child: const Center(child: AppText('No folders or Items Found'))),
                                )
                              : SingleChildScrollView(
                                  physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - 300),
                                    child: Column(
                                      children: [
                                        screenWidth > maxScreenWidth
                                            ? Wrap(
                                                children: List.generate(
                                                    state.listOfFolders.length + state.listOfItems.length, (index) {
                                                  return index < state.listOfFolders.length
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            // folderId.value = state.listOfFolders[index].id;
                                                            Navigator.push(
                                                                context,
                                                                CupertinoPageRoute(
                                                                    builder: (context) => ItemsListScreen(
                                                                        folder: state.listOfFolders[index],
                                                                        index: index)));
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: FolderWidget(
                                                              folder: state.listOfFolders[index],
                                                              onPop: () {
                                                                callOnScreenInitRefresh();
                                                              },
                                                            ),
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: ItemWidget(
                                                            folderId: 0,
                                                            item: state.listOfItems[index - state.listOfFolders.length],
                                                            onPop: () {
                                                              callOnScreenInitRefresh();
                                                            },
                                                          ),
                                                        );
                                                }),
                                              )
                                            : ListView.builder(
                                                shrinkWrap: true,
                                                physics: const NeverScrollableScrollPhysics(),
                                                itemCount: state.listOfFolders.length,
                                                itemBuilder: (context, index) => InkWell(
                                                  onTap: () {
                                                    // folderId.value = state.listOfFolders[index].id;
                                                    Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                            builder: (context) => ItemsListScreen(
                                                                folder: state.listOfFolders[index], index: index)));
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                                                    child: FolderWidget(
                                                      folder: state.listOfFolders[index],
                                                      onPop: () {
                                                        callOnScreenInitRefresh();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        if (screenWidth < maxScreenWidth)
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: state.listOfItems.length,
                                            itemBuilder: (context, index) => ItemWidget(
                                              folderId: 0,
                                              item: state.listOfItems[index],
                                              onPop: () {
                                                callOnScreenInitRefresh();
                                              },
                                            ),
                                          ),
                                        const SizedBox(height: 40)

                                      ],
                                    ),
                                  ),
                                );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: screenWidth > maxScreenWidth
          ? null
          : GestureDetector(
              onTap: () {
                AddNewItemsBottomModalSheet(context, folderId.value).showBottomSheet(() {
                  callOnScreenInitRefresh();
                });
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
