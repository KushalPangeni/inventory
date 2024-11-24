part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(InitialState()) ApiRequestState? searchStatus,
    SearchResponse? searchResponse,
  }) = _SearchState;
}
