part of 'folder_cubit.dart';

@freezed
class FolderState with _$FolderState {
  const factory FolderState({
    @Default(InitialState()) ApiRequestState? status,
    @Default(InitialState()) ApiRequestState? folderIdStatus,
    @Default(InitialState()) ApiRequestState? uploadStatus,
    @Default(InitialState()) ApiRequestState? moveStatus,
    @Default([]) List<Folder> listOfFolders,
    @Default([]) List<Item> listOfItems,
    @Default('') String folderName,
    @Default([]) List<Tag> foldersTag,
    @Default('') String folderDescription,
    Stats? stats,
    @Default('') String folderImage,
  }) = _FolderState;
}
