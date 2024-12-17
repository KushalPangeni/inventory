import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart' as folder_model;

import 'dotted_container.dart';

class AddImageButton extends StatelessWidget {
  final VoidCallback onTap;
  final Function(int) onDelete;
  final Function(int, int) onDeleteNetworkImage;
  final bool isEditScreen;
  final bool isFromDraftScreen;
  final List<File> listOfImages;
  final List<folder_model.Image> listOfUrlImages;

  const AddImageButton(
      {super.key,
      required this.onTap,
      required this.isEditScreen,
      required this.onDelete,
      required this.isFromDraftScreen,
      required this.listOfImages,
      required this.listOfUrlImages,
      required this.onDeleteNetworkImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(0.5),
      constraints: const BoxConstraints(minHeight: 145),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: DashedRect(
        child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: (listOfImages.length + listOfUrlImages.length == 0)
                ? GestureDetector(
                    onTap: onTap,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_circle_outline,
                            color: Colors.grey,
                            size: 30,
                          ),
                          const SizedBox(height: 8),
                          AppText(
                            'Add Images',
                            style: const TextStyle().defaultTextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            onTap: onTap,
                            child: Container(
                              margin: const EdgeInsets.only(left: 6, top: 12),
                              height: 115,
                              width: 103,
                              child: const DashedRect(
                                child: Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.grey,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listOfImages.length,
                              itemBuilder: (context, index) {
                                // File file = File(listOfImages[index].path);
                                // // Read the bytes from the file
                                // Uint8List bytes = file.readAsBytesSync();
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(right: 10, top: 10),
                                          height: 120,
                                          width: 110,
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.transparent, width: 2),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              // Image.network('${ApiUrl.baseUrl}${listOfImages[index]}'),
                                              // Image.memory(Uint8List.fromList(bytes)),
                                              Image.file(listOfImages[index]),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              onDelete(index);
                                            },
                                            child: const Icon(Icons.delete, color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                        ),
                        SizedBox(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listOfUrlImages.length,
                              itemBuilder: (context, index) {
                                // File file = File(listOfImages[index].path);
                                // // Read the bytes from the file
                                // Uint8List bytes = file.readAsBytesSync();
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(right: 10, top: 10),
                                          height: 120,
                                          width: 110,
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.transparent, width: 2),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Image.network(
                                                listOfUrlImages[index].path,
                                                errorBuilder: (context, a, b) => const Center(child: Icon(Icons.error,color: Colors.red,)),
                                              ),
                                              // Image.memory(Uint8List.fromList(bytes)),
                                              // Image.file(listOfImages[index]),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              onDeleteNetworkImage(index, listOfUrlImages[index].id);
                                            },
                                            child: const Icon(Icons.delete, color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  )),
      ),
    );
  }
}
