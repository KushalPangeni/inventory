import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart' as folder_model;
import 'package:inventory/features/move/view/move_reason_screen.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';

import 'move_quantity_screen.dart';

class MoveScreen extends StatefulWidget {
/*
  final int folderId;
*/
  final folder_model.Folder selectedFolder;

  const MoveScreen({super.key /*, this.folderId = 0*/, required this.selectedFolder});

  @override
  State<MoveScreen> createState() => _MoveScreenState();
}

class _MoveScreenState extends State<MoveScreen> {
  ValueNotifier<folder_model.Folder?> destinationFolder = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    log('Move Screen ==> ${widget.selectedFolder.id}');
    return BlocBuilder<FolderCubit, FolderState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: AppText('Select Folder',
                style: TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                      child: Image.asset('assets/folder.png', height: 40, width: 40),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(widget.selectedFolder.name,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 2),
                        /*const Row(
                          children: [
                            Icon(Icons.folder_outlined),
                            SizedBox(width: 4),
                            AppText('Folder 1', style: TextStyle(fontSize: 14))
                          ],
                        )*/
                      ],
                    ),
                  ],
                ),
                // customTextField(controller: TextEditingController(), onTyped: (s) {}, hintText: 'Search Folder'),
                const SizedBox(height: 24),
                Row(
                  children: [
                    SizedBox(height: 20, child: Image.asset('assets/folder.png')),
                    const SizedBox(width: 6),
                    const AppText('All Folders', style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 6),
                ...List.generate(
                  state.listOfFolders.length,
                  (index) => GestureDetector(
                    onTap: () {
                      if (state.listOfFolders[index].id == widget.selectedFolder.id) {
                      } else {
                        destinationFolder.value = state.listOfFolders[index];
                      }
                    },
                    child: ValueListenableBuilder<folder_model.Folder?>(
                      valueListenable: destinationFolder,
                      builder: (context, folder, _) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: state.listOfFolders[index].id == widget.selectedFolder.id
                                ? Colors.grey[100]
                                : state.listOfFolders[index] == folder
                                    ? Colors.orangeAccent[100]
                                    : Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 6, bottom: 6, right: 2),
                            child: Row(
                              children: [
                                SizedBox(height: 20, child: Image.asset('assets/folder.png')),
                                const SizedBox(width: 6),
                                Flexible(
                                  child: AppText(
                                    state.listOfFolders[index].name,
                                    maxLines: 1,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ValueListenableBuilder<folder_model.Folder?>(
              valueListenable: destinationFolder,
              builder: (context, folder, _) => AppButton(
                  title: 'Next',
                  color: Colors.orangeAccent,
                  isDisabled: folder == null,
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => MoveReasonScreen(
                                  destinationFolder: destinationFolder.value!,
                                  selectedFolder: widget.selectedFolder,
                                )));
                  }),
            ),
          ),
        );
      },
    );
  }
}
