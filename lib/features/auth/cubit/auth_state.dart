part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(InitialState()) ApiRequestState? status,
    @Default('') String userName,
    @Default('') String password
  }) = _AuthState;
}
