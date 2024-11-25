import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:inventory/features/colors/cubit/color_cubit.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

class HistoryScreen extends StatefulWidget {
  final int? folderItemId;
  final bool isFolder;

  const HistoryScreen({super.key, this.folderItemId, this.isFolder = true});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool isLoaded = true;

  @override
  void initState() {
    super.initState();
    if (widget.folderItemId != null) {
      BlocProvider.of<ColorCubit>(context).fetchHistoryById(widget.folderItemId!, isFolder: widget.isFolder);
    } else {
      BlocProvider.of<ColorCubit>(context).fetchHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
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
                                  color: Colors.grey.withOpacity(0.05), borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: AppText(
                                        formatDate(state.historyModel[index]!.date.toString().split(' ').first),
                                        maxLines: 10,
                                        style: const TextStyle()
                                            .defaultTextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppText(
                                        '${state.historyModel[index]!.message} ${state.historyModel[index]!.user != null ? 'by ${state.historyModel[index]!.user!.name}.' : ''}',
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

String formatDate(String date) {
  DateTime parsedDate = DateTime.parse(date); // Parse the input string
  return DateFormat("MMM d, yyyy").format(parsedDate); // Format the date
}

/*
  callApi() {
    final jsonResponse =  {"result":{"id":2,"name":"folder 2","description":"folder 2","parent_folder_id":null,"total_price":0,"total_units":0,"images":[],"subFolders":[{"id":1,"name":"abcda 1","description":"folder 1","total_price":0,"total_units":0}],"tags":[{"id":1,"name":"add"},{"id":2,"name":"tag"}],"items":[]},"message":"Success","status":1}
    try {
      final historyResponse = HistoryResponse.fromJson(jsonResponse);
      log('History response ==> $historyResponse');
    } catch (e) {
      log("Json Parsing Error: $e");
    }
  }

 */
