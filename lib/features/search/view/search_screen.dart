import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_items/widgets/add_colors_list_widget.dart';
import 'package:inventory/features/search/cubit/search_cubit.dart';
import 'package:inventory/global/bottom_modal_sheets/folder_item_more_bottom_modal_sheet.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/global/widgets/folder_widget.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart' as folder_model;

import '../model/search_response_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
        title: AppText('Search', style: const TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: customTextField(
                    controller: searchController,
                    maxLines: 2,
                    hintText: 'Search',
                    onTyped: (s) {
                      BlocProvider.of<SearchCubit>(context).searchByText(s);
                    }),
              ),
              Flexible(
                  child: state.searchResponse == null
                      ? const SizedBox()
                      : ListView.builder(
                          itemCount: state.searchResponse!.result.folders!.length,
                          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          itemBuilder: (context, index) {
                            return SearchFolderWidget(folder: state.searchResponse!.result.folders![index]);
                          }))
            ],
          );
        },
      ),
    );
  }
}

class SearchFolderWidget extends StatelessWidget {
  final Folder folder;

  const SearchFolderWidget({super.key, required this.folder});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
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
              children: [
                AppText(
                  '000${folder.id}',
                  style: const TextStyle().defaultTextStyle(fontSize: 12),
                ),
                AppText(folder.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle().defaultTextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          //Menu
          IconButton(
              onPressed: () {
                // FolderItemMoreBottomModalSheet(context, folder as folder_model.Folder, folder.id)
                //     .showBottomSheet(title: folder.name ?? '');
              },
              icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
    );
  }
}
