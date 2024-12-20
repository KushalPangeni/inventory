// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeneralResponse _$GeneralResponseFromJson(Map<String, dynamic> json) {
  return _GeneralResponse.fromJson(json);
}

/// @nodoc
mixin _$GeneralResponse {
  int get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeneralResponseCopyWith<GeneralResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralResponseCopyWith<$Res> {
  factory $GeneralResponseCopyWith(
          GeneralResponse value, $Res Function(GeneralResponse) then) =
      _$GeneralResponseCopyWithImpl<$Res, GeneralResponse>;
  @useResult
  $Res call({int status, String message});
}

/// @nodoc
class _$GeneralResponseCopyWithImpl<$Res, $Val extends GeneralResponse>
    implements $GeneralResponseCopyWith<$Res> {
  _$GeneralResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneralResponseImplCopyWith<$Res>
    implements $GeneralResponseCopyWith<$Res> {
  factory _$$GeneralResponseImplCopyWith(_$GeneralResponseImpl value,
          $Res Function(_$GeneralResponseImpl) then) =
      __$$GeneralResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, String message});
}

/// @nodoc
class __$$GeneralResponseImplCopyWithImpl<$Res>
    extends _$GeneralResponseCopyWithImpl<$Res, _$GeneralResponseImpl>
    implements _$$GeneralResponseImplCopyWith<$Res> {
  __$$GeneralResponseImplCopyWithImpl(
      _$GeneralResponseImpl _value, $Res Function(_$GeneralResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$GeneralResponseImpl(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneralResponseImpl implements _GeneralResponse {
  const _$GeneralResponseImpl(this.status, this.message);

  factory _$GeneralResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneralResponseImplFromJson(json);

  @override
  final int status;
  @override
  final String message;

  @override
  String toString() {
    return 'GeneralResponse(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralResponseImplCopyWith<_$GeneralResponseImpl> get copyWith =>
      __$$GeneralResponseImplCopyWithImpl<_$GeneralResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralResponseImplToJson(
      this,
    );
  }
}

abstract class _GeneralResponse implements GeneralResponse {
  const factory _GeneralResponse(final int status, final String message) =
      _$GeneralResponseImpl;

  factory _GeneralResponse.fromJson(Map<String, dynamic> json) =
      _$GeneralResponseImpl.fromJson;

  @override
  int get status;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$GeneralResponseImplCopyWith<_$GeneralResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
