import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/features/add_folders/model/folder_model.dart';
import 'package:inventory/features/add_folders/model/stats_response_model.dart';
import 'package:inventory/features/add_folders/repository/add_folder_repository.dart';
import 'package:inventory/features/tags/model/tag_model.dart';
import 'package:inventory/global/widgets/app_text.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';
import 'package:inventory/network/exception.dart';
import 'package:toastification/toastification.dart';

part 'folder_state.dart';

part 'folder_cubit.freezed.dart';

class FolderCubit extends Cubit<FolderState> {
  AddFolderRepository repository;

  FolderCubit(this.repository) : super(const FolderState());
  TextEditingController folderNameController = TextEditingController();
  TextEditingController folderDescriptionController = TextEditingController();

  Future<Folder?> getFolders({bool showLoading = true, int? folderId}) async {
    Folder? folder;
    if (folderId == null) {
      emit(state.copyWith(status: showLoading ? const LoadingState() : const InitialState()));
    } else {
      emit(state.copyWith(folderIdStatus: showLoading ? const LoadingState() : const InitialState()));
    }
    var response = await repository.getFolders(folderId: folderId);
    if (folderId == null) {
      response.fold((l) {
        emit(state.copyWith(status: const ErrorState()));
        log('Get Folders === > $l');
      }, (r) {
        log('Get Folders === > ${r.data}');
        FolderOnlyModel folderModel = r.data;
        emit(state.copyWith(
            status: const LoadedState(),
            listOfFolders: folderModel.result.subFolders,
            listOfItems: folderModel.result.items));
      });
    } else {
      response.fold((l) {
        emit(state.copyWith(folderIdStatus: const ErrorState()));
        log('Get Folders === > $l');
      }, (r) {
        emit(state.copyWith(folderIdStatus: const LoadedState()));
        log('Get Folders === > ${r.data}');
        folder = r.data.result;
      });
    }

    return folder;
  }

  getStats() async {
    var response = await repository.getStats();
    response.fold((l) {
      emit(state.copyWith(status: const ErrorState()));
      log('Get Folders === > $l');
    }, (r) {
      log('Stats === > ${r.data}');
      emit(state.copyWith(stats: r.data.result));
    });
  }

  addFolders(BuildContext context,
      {bool showLoading = true, required List<File> listOfFiles, int? parentFolderId}) async {
    emit(state.copyWith(uploadStatus: showLoading ? const LoadingState() : const InitialState()));
    List<Tag> listOfTags = List.from(state.foldersTag);
    List<int> listOfTagsId = listOfTags.map((t) => t.id).toList();

    List<MultipartFile> listOfMultipartFiles = [];
    for (int i = 0; i < listOfFiles.length; i++) {
      listOfMultipartFiles.add(await MultipartFile.fromFile(
        listOfFiles[i].path,
        filename: listOfFiles[i].path.split('/').last, // Specify the file name explicitly
      ));
    }
    var response = await repository.postFolders('', listOfMultipartFiles,
        folderName: folderNameController.text,
        folderDescription: folderDescriptionController.text,
        parentFolderId: parentFolderId,
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
      showToast(context, 'Success', 'Folder added successfully', ToastificationType.success);
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
      emit(state.copyWith(uploadStatus: const ErrorState()));
      log('Edit Folders === > $l');
    }, (r) {
      getFolders(showLoading: false);
      log('Edit Folders === > ${r.data}');
      emit(state.copyWith(uploadStatus: const LoadedState()));
      Navigator.of(context).pop();
      showToast(context, 'Success', 'Folder updated successfully', ToastificationType.success);
      clearAll();
    });
  }

  moveFolder(BuildContext context,
      {required int folderId,
      required int destinationFolderId,
      required String reasonToMove,
      required String note}) async {
    var response = await repository.moveFolder(
        folderId: folderId, destinationFolderId: destinationFolderId, reasonToMove: reasonToMove, note: note);

    response.fold((l) {
      emit(state.copyWith(status: const ErrorState()));

      log('Move Folders === > $l');
    }, (r) {
      log('Move Folders === > ${r.data}');
      emit(state.copyWith(status: const LoadedState()));
      showToast(context, 'Success', 'Folder moved successfully.', ToastificationType.success);
      Navigator.pop(context);
      Navigator.pop(context);
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
