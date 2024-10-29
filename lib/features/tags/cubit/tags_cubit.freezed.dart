// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tags_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TagsState {
  ApiRequestState<dynamic>? get status => throw _privateConstructorUsedError;
  List<Tag> get listOfTags => throw _privateConstructorUsedError;
  List<Tag> get listOfSelectedTags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagsStateCopyWith<TagsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagsStateCopyWith<$Res> {
  factory $TagsStateCopyWith(TagsState value, $Res Function(TagsState) then) =
      _$TagsStateCopyWithImpl<$Res, TagsState>;
  @useResult
  $Res call(
      {ApiRequestState<dynamic>? status,
      List<Tag> listOfTags,
      List<Tag> listOfSelectedTags});

  $ApiRequestStateCopyWith<dynamic, $Res>? get status;
}

/// @nodoc
class _$TagsStateCopyWithImpl<$Res, $Val extends TagsState>
    implements $TagsStateCopyWith<$Res> {
  _$TagsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? listOfTags = null,
    Object? listOfSelectedTags = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      listOfTags: null == listOfTags
          ? _value.listOfTags
          : listOfTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      listOfSelectedTags: null == listOfSelectedTags
          ? _value.listOfSelectedTags
          : listOfSelectedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiRequestStateCopyWith<dynamic, $Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $ApiRequestStateCopyWith<dynamic, $Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TagsStateImplCopyWith<$Res>
    implements $TagsStateCopyWith<$Res> {
  factory _$$TagsStateImplCopyWith(
          _$TagsStateImpl value, $Res Function(_$TagsStateImpl) then) =
      __$$TagsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiRequestState<dynamic>? status,
      List<Tag> listOfTags,
      List<Tag> listOfSelectedTags});

  @override
  $ApiRequestStateCopyWith<dynamic, $Res>? get status;
}

/// @nodoc
class __$$TagsStateImplCopyWithImpl<$Res>
    extends _$TagsStateCopyWithImpl<$Res, _$TagsStateImpl>
    implements _$$TagsStateImplCopyWith<$Res> {
  __$$TagsStateImplCopyWithImpl(
      _$TagsStateImpl _value, $Res Function(_$TagsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? listOfTags = null,
    Object? listOfSelectedTags = null,
  }) {
    return _then(_$TagsStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      listOfTags: null == listOfTags
          ? _value._listOfTags
          : listOfTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      listOfSelectedTags: null == listOfSelectedTags
          ? _value._listOfSelectedTags
          : listOfSelectedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc

class _$TagsStateImpl implements _TagsState {
  const _$TagsStateImpl(
      {this.status = const InitialState(),
      final List<Tag> listOfTags = const [],
      final List<Tag> listOfSelectedTags = const []})
      : _listOfTags = listOfTags,
        _listOfSelectedTags = listOfSelectedTags;

  @override
  @JsonKey()
  final ApiRequestState<dynamic>? status;
  final List<Tag> _listOfTags;
  @override
  @JsonKey()
  List<Tag> get listOfTags {
    if (_listOfTags is EqualUnmodifiableListView) return _listOfTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfTags);
  }

  final List<Tag> _listOfSelectedTags;
  @override
  @JsonKey()
  List<Tag> get listOfSelectedTags {
    if (_listOfSelectedTags is EqualUnmodifiableListView)
      return _listOfSelectedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfSelectedTags);
  }

  @override
  String toString() {
    return 'TagsState(status: $status, listOfTags: $listOfTags, listOfSelectedTags: $listOfSelectedTags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._listOfTags, _listOfTags) &&
            const DeepCollectionEquality()
                .equals(other._listOfSelectedTags, _listOfSelectedTags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_listOfTags),
      const DeepCollectionEquality().hash(_listOfSelectedTags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagsStateImplCopyWith<_$TagsStateImpl> get copyWith =>
      __$$TagsStateImplCopyWithImpl<_$TagsStateImpl>(this, _$identity);
}

abstract class _TagsState implements TagsState {
  const factory _TagsState(
      {final ApiRequestState<dynamic>? status,
      final List<Tag> listOfTags,
      final List<Tag> listOfSelectedTags}) = _$TagsStateImpl;

  @override
  ApiRequestState<dynamic>? get status;
  @override
  List<Tag> get listOfTags;
  @override
  List<Tag> get listOfSelectedTags;
  @override
  @JsonKey(ignore: true)
  _$$TagsStateImplCopyWith<_$TagsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
