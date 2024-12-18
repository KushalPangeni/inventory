// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchState {
  ApiRequestState<dynamic>? get searchStatus =>
      throw _privateConstructorUsedError;
  SearchResponse? get searchResponse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {ApiRequestState<dynamic>? searchStatus, SearchResponse? searchResponse});

  $ApiRequestStateCopyWith<dynamic, $Res>? get searchStatus;
  $SearchResponseCopyWith<$Res>? get searchResponse;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchStatus = freezed,
    Object? searchResponse = freezed,
  }) {
    return _then(_value.copyWith(
      searchStatus: freezed == searchStatus
          ? _value.searchStatus
          : searchStatus // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      searchResponse: freezed == searchResponse
          ? _value.searchResponse
          : searchResponse // ignore: cast_nullable_to_non_nullable
              as SearchResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiRequestStateCopyWith<dynamic, $Res>? get searchStatus {
    if (_value.searchStatus == null) {
      return null;
    }

    return $ApiRequestStateCopyWith<dynamic, $Res>(_value.searchStatus!,
        (value) {
      return _then(_value.copyWith(searchStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchResponseCopyWith<$Res>? get searchResponse {
    if (_value.searchResponse == null) {
      return null;
    }

    return $SearchResponseCopyWith<$Res>(_value.searchResponse!, (value) {
      return _then(_value.copyWith(searchResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiRequestState<dynamic>? searchStatus, SearchResponse? searchResponse});

  @override
  $ApiRequestStateCopyWith<dynamic, $Res>? get searchStatus;
  @override
  $SearchResponseCopyWith<$Res>? get searchResponse;
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchStatus = freezed,
    Object? searchResponse = freezed,
  }) {
    return _then(_$SearchStateImpl(
      searchStatus: freezed == searchStatus
          ? _value.searchStatus
          : searchStatus // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      searchResponse: freezed == searchResponse
          ? _value.searchResponse
          : searchResponse // ignore: cast_nullable_to_non_nullable
              as SearchResponse?,
    ));
  }
}

/// @nodoc

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl(
      {this.searchStatus = const InitialState(), this.searchResponse});

  @override
  @JsonKey()
  final ApiRequestState<dynamic>? searchStatus;
  @override
  final SearchResponse? searchResponse;

  @override
  String toString() {
    return 'SearchState(searchStatus: $searchStatus, searchResponse: $searchResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.searchStatus, searchStatus) ||
                other.searchStatus == searchStatus) &&
            (identical(other.searchResponse, searchResponse) ||
                other.searchResponse == searchResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchStatus, searchResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final ApiRequestState<dynamic>? searchStatus,
      final SearchResponse? searchResponse}) = _$SearchStateImpl;

  @override
  ApiRequestState<dynamic>? get searchStatus;
  @override
  SearchResponse? get searchResponse;
  @override
  @JsonKey(ignore: true)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
