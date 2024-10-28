import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart';
import 'package:inventory/features/add_folders/repository/add_folder_repository.dart';
import 'package:inventory/features/tags/cubit/tags_cubit.dart';
import 'package:inventory/features/tags/model/tag_model.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

part 'folder_state.dart';

part 'folder_cubit.freezed.dart';

class FolderCubit extends Cubit<FolderState> {
  AddFolderRepository repository;

  FolderCubit(this.repository) : super(const FolderState());
  TextEditingController folderNameController = TextEditingController();
  TextEditingController folderDescriptionController = TextEditingController();

  getFolders({bool showLoading = true}) async {
    emit(state.copyWith(status: showLoading ? const LoadingState() : const InitialState()));
    var response = await repository.getFolders();
    response.fold((l) {
      emit(state.copyWith(status: const ErrorState()));
      log('Get Folders === > $l');
    }, (r) {
      log('Get Folders === > ${r.data}');
      FolderModel folderModel = r.data;
      emit(state.copyWith(status: const LoadedState(), listOfFolders: folderModel.result));
    });
  }

  addFolders(BuildContext context, {bool showLoading = true, required List<File> images}) async {
    emit(state.copyWith(uploadStatus: showLoading ? const LoadingState() : const InitialState()));
    List<Tag> listOfTags = List.from(state.foldersTag);
    List<int> listOfTagsId = listOfTags.map((t) => t.id).toList();
    var response = await repository.postFolders('', images,
        folderName: folderNameController.text,
        folderDescription: folderDescriptionController.text,
        listOfTagsId: listOfTagsId);
    response.fold((l) {
      emit(state.copyWith(status: const ErrorState()));
      log('Post Folders === > $l');
    }, (r) {
      getFolders(showLoading: false);
      log('Post Folders === > ${r.data}');
      // FolderModel folderModel = r.data;
      emit(state.copyWith(uploadStatus: const LoadedState()));
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 10,
          backgroundColor: Colors.white,
          duration: const Duration(milliseconds: 800),
          content: AppText(
            'Folder added successfully.',
            style: const TextStyle().defaultTextStyle(),
          )));
      clearAll();
    });
  }

  editFolders(BuildContext context,
      {bool showLoading = true, required List<File> images, required int folderId}) async {
    emit(state.copyWith(uploadStatus: showLoading ? const LoadingState() : const InitialState()));
    List<Tag> listOfTags = List.from(state.foldersTag);
    List<int> listOfTagsId = listOfTags.map((t) => t.id).toList();
    var response = await repository.editFolders('', images,
        folderId: folderId,
        folderName: folderNameController.text,
        folderDescription: folderDescriptionController.text,
        listOfTagsId: listOfTagsId);
    response.fold((l) {
      emit(state.copyWith(status: const ErrorState()));
      log('Edit Folders === > $l');
    }, (r) {
      getFolders(showLoading: false);
      log('Edit Folders === > ${r.data}');
      // FolderModel folderModel = r.data;
      emit(state.copyWith(uploadStatus: const LoadedState()));
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 10,
          backgroundColor: Colors.white,
          duration: const Duration(milliseconds: 800),
          content: AppText(
            'Folder added successfully.',
            style: const TextStyle().defaultTextStyle(),
          )));
      clearAll();
    });
  }

  setTagForEditScreen(List<Tag> listOfTagsId) {
    emit(state.copyWith(foldersTag: listOfTagsId));
  }

  setFolderDetails({
    String? folderName,
    String? folderDescription,
    List<Tag>? listOfTags,
  }) {
    emit(state.copyWith(
        folderName: folderName ?? state.folderName,
        folderDescription: folderDescription ?? state.folderDescription,
        foldersTag: listOfTags ?? []));
  }

  addRemove(Tag tag) {
    List<Tag> listOfTag = List.from(state.foldersTag);
    if (listOfTag.contains(tag)) {
      listOfTag.remove(tag);
    } else {
      listOfTag.add(tag);
    }
    emit(state.copyWith(foldersTag: listOfTag));
  }

  deleteFolder(int folderId) async {
    var response = await repository.deleteFolders(folderId);
    response.fold((l) {
      emit(state.copyWith(status: const ErrorState()));
      log('Edit Folders === > $l');
    }, (r) {
      log('Edit Folders === > ${r.data}');
      getFolders(showLoading: false);
    });
  }

  clearAll() {
    folderNameController.clear();
    folderDescriptionController.clear();
    emit(state.copyWith(
        foldersTag: [], folderName: '', folderDescription: '', folderImage: '', uploadStatus: const LoadedState()));
  }
}
