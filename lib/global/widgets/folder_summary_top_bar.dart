import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/add_items/cubits/add_item_cubit.dart';
import 'package:inventory/global/widgets/app_text.dart';

class FolderSummaryTopBar extends StatelessWidget {
  const FolderSummaryTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddItemCubit,AddItemState>(
      builder: (context, itemState) {
        return BlocBuilder<FolderCubit, FolderState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                nameQuantity('Folders', '${state.listOfFolders.length}'),
                nameQuantity('Items', '${itemState.listOfItems.length}'),
                nameQuantity('Total Qty', '- units'),
                nameQuantity('Total value', '-'),

              ],
            );
          },
        );
      },
    );
  }

  Widget nameQuantity(String title, String quantity) {
    return Column(
      children: [
        Text(title,
            style:
            const TextStyle().defaultTextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        Text(quantity,
            style:
            const TextStyle().defaultTextStyle(fontSize: 16, fontWeight: FontWeight.w700))
      ],
    );
  }
}
