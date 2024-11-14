// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ColorResponseModel _$ColorResponseModelFromJson(Map<String, dynamic> json) {
  return _ColorResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ColorResponseModel {
  List<Color> get result => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColorResponseModelCopyWith<ColorResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorResponseModelCopyWith<$Res> {
  factory $ColorResponseModelCopyWith(
          ColorResponseModel value, $Res Function(ColorResponseModel) then) =
      _$ColorResponseModelCopyWithImpl<$Res, ColorResponseModel>;
  @useResult
  $Res call({List<Color> result, int count, String message, int status});
}

/// @nodoc
class _$ColorResponseModelCopyWithImpl<$Res, $Val extends ColorResponseModel>
    implements $ColorResponseModelCopyWith<$Res> {
  _$ColorResponseModelCopyWithImpl(this._value, this._then);

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
              as List<Color>,
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
abstract class _$$ColorResponseModelImplCopyWith<$Res>
    implements $ColorResponseModelCopyWith<$Res> {
  factory _$$ColorResponseModelImplCopyWith(_$ColorResponseModelImpl value,
          $Res Function(_$ColorResponseModelImpl) then) =
      __$$ColorResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Color> result, int count, String message, int status});
}

/// @nodoc
class __$$ColorResponseModelImplCopyWithImpl<$Res>
    extends _$ColorResponseModelCopyWithImpl<$Res, _$ColorResponseModelImpl>
    implements _$$ColorResponseModelImplCopyWith<$Res> {
  __$$ColorResponseModelImplCopyWithImpl(_$ColorResponseModelImpl _value,
      $Res Function(_$ColorResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? count = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$ColorResponseModelImpl(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Color>,
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
class _$ColorResponseModelImpl implements _ColorResponseModel {
  const _$ColorResponseModelImpl(
      {required final List<Color> result,
      required this.count,
      required this.message,
      required this.status})
      : _result = result;

  factory _$ColorResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorResponseModelImplFromJson(json);

  final List<Color> _result;
  @override
  List<Color> get result {
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
    return 'ColorResponseModel(result: $result, count: $count, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorResponseModelImpl &&
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
  _$$ColorResponseModelImplCopyWith<_$ColorResponseModelImpl> get copyWith =>
      __$$ColorResponseModelImplCopyWithImpl<_$ColorResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ColorResponseModel implements ColorResponseModel {
  const factory _ColorResponseModel(
      {required final List<Color> result,
      required final int count,
      required final String message,
      required final int status}) = _$ColorResponseModelImpl;

  factory _ColorResponseModel.fromJson(Map<String, dynamic> json) =
      _$ColorResponseModelImpl.fromJson;

  @override
  List<Color> get result;
  @override
  int get count;
  @override
  String get message;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$ColorResponseModelImplCopyWith<_$ColorResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Color _$ColorFromJson(Map<String, dynamic> json) {
  return _Color.fromJson(json);
}

/// @nodoc
mixin _$Color {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColorCopyWith<Color> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorCopyWith<$Res> {
  factory $ColorCopyWith(Color value, $Res Function(Color) then) =
      _$ColorCopyWithImpl<$Res, Color>;
  @useResult
  $Res call({int id, String name, String slug});
}

/// @nodoc
class _$ColorCopyWithImpl<$Res, $Val extends Color>
    implements $ColorCopyWith<$Res> {
  _$ColorCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorImplCopyWith<$Res> implements $ColorCopyWith<$Res> {
  factory _$$ColorImplCopyWith(
          _$ColorImpl value, $Res Function(_$ColorImpl) then) =
      __$$ColorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String slug});
}

/// @nodoc
class __$$ColorImplCopyWithImpl<$Res>
    extends _$ColorCopyWithImpl<$Res, _$ColorImpl>
    implements _$$ColorImplCopyWith<$Res> {
  __$$ColorImplCopyWithImpl(
      _$ColorImpl _value, $Res Function(_$ColorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
  }) {
    return _then(_$ColorImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorImpl implements _Color {
  const _$ColorImpl({required this.id, required this.name, required this.slug});

  factory _$ColorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;

  @override
  String toString() {
    return 'Color(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorImplCopyWith<_$ColorImpl> get copyWith =>
      __$$ColorImplCopyWithImpl<_$ColorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorImplToJson(
      this,
    );
  }
}

abstract class _Color implements Color {
  const factory _Color(
      {required final int id,
      required final String name,
      required final String slug}) = _$ColorImpl;

  factory _Color.fromJson(Map<String, dynamic> json) = _$ColorImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$ColorImplCopyWith<_$ColorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
