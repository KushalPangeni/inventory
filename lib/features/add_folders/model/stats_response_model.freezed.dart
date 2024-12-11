// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatsResponseModel _$StatsResponseModelFromJson(Map<String, dynamic> json) {
  return _StatsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$StatsResponseModel {
  Stats get result => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsResponseModelCopyWith<StatsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsResponseModelCopyWith<$Res> {
  factory $StatsResponseModelCopyWith(
          StatsResponseModel value, $Res Function(StatsResponseModel) then) =
      _$StatsResponseModelCopyWithImpl<$Res, StatsResponseModel>;
  @useResult
  $Res call({Stats result, String message, int status});

  $StatsCopyWith<$Res> get result;
}

/// @nodoc
class _$StatsResponseModelCopyWithImpl<$Res, $Val extends StatsResponseModel>
    implements $StatsResponseModelCopyWith<$Res> {
  _$StatsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Stats,
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

  @override
  @pragma('vm:prefer-inline')
  $StatsCopyWith<$Res> get result {
    return $StatsCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatsResponseModelImplCopyWith<$Res>
    implements $StatsResponseModelCopyWith<$Res> {
  factory _$$StatsResponseModelImplCopyWith(_$StatsResponseModelImpl value,
          $Res Function(_$StatsResponseModelImpl) then) =
      __$$StatsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Stats result, String message, int status});

  @override
  $StatsCopyWith<$Res> get result;
}

/// @nodoc
class __$$StatsResponseModelImplCopyWithImpl<$Res>
    extends _$StatsResponseModelCopyWithImpl<$Res, _$StatsResponseModelImpl>
    implements _$$StatsResponseModelImplCopyWith<$Res> {
  __$$StatsResponseModelImplCopyWithImpl(_$StatsResponseModelImpl _value,
      $Res Function(_$StatsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$StatsResponseModelImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Stats,
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
class _$StatsResponseModelImpl implements _StatsResponseModel {
  const _$StatsResponseModelImpl(
      {required this.result, required this.message, required this.status});

  factory _$StatsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsResponseModelImplFromJson(json);

  @override
  final Stats result;
  @override
  final String message;
  @override
  final int status;

  @override
  String toString() {
    return 'StatsResponseModel(result: $result, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsResponseModelImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsResponseModelImplCopyWith<_$StatsResponseModelImpl> get copyWith =>
      __$$StatsResponseModelImplCopyWithImpl<_$StatsResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _StatsResponseModel implements StatsResponseModel {
  const factory _StatsResponseModel(
      {required final Stats result,
      required final String message,
      required final int status}) = _$StatsResponseModelImpl;

  factory _StatsResponseModel.fromJson(Map<String, dynamic> json) =
      _$StatsResponseModelImpl.fromJson;

  @override
  Stats get result;
  @override
  String get message;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$StatsResponseModelImplCopyWith<_$StatsResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return _Stats.fromJson(json);
}

/// @nodoc
mixin _$Stats {
  int? get folder => throw _privateConstructorUsedError;
  int? get item => throw _privateConstructorUsedError;
  int? get tag => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;
  int? get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsCopyWith<Stats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsCopyWith<$Res> {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) then) =
      _$StatsCopyWithImpl<$Res, Stats>;
  @useResult
  $Res call({int? folder, int? item, int? tag, int? color, int? unit});
}

/// @nodoc
class _$StatsCopyWithImpl<$Res, $Val extends Stats>
    implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folder = freezed,
    Object? item = freezed,
    Object? tag = freezed,
    Object? color = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      folder: freezed == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as int?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as int?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsImplCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$$StatsImplCopyWith(
          _$StatsImpl value, $Res Function(_$StatsImpl) then) =
      __$$StatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? folder, int? item, int? tag, int? color, int? unit});
}

/// @nodoc
class __$$StatsImplCopyWithImpl<$Res>
    extends _$StatsCopyWithImpl<$Res, _$StatsImpl>
    implements _$$StatsImplCopyWith<$Res> {
  __$$StatsImplCopyWithImpl(
      _$StatsImpl _value, $Res Function(_$StatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folder = freezed,
    Object? item = freezed,
    Object? tag = freezed,
    Object? color = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$StatsImpl(
      folder: freezed == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as int?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as int?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsImpl implements _Stats {
  const _$StatsImpl(
      {this.folder = 0,
      this.item = 0,
      this.tag = 0,
      this.color = 0,
      this.unit = 0});

  factory _$StatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsImplFromJson(json);

  @override
  @JsonKey()
  final int? folder;
  @override
  @JsonKey()
  final int? item;
  @override
  @JsonKey()
  final int? tag;
  @override
  @JsonKey()
  final int? color;
  @override
  @JsonKey()
  final int? unit;

  @override
  String toString() {
    return 'Stats(folder: $folder, item: $item, tag: $tag, color: $color, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsImpl &&
            (identical(other.folder, folder) || other.folder == folder) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, folder, item, tag, color, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsImplCopyWith<_$StatsImpl> get copyWith =>
      __$$StatsImplCopyWithImpl<_$StatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsImplToJson(
      this,
    );
  }
}

abstract class _Stats implements Stats {
  const factory _Stats(
      {final int? folder,
      final int? item,
      final int? tag,
      final int? color,
      final int? unit}) = _$StatsImpl;

  factory _Stats.fromJson(Map<String, dynamic> json) = _$StatsImpl.fromJson;

  @override
  int? get folder;
  @override
  int? get item;
  @override
  int? get tag;
  @override
  int? get color;
  @override
  int? get unit;
  @override
  @JsonKey(ignore: true)
  _$$StatsImplCopyWith<_$StatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
