part of 'tags_cubit.dart';

@freezed
class TagsState with _$TagsState {
  const factory TagsState({
    @Default(InitialState()) ApiRequestState? status,
    @Default([]) List<Tag> listOfTags,
   @Default([]) List<Tag> listOfSelectedTags,
})=_TagsState;
}
