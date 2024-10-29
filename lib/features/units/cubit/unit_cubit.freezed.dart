// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UnitState {
  ApiRequestState<dynamic>? get status => throw _privateConstructorUsedError;
  List<Unit> get listOfUnits => throw _privateConstructorUsedError;
  List<Unit> get listOfSelectedUnits => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnitStateCopyWith<UnitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitStateCopyWith<$Res> {
  factory $UnitStateCopyWith(UnitState value, $Res Function(UnitState) then) =
      _$UnitStateCopyWithImpl<$Res, UnitState>;
  @useResult
  $Res call(
      {ApiRequestState<dynamic>? status,
      List<Unit> listOfUnits,
      List<Unit> listOfSelectedUnits});

  $ApiRequestStateCopyWith<dynamic, $Res>? get status;
}

/// @nodoc
class _$UnitStateCopyWithImpl<$Res, $Val extends UnitState>
    implements $UnitStateCopyWith<$Res> {
  _$UnitStateCopyWithImpl(this._value, this._then);

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
              as List<Unit>,
      listOfSelectedUnits: null == listOfSelectedUnits
          ? _value.listOfSelectedUnits
          : listOfSelectedUnits // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
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
abstract class _$$UnitStateImplCopyWith<$Res>
    implements $UnitStateCopyWith<$Res> {
  factory _$$UnitStateImplCopyWith(
          _$UnitStateImpl value, $Res Function(_$UnitStateImpl) then) =
      __$$UnitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiRequestState<dynamic>? status,
      List<Unit> listOfUnits,
      List<Unit> listOfSelectedUnits});

  @override
  $ApiRequestStateCopyWith<dynamic, $Res>? get status;
}

/// @nodoc
class __$$UnitStateImplCopyWithImpl<$Res>
    extends _$UnitStateCopyWithImpl<$Res, _$UnitStateImpl>
    implements _$$UnitStateImplCopyWith<$Res> {
  __$$UnitStateImplCopyWithImpl(
      _$UnitStateImpl _value, $Res Function(_$UnitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? listOfUnits = null,
    Object? listOfSelectedUnits = null,
  }) {
    return _then(_$UnitStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      listOfUnits: null == listOfUnits
          ? _value._listOfUnits
          : listOfUnits // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
      listOfSelectedUnits: null == listOfSelectedUnits
          ? _value._listOfSelectedUnits
          : listOfSelectedUnits // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
    ));
  }
}

/// @nodoc

class _$UnitStateImpl implements _UnitState {
  const _$UnitStateImpl(
      {this.status = const InitialState(),
      final List<Unit> listOfUnits = const [],
      final List<Unit> listOfSelectedUnits = const []})
      : _listOfUnits = listOfUnits,
        _listOfSelectedUnits = listOfSelectedUnits;

  @override
  @JsonKey()
  final ApiRequestState<dynamic>? status;
  final List<Unit> _listOfUnits;
  @override
  @JsonKey()
  List<Unit> get listOfUnits {
    if (_listOfUnits is EqualUnmodifiableListView) return _listOfUnits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfUnits);
  }

  final List<Unit> _listOfSelectedUnits;
  @override
  @JsonKey()
  List<Unit> get listOfSelectedUnits {
    if (_listOfSelectedUnits is EqualUnmodifiableListView)
      return _listOfSelectedUnits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfSelectedUnits);
  }

  @override
  String toString() {
    return 'UnitState(status: $status, listOfUnits: $listOfUnits, listOfSelectedUnits: $listOfSelectedUnits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitStateImpl &&
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
  _$$UnitStateImplCopyWith<_$UnitStateImpl> get copyWith =>
      __$$UnitStateImplCopyWithImpl<_$UnitStateImpl>(this, _$identity);
}

abstract class _UnitState implements UnitState {
  const factory _UnitState(
      {final ApiRequestState<dynamic>? status,
      final List<Unit> listOfUnits,
      final List<Unit> listOfSelectedUnits}) = _$UnitStateImpl;

  @override
  ApiRequestState<dynamic>? get status;
  @override
  List<Unit> get listOfUnits;
  @override
  List<Unit> get listOfSelectedUnits;
  @override
  @JsonKey(ignore: true)
  _$$UnitStateImplCopyWith<_$UnitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
