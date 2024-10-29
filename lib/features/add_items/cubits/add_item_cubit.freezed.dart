// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_item_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddItemState {
  ApiRequestState<dynamic>? get status => throw _privateConstructorUsedError;
  ApiRequestState<dynamic>? get uploadStatus =>
      throw _privateConstructorUsedError;
  List<Item> get listOfItems => throw _privateConstructorUsedError;
  List<Item> get listOfItemsFromSelectedFolder =>
      throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<ColorModel> get colorList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddItemStateCopyWith<AddItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddItemStateCopyWith<$Res> {
  factory $AddItemStateCopyWith(
          AddItemState value, $Res Function(AddItemState) then) =
      _$AddItemStateCopyWithImpl<$Res, AddItemState>;
  @useResult
  $Res call(
      {ApiRequestState<dynamic>? status,
      ApiRequestState<dynamic>? uploadStatus,
      List<Item> listOfItems,
      List<Item> listOfItemsFromSelectedFolder,
      String title,
      List<ColorModel> colorList});

  $ApiRequestStateCopyWith<dynamic, $Res>? get status;
  $ApiRequestStateCopyWith<dynamic, $Res>? get uploadStatus;
}

/// @nodoc
class _$AddItemStateCopyWithImpl<$Res, $Val extends AddItemState>
    implements $AddItemStateCopyWith<$Res> {
  _$AddItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? uploadStatus = freezed,
    Object? listOfItems = null,
    Object? listOfItemsFromSelectedFolder = null,
    Object? title = null,
    Object? colorList = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      uploadStatus: freezed == uploadStatus
          ? _value.uploadStatus
          : uploadStatus // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      listOfItems: null == listOfItems
          ? _value.listOfItems
          : listOfItems // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      listOfItemsFromSelectedFolder: null == listOfItemsFromSelectedFolder
          ? _value.listOfItemsFromSelectedFolder
          : listOfItemsFromSelectedFolder // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      colorList: null == colorList
          ? _value.colorList
          : colorList // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $ApiRequestStateCopyWith<dynamic, $Res>? get uploadStatus {
    if (_value.uploadStatus == null) {
      return null;
    }

    return $ApiRequestStateCopyWith<dynamic, $Res>(_value.uploadStatus!,
        (value) {
      return _then(_value.copyWith(uploadStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddItemStateImplCopyWith<$Res>
    implements $AddItemStateCopyWith<$Res> {
  factory _$$AddItemStateImplCopyWith(
          _$AddItemStateImpl value, $Res Function(_$AddItemStateImpl) then) =
      __$$AddItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiRequestState<dynamic>? status,
      ApiRequestState<dynamic>? uploadStatus,
      List<Item> listOfItems,
      List<Item> listOfItemsFromSelectedFolder,
      String title,
      List<ColorModel> colorList});

  @override
  $ApiRequestStateCopyWith<dynamic, $Res>? get status;
  @override
  $ApiRequestStateCopyWith<dynamic, $Res>? get uploadStatus;
}

/// @nodoc
class __$$AddItemStateImplCopyWithImpl<$Res>
    extends _$AddItemStateCopyWithImpl<$Res, _$AddItemStateImpl>
    implements _$$AddItemStateImplCopyWith<$Res> {
  __$$AddItemStateImplCopyWithImpl(
      _$AddItemStateImpl _value, $Res Function(_$AddItemStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? uploadStatus = freezed,
    Object? listOfItems = null,
    Object? listOfItemsFromSelectedFolder = null,
    Object? title = null,
    Object? colorList = null,
  }) {
    return _then(_$AddItemStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      uploadStatus: freezed == uploadStatus
          ? _value.uploadStatus
          : uploadStatus // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      listOfItems: null == listOfItems
          ? _value._listOfItems
          : listOfItems // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      listOfItemsFromSelectedFolder: null == listOfItemsFromSelectedFolder
          ? _value._listOfItemsFromSelectedFolder
          : listOfItemsFromSelectedFolder // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      colorList: null == colorList
          ? _value._colorList
          : colorList // ignore: cast_nullable_to_non_nullable
              as List<ColorModel>,
    ));
  }
}

/// @nodoc

class _$AddItemStateImpl implements _AddItemState {
  const _$AddItemStateImpl(
      {this.status = const InitialState(),
      this.uploadStatus = const InitialState(),
      final List<Item> listOfItems = const [],
      final List<Item> listOfItemsFromSelectedFolder = const [],
      this.title = '',
      final List<ColorModel> colorList = const []})
      : _listOfItems = listOfItems,
        _listOfItemsFromSelectedFolder = listOfItemsFromSelectedFolder,
        _colorList = colorList;

  @override
  @JsonKey()
  final ApiRequestState<dynamic>? status;
  @override
  @JsonKey()
  final ApiRequestState<dynamic>? uploadStatus;
  final List<Item> _listOfItems;
  @override
  @JsonKey()
  List<Item> get listOfItems {
    if (_listOfItems is EqualUnmodifiableListView) return _listOfItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfItems);
  }

  final List<Item> _listOfItemsFromSelectedFolder;
  @override
  @JsonKey()
  List<Item> get listOfItemsFromSelectedFolder {
    if (_listOfItemsFromSelectedFolder is EqualUnmodifiableListView)
      return _listOfItemsFromSelectedFolder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfItemsFromSelectedFolder);
  }

  @override
  @JsonKey()
  final String title;
  final List<ColorModel> _colorList;
  @override
  @JsonKey()
  List<ColorModel> get colorList {
    if (_colorList is EqualUnmodifiableListView) return _colorList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colorList);
  }

  @override
  String toString() {
    return 'AddItemState(status: $status, uploadStatus: $uploadStatus, listOfItems: $listOfItems, listOfItemsFromSelectedFolder: $listOfItemsFromSelectedFolder, title: $title, colorList: $colorList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.uploadStatus, uploadStatus) ||
                other.uploadStatus == uploadStatus) &&
            const DeepCollectionEquality()
                .equals(other._listOfItems, _listOfItems) &&
            const DeepCollectionEquality().equals(
                other._listOfItemsFromSelectedFolder,
                _listOfItemsFromSelectedFolder) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._colorList, _colorList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      uploadStatus,
      const DeepCollectionEquality().hash(_listOfItems),
      const DeepCollectionEquality().hash(_listOfItemsFromSelectedFolder),
      title,
      const DeepCollectionEquality().hash(_colorList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemStateImplCopyWith<_$AddItemStateImpl> get copyWith =>
      __$$AddItemStateImplCopyWithImpl<_$AddItemStateImpl>(this, _$identity);
}

abstract class _AddItemState implements AddItemState {
  const factory _AddItemState(
      {final ApiRequestState<dynamic>? status,
      final ApiRequestState<dynamic>? uploadStatus,
      final List<Item> listOfItems,
      final List<Item> listOfItemsFromSelectedFolder,
      final String title,
      final List<ColorModel> colorList}) = _$AddItemStateImpl;

  @override
  ApiRequestState<dynamic>? get status;
  @override
  ApiRequestState<dynamic>? get uploadStatus;
  @override
  List<Item> get listOfItems;
  @override
  List<Item> get listOfItemsFromSelectedFolder;
  @override
  String get title;
  @override
  List<ColorModel> get colorList;
  @override
  @JsonKey(ignore: true)
  _$$AddItemStateImplCopyWith<_$AddItemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
