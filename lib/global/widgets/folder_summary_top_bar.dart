import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/add_items/cubits/add_item_cubit.dart';
import 'package:inventory/global/widgets/app_text.dart';

class FolderSummaryTopBar extends StatefulWidget {
  const FolderSummaryTopBar({super.key});

  @override
  State<FolderSummaryTopBar> createState() => _FolderSummaryTopBarState();
}

class _FolderSummaryTopBarState extends State<FolderSummaryTopBar> {
  @override
  void initState() {
    super.initState();
    fetchStatistics();
  }

  fetchStatistics() async {
    BlocProvider.of<FolderCubit>(context).getStats();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddItemCubit, AddItemState>(
      builder: (context, itemState) {
        return BlocBuilder<FolderCubit, FolderState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                nameQuantity('Folders',
                    state.stats != null ? state.stats!.folder.toString() : '-'),
                nameQuantity('Items',
                    state.stats != null ? state.stats!.item.toString() : '-'),
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
            style: const TextStyle()
                .defaultTextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        Text(quantity,
            style: const TextStyle()
                .defaultTextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
      ],
    );
  }
}
