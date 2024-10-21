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
  List<String> get listOfTags => throw _privateConstructorUsedError;
  List<String> get listOfSelectedTags => throw _privateConstructorUsedError;

  /// Create a copy of TagsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TagsStateCopyWith<TagsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagsStateCopyWith<$Res> {
  factory $TagsStateCopyWith(TagsState value, $Res Function(TagsState) then) =
      _$TagsStateCopyWithImpl<$Res, TagsState>;
  @useResult
  $Res call({List<String> listOfTags, List<String> listOfSelectedTags});
}

/// @nodoc
class _$TagsStateCopyWithImpl<$Res, $Val extends TagsState>
    implements $TagsStateCopyWith<$Res> {
  _$TagsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TagsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfTags = null,
    Object? listOfSelectedTags = null,
  }) {
    return _then(_value.copyWith(
      listOfTags: null == listOfTags
          ? _value.listOfTags
          : listOfTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      listOfSelectedTags: null == listOfSelectedTags
          ? _value.listOfSelectedTags
          : listOfSelectedTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
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
  $Res call({List<String> listOfTags, List<String> listOfSelectedTags});
}

/// @nodoc
class __$$TagsStateImplCopyWithImpl<$Res>
    extends _$TagsStateCopyWithImpl<$Res, _$TagsStateImpl>
    implements _$$TagsStateImplCopyWith<$Res> {
  __$$TagsStateImplCopyWithImpl(
      _$TagsStateImpl _value, $Res Function(_$TagsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TagsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfTags = null,
    Object? listOfSelectedTags = null,
  }) {
    return _then(_$TagsStateImpl(
      listOfTags: null == listOfTags
          ? _value._listOfTags
          : listOfTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      listOfSelectedTags: null == listOfSelectedTags
          ? _value._listOfSelectedTags
          : listOfSelectedTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$TagsStateImpl implements _TagsState {
  const _$TagsStateImpl(
      {final List<String> listOfTags = const [],
      final List<String> listOfSelectedTags = const []})
      : _listOfTags = listOfTags,
        _listOfSelectedTags = listOfSelectedTags;

  final List<String> _listOfTags;
  @override
  @JsonKey()
  List<String> get listOfTags {
    if (_listOfTags is EqualUnmodifiableListView) return _listOfTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfTags);
  }

  final List<String> _listOfSelectedTags;
  @override
  @JsonKey()
  List<String> get listOfSelectedTags {
    if (_listOfSelectedTags is EqualUnmodifiableListView)
      return _listOfSelectedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfSelectedTags);
  }

  @override
  String toString() {
    return 'TagsState(listOfTags: $listOfTags, listOfSelectedTags: $listOfSelectedTags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._listOfTags, _listOfTags) &&
            const DeepCollectionEquality()
                .equals(other._listOfSelectedTags, _listOfSelectedTags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listOfTags),
      const DeepCollectionEquality().hash(_listOfSelectedTags));

  /// Create a copy of TagsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TagsStateImplCopyWith<_$TagsStateImpl> get copyWith =>
      __$$TagsStateImplCopyWithImpl<_$TagsStateImpl>(this, _$identity);
}

abstract class _TagsState implements TagsState {
  const factory _TagsState(
      {final List<String> listOfTags,
      final List<String> listOfSelectedTags}) = _$TagsStateImpl;

  @override
  List<String> get listOfTags;
  @override
  List<String> get listOfSelectedTags;

  /// Create a copy of TagsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagsStateImplCopyWith<_$TagsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
