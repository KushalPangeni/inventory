import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/features/tags/model/tag_model.dart';
import 'package:inventory/features/tags/repository/tag_repository.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

part 'tags_state.dart';

part 'tags_cubit.freezed.dart';

class TagsCubit extends Cubit<TagsState> {
  TagRepository repository;

  TagsCubit(this.repository) : super(const TagsState());

  Future<void> getTags() async {
    emit(state.copyWith(status: const LoadingState()));
    final response = await repository.getTags();
    response.fold(
      (l) {
        emit(state.copyWith(status: const ErrorState()));
        log('Error fetching tags $l');
      },
      (r) {
        log('Fetched tags ==> ${r.data}');
        List<Tag> docTypeList = r.data.result;
        emit(state.copyWith(status: const LoadedState(), listOfTags: docTypeList));
      },
    );
  }

  addTags(String tag, BuildContext context) async {
    List<Tag> listOfTag = List.from(state.listOfTags);
    String lowerTag = tag.toLowerCase();
    bool tagExists = listOfTag.any((existingTag) => existingTag.name.toLowerCase() == lowerTag);

    if (!tagExists) {
      final response = await repository.postTags(tag);
      log('Tag added $response');
      response.fold(
        (l) {
          emit(state.copyWith(status: const ErrorState()));
          log('Error fetching tags $l');
        },
        (r) {
          listOfTag.add(Tag(id: 123, name: tag));
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 10,
          backgroundColor: Colors.white,
          duration: const Duration(milliseconds: 600),
          content: AppText('$tag already exists.')));
    }
    emit(state.copyWith(listOfTags: listOfTag));
  }

  addRemove(Tag tag) {
    List<Tag> listOfTag = List.from(state.listOfSelectedTags);
    if (listOfTag.contains(tag)) {
      listOfTag.remove(tag);
    } else {
      listOfTag.add(tag);
    }
    emit(state.copyWith(listOfSelectedTags: listOfTag));
  }

  deleteTag(BuildContext context, int tagId) async {
    final response = await repository.deleteTags(tagId);
    log('Tag added $response');
    response.fold(
      (l) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            elevation: 10,
            backgroundColor: Colors.white,
            duration: Duration(milliseconds: 600),
            content: AppText('Error when deleting tag.')));
      },
      (r) {
        getTags();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            elevation: 10,
            backgroundColor: Colors.white,
            duration: Duration(milliseconds: 600),
            content: AppText('Tag deleted successfully.')));
      },
    );
  }
}
