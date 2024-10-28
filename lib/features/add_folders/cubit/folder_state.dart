part of 'folder_cubit.dart';

@freezed
class FolderState with _$FolderState {
  const factory FolderState({
    @Default(InitialState()) ApiRequestState? status,
    @Default(InitialState()) ApiRequestState? uploadStatus,
    @Default([]) List<Folder> listOfFolders,
    @Default('') String folderName,
    @Default([]) List<Tag> foldersTag,
    @Default('') String folderDescription,
    @Default('') String folderImage,
  }) = _FolderState;
}
