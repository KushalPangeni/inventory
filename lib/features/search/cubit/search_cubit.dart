import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/features/search/model/search_response_model.dart';
import 'package:inventory/features/search/repository/search_repository.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';

part 'search_state.dart';

part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository repository;

  SearchCubit(this.repository) : super(const SearchState());

  searchByText(String queryText) async {
    emit(state.copyWith(searchStatus: const LoadingState()));
    var response = await repository.searchByString(queryText);
    response.fold((l) {}, (r) {
      SearchResponse searchResponse = r.data;
      emit(state.copyWith(searchStatus: const LoadedState(), searchResponse: searchResponse));
    });
  }
}
