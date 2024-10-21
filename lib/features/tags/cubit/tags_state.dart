part of 'tags_cubit.dart';

@freezed
class TagsState with _$TagsState {
  const factory TagsState({
   @Default([]) List<String> listOfTags,
   @Default([]) List<String> listOfSelectedTags,
})=_TagsState;
}
