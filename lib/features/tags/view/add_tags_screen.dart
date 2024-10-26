import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/tags/cubit/tags_cubit.dart';
import 'package:inventory/global/widgets/app_button.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

class AddTagsScreen extends StatefulWidget {
  const AddTagsScreen({super.key});

  @override
  State<AddTagsScreen> createState() => _AddTagsScreenState();
}

class _AddTagsScreenState extends State<AddTagsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TagsCubit>(context).getTags();
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
          'Tags',
          style: const TextStyle().defaultTextStyle(fontSize: 20),
        ),
      ),
      body: BlocBuilder<TagsCubit, TagsState>(builder: (context, state) {
        return state.status is LoadingState
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 1),
                itemCount: state.listOfTags.length + 1,
                itemBuilder: (context, index) {
                  return index < state.listOfTags.length
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 1, right: 8),
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<TagsCubit>(context).addRemove(state.listOfTags[index]);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: state.listOfSelectedTags.contains(state.listOfTags[index])
                                      ? Colors.orangeAccent[100]
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(width: 4),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: state.listOfSelectedTags.contains(state.listOfTags[index])
                                                  ? Colors.orangeAccent
                                                  : Colors.orangeAccent[100],
                                              borderRadius: BorderRadius.circular(4)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.tag_rounded,
                                              size: 28,
                                            ),
                                          )),
                                      const SizedBox(width: 2),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                          child: AppText(
                                            maxLines: 1,
                                            state.listOfTags[index].name,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  PopupMenuButton<String>(
                                    initialValue: '',
                                    onSelected: (String item) {
                                      BlocProvider.of<TagsCubit>(context)
                                          .deleteTag(context, state.listOfTags[index].id);
                                    },
                                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                      PopupMenuItem<String>(
                                        value: state.listOfTags[index].name,
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                    child: const Icon(Icons.more_vert_rounded),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(height: 60);
                });
      }),
      floatingActionButton: GestureDetector(
        onTap: () {
          addTags(context);
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

addTags(BuildContext context) {
  TextEditingController tagController = TextEditingController();
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
                  const AppText('Add Tags', style: TextStyle(fontSize: 18)),
                  const Divider(),
                  TextField(
                    controller: tagController,
                    decoration: const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                  const Divider(),
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
                                BlocProvider.of<TagsCubit>(context).addTags(tagController.text, context);
                                Navigator.of(context).pop();
                              })),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
