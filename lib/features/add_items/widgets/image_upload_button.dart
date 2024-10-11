import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inventory/global/widgets/app_text.dart';

import 'dotted_container.dart';

class AddImageButton extends StatelessWidget {
  final VoidCallback onTap;
  final Function(int) onDelete;
  final bool isEditScreen;
  final bool isFromDraftScreen;
  final List<File> listOfImages;

  const AddImageButton(
      {super.key,
      required this.onTap,
      required this.isEditScreen,
      required this.onDelete,
      required this.isFromDraftScreen,
      required this.listOfImages});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(0.5),
      constraints: const BoxConstraints(minHeight: 145),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: DashedRect(
        child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: listOfImages.isEmpty
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
                            style: const TextStyle().defaultTextStyle(
                                color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: listOfImages.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (index == 0)
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: GestureDetector(
                                onTap: onTap,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 6, top: 12),
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
                          GestureDetector(
                            onTap: () {},
                            child: Stack(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  height: 120,
                                  width: 110,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.transparent, width: 2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [Image.file(listOfImages[index])],
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(Icons.delete,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    })),
      ),
    );
  }
}
