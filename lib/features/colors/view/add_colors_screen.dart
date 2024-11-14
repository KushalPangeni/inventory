import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/colors/cubit/color_cubit.dart';
import 'package:inventory/features/colors/model/color_model.dart';
import 'package:inventory/features/tags/cubit/tags_cubit.dart';
import 'package:inventory/features/units/cubit/unit_cubit.dart';
import 'package:inventory/features/units/model/unit_model.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

class AddColorsScreen extends StatefulWidget {
  final bool saveToFolderTag;

  const AddColorsScreen({super.key, this.saveToFolderTag = false});

  @override
  State<AddColorsScreen> createState() => _AddColorsScreenState();
}

class _AddColorsScreenState extends State<AddColorsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ColorCubit>(context).getUnits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: AppText(
          'Colors',
          style: const TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocBuilder<FolderCubit, FolderState>(
        builder: (context, folderState) {
          return BlocBuilder<ColorCubit, ColorState>(builder: (context, state) {
            return state.status is LoadingState
                ? const Center(child: CircularProgressIndicator())
                : state.status is ErrorState
                    ? const Center(child: Text('Error occurred.'))
                    : state.listOfUnits.isEmpty
                        ? const Center(
                            child: AppText(
                            maxLines: 1,
                            'No Colors found.',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ))
                        : ListView.separated(
                            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                            separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 1),
                            itemCount: state.listOfUnits.length + 1,
                            itemBuilder: (context, index) {
                              return index < state.listOfUnits.length
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 8.0, bottom: 1, right: 8),
                                      child: InkWell(
                                        onTap: () {
                                          if (widget.saveToFolderTag) {
                                            // BlocProvider.of<FolderCubit>(context).addRemove(state.listOfTags[index]);
                                          } /* else {
                                            BlocProvider.of<TagsCubit>(context).addRemove(state.listOfTags[index]);
                                          }*/
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const SizedBox(width: 4),
                                                Container(
                                                    height: 28,
                                                    width: 28,
                                                    decoration: BoxDecoration(
                                                        color: Colors.orangeAccent[100],
                                                        borderRadius: BorderRadius.circular(4)),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(2.0),
                                                      child: Center(
                                                        child: AppText(state.listOfUnits[index].name[0].toUpperCase(),
                                                            style: const TextStyle().defaultTextStyle(
                                                                fontSize: 16, fontWeight: FontWeight.w600)),
                                                      ),
                                                    )),
                                                const SizedBox(width: 2),
                                                Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                                    child: AppText(
                                                      maxLines: 1,
                                                      state.listOfUnits[index].name,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle()
                                                          .defaultTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            PopupMenuButton<String>(
                                              initialValue: '',
                                              onSelected: (String item) {
                                                BlocProvider.of<UnitCubit>(context)
                                                    .deleteUnit(context, state.listOfUnits[index].id);
                                              },
                                              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                                PopupMenuItem<String>(
                                                  value: state.listOfUnits[index].name,
                                                  child: const Text('Delete'),
                                                ),
                                              ],
                                              child: const Icon(Icons.more_vert_rounded),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox(height: 60);
                            });
          });
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          addColors(context);
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

addColors(BuildContext context) {
  TextEditingController unitNameController = TextEditingController();
  TextEditingController unitSlugController = TextEditingController();
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText('Add Colors',
                      style: const TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  const Divider(),
                  Row(
                    children: [
                      AppText('Color Name: ',
                          style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      Flexible(
                        child: TextField(
                          controller: unitNameController,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AppText('Slug Name: ',
                          style: const TextStyle().defaultTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      Flexible(
                        child: TextField(
                          controller: unitSlugController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(
                          child: AppButton(
                              height: 40,
                              title: 'Cancel',
                              onPressed: () {
                                Navigator.of(context).pop();
                              })),
                      const SizedBox(width: 8),
                      Flexible(
                        child: AppButton(
                          height: 40,
                          title: 'Save',
                          color: Colors.orangeAccent,
                          onPressed: () {
                            BlocProvider.of<ColorCubit>(context).addColors(
                                Color(id: 0, name: unitNameController.text, slug: unitSlugController.text), context);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
