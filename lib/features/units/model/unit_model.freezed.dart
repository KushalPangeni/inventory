// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnitResponseModel _$UnitResponseModelFromJson(Map<String, dynamic> json) {
  return _UnitResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UnitResponseModel {
  List<Unit> get result => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitResponseModelCopyWith<UnitResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitResponseModelCopyWith<$Res> {
  factory $UnitResponseModelCopyWith(
          UnitResponseModel value, $Res Function(UnitResponseModel) then) =
      _$UnitResponseModelCopyWithImpl<$Res, UnitResponseModel>;
  @useResult
  $Res call({List<Unit> result, int count, String message, int status});
}

/// @nodoc
class _$UnitResponseModelCopyWithImpl<$Res, $Val extends UnitResponseModel>
    implements $UnitResponseModelCopyWith<$Res> {
  _$UnitResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? count = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnitResponseModelImplCopyWith<$Res>
    implements $UnitResponseModelCopyWith<$Res> {
  factory _$$UnitResponseModelImplCopyWith(_$UnitResponseModelImpl value,
          $Res Function(_$UnitResponseModelImpl) then) =
      __$$UnitResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Unit> result, int count, String message, int status});
}

/// @nodoc
class __$$UnitResponseModelImplCopyWithImpl<$Res>
    extends _$UnitResponseModelCopyWithImpl<$Res, _$UnitResponseModelImpl>
    implements _$$UnitResponseModelImplCopyWith<$Res> {
  __$$UnitResponseModelImplCopyWithImpl(_$UnitResponseModelImpl _value,
      $Res Function(_$UnitResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? count = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$UnitResponseModelImpl(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnitResponseModelImpl implements _UnitResponseModel {
  const _$UnitResponseModelImpl(
      {required final List<Unit> result,
      required this.count,
      required this.message,
      required this.status})
      : _result = result;

  factory _$UnitResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitResponseModelImplFromJson(json);

  final List<Unit> _result;
  @override
  List<Unit> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  final int count;
  @override
  final String message;
  @override
  final int status;

  @override
  String toString() {
    return 'UnitResponseModel(result: $result, count: $count, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitResponseModelImpl &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_result), count, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitResponseModelImplCopyWith<_$UnitResponseModelImpl> get copyWith =>
      __$$UnitResponseModelImplCopyWithImpl<_$UnitResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitResponseModelImplToJson(
      this,
    );
  }
}

abstract class _UnitResponseModel implements UnitResponseModel {
  const factory _UnitResponseModel(
      {required final List<Unit> result,
      required final int count,
      required final String message,
      required final int status}) = _$UnitResponseModelImpl;

  factory _UnitResponseModel.fromJson(Map<String, dynamic> json) =
      _$UnitResponseModelImpl.fromJson;

  @override
  List<Unit> get result;
  @override
  int get count;
  @override
  String get message;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$UnitResponseModelImplCopyWith<_$UnitResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Unit _$UnitFromJson(Map<String, dynamic> json) {
  return _Unit.fromJson(json);
}

/// @nodoc
mixin _$Unit {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitCopyWith<Unit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitCopyWith<$Res> {
  factory $UnitCopyWith(Unit value, $Res Function(Unit) then) =
      _$UnitCopyWithImpl<$Res, Unit>;
  @useResult
  $Res call({int id, String name, String slug, String label});
}

/// @nodoc
class _$UnitCopyWithImpl<$Res, $Val extends Unit>
    implements $UnitCopyWith<$Res> {
  _$UnitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnitImplCopyWith<$Res> implements $UnitCopyWith<$Res> {
  factory _$$UnitImplCopyWith(
          _$UnitImpl value, $Res Function(_$UnitImpl) then) =
      __$$UnitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String slug, String label});
}

/// @nodoc
class __$$UnitImplCopyWithImpl<$Res>
    extends _$UnitCopyWithImpl<$Res, _$UnitImpl>
    implements _$$UnitImplCopyWith<$Res> {
  __$$UnitImplCopyWithImpl(_$UnitImpl _value, $Res Function(_$UnitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? label = null,
  }) {
    return _then(_$UnitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnitImpl implements _Unit {
  const _$UnitImpl(
      {required this.id,
      required this.name,
      required this.slug,
      required this.label});

  factory _$UnitImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String label;

  @override
  String toString() {
    return 'Unit(id: $id, name: $name, slug: $slug, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitImplCopyWith<_$UnitImpl> get copyWith =>
      __$$UnitImplCopyWithImpl<_$UnitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitImplToJson(
      this,
    );
  }
}

abstract class _Unit implements Unit {
  const factory _Unit(
      {required final int id,
      required final String name,
      required final String slug,
      required final String label}) = _$UnitImpl;

  factory _Unit.fromJson(Map<String, dynamic> json) = _$UnitImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$UnitImplCopyWith<_$UnitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
