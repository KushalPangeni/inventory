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

/// @nodoc
mixin _$ColorModelF {
  int? get colorId => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get roll => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorModelFCopyWith<ColorModelF> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorModelFCopyWith<$Res> {
  factory $ColorModelFCopyWith(
          ColorModelF value, $Res Function(ColorModelF) then) =
      _$ColorModelFCopyWithImpl<$Res, ColorModelF>;
  @useResult
  $Res call({int? colorId, int? number, int quantity, int roll});
}

/// @nodoc
class _$ColorModelFCopyWithImpl<$Res, $Val extends ColorModelF>
    implements $ColorModelFCopyWith<$Res> {
  _$ColorModelFCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorId = freezed,
    Object? number = freezed,
    Object? quantity = null,
    Object? roll = null,
  }) {
    return _then(_value.copyWith(
      colorId: freezed == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      roll: null == roll
          ? _value.roll
          : roll // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorModelFImplCopyWith<$Res>
    implements $ColorModelFCopyWith<$Res> {
  factory _$$ColorModelFImplCopyWith(
          _$ColorModelFImpl value, $Res Function(_$ColorModelFImpl) then) =
      __$$ColorModelFImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? colorId, int? number, int quantity, int roll});
}

/// @nodoc
class __$$ColorModelFImplCopyWithImpl<$Res>
    extends _$ColorModelFCopyWithImpl<$Res, _$ColorModelFImpl>
    implements _$$ColorModelFImplCopyWith<$Res> {
  __$$ColorModelFImplCopyWithImpl(
      _$ColorModelFImpl _value, $Res Function(_$ColorModelFImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorId = freezed,
    Object? number = freezed,
    Object? quantity = null,
    Object? roll = null,
  }) {
    return _then(_$ColorModelFImpl(
      colorId: freezed == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      roll: null == roll
          ? _value.roll
          : roll // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ColorModelFImpl implements _ColorModelF {
  const _$ColorModelFImpl(
      {this.colorId, this.number = 0, this.quantity = 0, this.roll = 0});

  @override
  final int? colorId;
  @override
  @JsonKey()
  final int? number;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final int roll;

  @override
  String toString() {
    return 'ColorModelF(colorId: $colorId, number: $number, quantity: $quantity, roll: $roll)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorModelFImpl &&
            (identical(other.colorId, colorId) || other.colorId == colorId) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.roll, roll) || other.roll == roll));
  }

  @override
  int get hashCode => Object.hash(runtimeType, colorId, number, quantity, roll);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorModelFImplCopyWith<_$ColorModelFImpl> get copyWith =>
      __$$ColorModelFImplCopyWithImpl<_$ColorModelFImpl>(this, _$identity);
}

abstract class _ColorModelF implements ColorModelF {
  const factory _ColorModelF(
      {final int? colorId,
      final int? number,
      final int quantity,
      final int roll}) = _$ColorModelFImpl;

  @override
  int? get colorId;
  @override
  int? get number;
  @override
  int get quantity;
  @override
  int get roll;
  @override
  @JsonKey(ignore: true)
  _$$ColorModelFImplCopyWith<_$ColorModelFImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
