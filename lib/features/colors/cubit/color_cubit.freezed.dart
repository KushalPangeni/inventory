// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ColorState {
  ApiRequestState<dynamic>? get status => throw _privateConstructorUsedError;
  List<ColorModel> get listOfUnits => throw _privateConstructorUsedError;
  List<ColorModel> get listOfSelectedUnits =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorStateCopyWith<ColorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorStateCopyWith<$Res> {
  factory $ColorStateCopyWith(
          ColorState value, $Res Function(ColorState) then) =
      _$ColorStateCopyWithImpl<$Res, ColorState>;
  @useResult
  $Res call(
      {ApiRequestState<dynamic>? status,
      List<ColorModel> listOfUnits,
      List<ColorModel> listOfSelectedUnits});

  $ApiRequestStateCopyWith<dynamic, $Res>? get status;
}

/// @nodoc
class _$ColorStateCopyWithImpl<$Res, $Val extends ColorState>
    implements $ColorStateCopyWith<$Res> {
  _$ColorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? listOfUnits = null,
    Object? listOfSelectedUnits = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      listOfUnits: null == listOfUnits
          ? _value.listOfUnits
          : listOfUnits // ignore: cast_nullable_to_non_nullable
              as List<ColorModel>,
      listOfSelectedUnits: null == listOfSelectedUnits
          ? _value.listOfSelectedUnits
          : listOfSelectedUnits // ignore: cast_nullable_to_non_nullable
              as List<ColorModel>,
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
abstract class _$$ColorStateImplCopyWith<$Res>
    implements $ColorStateCopyWith<$Res> {
  factory _$$ColorStateImplCopyWith(
          _$ColorStateImpl value, $Res Function(_$ColorStateImpl) then) =
      __$$ColorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiRequestState<dynamic>? status,
      List<ColorModel> listOfUnits,
      List<ColorModel> listOfSelectedUnits});

  @override
  $ApiRequestStateCopyWith<dynamic, $Res>? get status;
}

/// @nodoc
class __$$ColorStateImplCopyWithImpl<$Res>
    extends _$ColorStateCopyWithImpl<$Res, _$ColorStateImpl>
    implements _$$ColorStateImplCopyWith<$Res> {
  __$$ColorStateImplCopyWithImpl(
      _$ColorStateImpl _value, $Res Function(_$ColorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? listOfUnits = null,
    Object? listOfSelectedUnits = null,
  }) {
    return _then(_$ColorStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      listOfUnits: null == listOfUnits
          ? _value._listOfUnits
          : listOfUnits // ignore: cast_nullable_to_non_nullable
              as List<ColorModel>,
      listOfSelectedUnits: null == listOfSelectedUnits
          ? _value._listOfSelectedUnits
          : listOfSelectedUnits // ignore: cast_nullable_to_non_nullable
              as List<ColorModel>,
    ));
  }
}

/// @nodoc

class _$ColorStateImpl implements _ColorState {
  const _$ColorStateImpl(
      {this.status = const InitialState(),
      final List<ColorModel> listOfUnits = const [],
      final List<ColorModel> listOfSelectedUnits = const []})
      : _listOfUnits = listOfUnits,
        _listOfSelectedUnits = listOfSelectedUnits;

  @override
  @JsonKey()
  final ApiRequestState<dynamic>? status;
  final List<ColorModel> _listOfUnits;
  @override
  @JsonKey()
  List<ColorModel> get listOfUnits {
    if (_listOfUnits is EqualUnmodifiableListView) return _listOfUnits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfUnits);
  }

  final List<ColorModel> _listOfSelectedUnits;
  @override
  @JsonKey()
  List<ColorModel> get listOfSelectedUnits {
    if (_listOfSelectedUnits is EqualUnmodifiableListView)
      return _listOfSelectedUnits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfSelectedUnits);
  }

  @override
  String toString() {
    return 'ColorState(status: $status, listOfUnits: $listOfUnits, listOfSelectedUnits: $listOfSelectedUnits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._listOfUnits, _listOfUnits) &&
            const DeepCollectionEquality()
                .equals(other._listOfSelectedUnits, _listOfSelectedUnits));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_listOfUnits),
      const DeepCollectionEquality().hash(_listOfSelectedUnits));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorStateImplCopyWith<_$ColorStateImpl> get copyWith =>
      __$$ColorStateImplCopyWithImpl<_$ColorStateImpl>(this, _$identity);
}

abstract class _ColorState implements ColorState {
  const factory _ColorState(
      {final ApiRequestState<dynamic>? status,
      final List<ColorModel> listOfUnits,
      final List<ColorModel> listOfSelectedUnits}) = _$ColorStateImpl;

  @override
  ApiRequestState<dynamic>? get status;
  @override
  List<ColorModel> get listOfUnits;
  @override
  List<ColorModel> get listOfSelectedUnits;
  @override
  @JsonKey(ignore: true)
  _$$ColorStateImplCopyWith<_$ColorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
