import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/add_items/widgets/add_colors_list_widget.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart' as folder_model;
import 'package:inventory/network/api_request_state/api_request_state.dart';
import 'package:inventory/network/exception.dart';
import 'package:toastification/toastification.dart';

class MoveReasonScreen extends StatefulWidget {
  final folder_model.Folder selectedFolder;
  final folder_model.Folder destinationFolder;

  const MoveReasonScreen({super.key, required this.selectedFolder, required this.destinationFolder});

  @override
  State<MoveReasonScreen> createState() => _MoveReasonScreenState();
}

class _MoveReasonScreenState extends State<MoveReasonScreen> {
  ValueNotifier<String?> moveReason = ValueNotifier(null);
  TextEditingController noteController = TextEditingController(text: ' ');

  @override
  Widget build(BuildContext context) {
    List<String> listOfDropDown = [
      'Completed',
      'Sold Out',
      'Dispatched',
      'By Air',
      'Completed 1',
      'Sold Out 1',
      'Dispatched 1',
      'By Air 1'
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppText('Move Folder',
            style: const TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    child: Image.asset(
                      'assets/folder.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AppText(widget.selectedFolder.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const AppText('  --->  '),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    child: Image.asset(
                      'assets/folder.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AppText(widget.destinationFolder.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            // AppText("Do you want to move ${widget.selectedFolder.name} to 'Folder 2'?", maxLines: 3, style: TextStyle(fontSize: 16)),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: AppText("Select Reason to Move",
                  maxLines: 3, style: const TextStyle().defaultTextStyle(fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 6),
            Container(
              width: MediaQuery.sizeOf(context).width - 32,
              padding: const EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(color: Colors.teal.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
              child: ValueListenableBuilder<String?>(
                valueListenable: moveReason,
                builder: (context, reason, _) {
                  return DropdownButton<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      value: moveReason.value,
                      isExpanded: true,
                      autofocus: true,
                      alignment: Alignment.centerLeft,
                      underline: const SizedBox(),
                      // menuMaxHeight: 350,
                      items: [
                        ...List.generate(
                          listOfDropDown.length,
                          (index) => DropdownMenuItem(
                            value: listOfDropDown[index],
                            child: AppText(
                              listOfDropDown[index],
                              style: const TextStyle().defaultTextStyle(),
                            ),
                          ),
                        ),
                      ],
                      onChanged: (s) {
                        moveReason.value = s;
                      });
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 12),
                child: AppText('Move Note',
                    maxLines: 3, style: const TextStyle().defaultTextStyle(fontWeight: FontWeight.w600))),
            customTextField(controller: noteController, onTyped: (s) {})
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<String?>(
        valueListenable: moveReason,
        builder: (context, reason, _) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<FolderCubit, FolderState>(
            builder: (context, state) {
              return AppButton(
                  title: 'Move',
                  isLoading: state.moveStatus is LoadingState,
                  color: Colors.orangeAccent,
                  onPressed: () {
                    if (reason == null || reason.trim().isEmpty) {
                      showToast(context, 'Invalid', 'Please Select Reason to Move', ToastificationType.warning);
                    } else {
                      BlocProvider.of<FolderCubit>(context).moveFolder(context,
                          reasonToMove: reason,
                          destinationFolderId: widget.destinationFolder.id,
                          folderId: widget.selectedFolder.id,
                          note: noteController.text);
                    }
                  });
            },
          ),
        ),
      ),
    );
  }
}
