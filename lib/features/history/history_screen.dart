import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/colors/cubit/color_cubit.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

class HistoryScreen extends StatefulWidget {
  final int? folderItemId;
  final bool isFolder;

  const HistoryScreen({super.key, this.folderItemId,  this.isFolder = true});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool isLoaded = true;

  @override
  void initState() {
    super.initState();
    if (widget.folderItemId != null) {
      BlocProvider.of<ColorCubit>(context).fetchHistoryById(widget.folderItemId!,isFolder: widget.isFolder);
    } else {
      BlocProvider.of<ColorCubit>(context).fetchHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText('History', style: const TextStyle().defaultTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: BlocBuilder<ColorCubit, ColorState>(
        builder: (context, state) {
          return state.historyStatus is LoadingState
              ? const Center(child: CircularProgressIndicator())
              : state.historyStatus is LoadedState && state.historyModel.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.historyModel.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: AppText(
                                        state.historyModel[index]!.date.toString().split(' ').first,
                                        maxLines: 10,
                                        style: const TextStyle()
                                            .defaultTextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppText(
                                        state.historyModel[index]!.message.toString(),
                                        maxLines: 10,
                                        style: const TextStyle()
                                            .defaultTextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                  : const Center(child: AppText('No history found.'));
        },
      ),
    );
  }
}

/*
  callApi() {
    final jsonResponse = {
      "result": [
        {
          "item_id": 1,
          "item_type": "folder",
          "quantity": 1,
          "date": "2024-11-23 16:24:16",
          "user": null,
          "source_folder": {
            "name": null,
            "id": null
          },
          "destination_folder": {
            "name": null,
            "id": null
          },
          "message": "Folder abcda updated successfully",
          "reason": "no reason provided",
          "action": "",
          "note": null
        },
        {
          "item_id": 1,
          "item_type": "folder",
          "quantity": 1,
          "date": "2024-11-23 16:24:08",
          "user": {
            "name": "SuperAdmin",
            "email": "admin@admin.com"
          },
          "source_folder": {
            "name": null,
            "id": null
          },
          "destination_folder": {
            "name": null,
            "id": null
          },
          "message": "Folder abcda updated successfully",
          "reason": "no reason provided",
          "action": "",
          "note": null
        },



        {
          "item_id": 1,
          "item_type": "folder",
          "quantity": 1,
          "date": "2024-11-23 16:23:39",
          "user": {
            "name": "SuperAdmin",
            "email": "admin@admin.com"
          },
          "source_folder": {
            "name": null,
            "id": null
          },
          "destination_folder": {
            "name": null,
            "id": null
          },
          "message": "Folder abcda updated successfully",
          "reason": "no reason provided",
          "action": "",
          "note": null
        },
        {
          "item_id": 1,
          "item_type": "folder",
          "quantity": 1,
          "date": "2024-11-23 16:22:55",
          "user": null,
          "source_folder": {
            "name": null,
            "id": null
          },
          "destination_folder": {
            "name": null,
            "id": null
          },
          "message": "Folder abcda updated successfully",
          "reason": "no reason provided",
          "action": "",
          "note": null
        },
        {
          "item_id": 1,
          "item_type": "folder",
          "quantity": 1,
          "date": "2024-11-23 16:22:42",
          "user": null,
          "source_folder": {
            "name": null,
            "id": null
          },
          "destination_folder": {
            "name": null,
            "id": null
          },
          "message": "Folder abcd updated successfully",
          "reason": "no reason provided",
          "action": "",
          "note": null
        }

      ],
      "count": 10,
      "message": "Success",
      "status": 1
    };
    try {
      final historyResponse = HistoryResponse.fromJson(jsonResponse);
      log('History response ==> $historyResponse');
    } catch (e) {
      log("Json Parsing Error: $e");
    }
  }

 */
