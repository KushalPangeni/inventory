import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_request_state.freezed.dart';

@freezed
sealed class ApiRequestState<T> with _$ApiRequestState<T> {
  const factory ApiRequestState.initial() = InitialState;

  const factory ApiRequestState.loading() = LoadingState;

  const factory ApiRequestState.loaded() = LoadedState;

  const factory ApiRequestState.error({String? message}) = ErrorState;
}
