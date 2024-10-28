// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemModelResponse _$ItemModelResponseFromJson(Map<String, dynamic> json) {
  return _ItemModelResponse.fromJson(json);
}

/// @nodoc
mixin _$ItemModelResponse {
  List<Item> get result => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemModelResponseCopyWith<ItemModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemModelResponseCopyWith<$Res> {
  factory $ItemModelResponseCopyWith(
          ItemModelResponse value, $Res Function(ItemModelResponse) then) =
      _$ItemModelResponseCopyWithImpl<$Res, ItemModelResponse>;
  @useResult
  $Res call({List<Item> result, int count, String message, int status});
}

/// @nodoc
class _$ItemModelResponseCopyWithImpl<$Res, $Val extends ItemModelResponse>
    implements $ItemModelResponseCopyWith<$Res> {
  _$ItemModelResponseCopyWithImpl(this._value, this._then);

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
              as List<Item>,
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
abstract class _$$ItemModelResponseImplCopyWith<$Res>
    implements $ItemModelResponseCopyWith<$Res> {
  factory _$$ItemModelResponseImplCopyWith(_$ItemModelResponseImpl value,
          $Res Function(_$ItemModelResponseImpl) then) =
      __$$ItemModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Item> result, int count, String message, int status});
}

/// @nodoc
class __$$ItemModelResponseImplCopyWithImpl<$Res>
    extends _$ItemModelResponseCopyWithImpl<$Res, _$ItemModelResponseImpl>
    implements _$$ItemModelResponseImplCopyWith<$Res> {
  __$$ItemModelResponseImplCopyWithImpl(_$ItemModelResponseImpl _value,
      $Res Function(_$ItemModelResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? count = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$ItemModelResponseImpl(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Item>,
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
class _$ItemModelResponseImpl implements _ItemModelResponse {
  const _$ItemModelResponseImpl(
      {required final List<Item> result,
      required this.count,
      required this.message,
      required this.status})
      : _result = result;

  factory _$ItemModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemModelResponseImplFromJson(json);

  final List<Item> _result;
  @override
  List<Item> get result {
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
    return 'ItemModelResponse(result: $result, count: $count, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemModelResponseImpl &&
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
  _$$ItemModelResponseImplCopyWith<_$ItemModelResponseImpl> get copyWith =>
      __$$ItemModelResponseImplCopyWithImpl<_$ItemModelResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemModelResponseImplToJson(
      this,
    );
  }
}

abstract class _ItemModelResponse implements ItemModelResponse {
  const factory _ItemModelResponse(
      {required final List<Item> result,
      required final int count,
      required final String message,
      required final int status}) = _$ItemModelResponseImpl;

  factory _ItemModelResponse.fromJson(Map<String, dynamic> json) =
      _$ItemModelResponseImpl.fromJson;

  @override
  List<Item> get result;
  @override
  int get count;
  @override
  String get message;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$ItemModelResponseImplCopyWith<_$ItemModelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FolderModel _$FolderModelFromJson(Map<String, dynamic> json) {
  return _FolderModel.fromJson(json);
}

/// @nodoc
mixin _$FolderModel {
  List<Folder> get result => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FolderModelCopyWith<FolderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderModelCopyWith<$Res> {
  factory $FolderModelCopyWith(
          FolderModel value, $Res Function(FolderModel) then) =
      _$FolderModelCopyWithImpl<$Res, FolderModel>;
  @useResult
  $Res call({List<Folder> result, int count, String message, int status});
}

/// @nodoc
class _$FolderModelCopyWithImpl<$Res, $Val extends FolderModel>
    implements $FolderModelCopyWith<$Res> {
  _$FolderModelCopyWithImpl(this._value, this._then);

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
              as List<Folder>,
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
abstract class _$$FolderModelImplCopyWith<$Res>
    implements $FolderModelCopyWith<$Res> {
  factory _$$FolderModelImplCopyWith(
          _$FolderModelImpl value, $Res Function(_$FolderModelImpl) then) =
      __$$FolderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Folder> result, int count, String message, int status});
}

/// @nodoc
class __$$FolderModelImplCopyWithImpl<$Res>
    extends _$FolderModelCopyWithImpl<$Res, _$FolderModelImpl>
    implements _$$FolderModelImplCopyWith<$Res> {
  __$$FolderModelImplCopyWithImpl(
      _$FolderModelImpl _value, $Res Function(_$FolderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? count = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$FolderModelImpl(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
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
class _$FolderModelImpl implements _FolderModel {
  const _$FolderModelImpl(
      {required final List<Folder> result,
      required this.count,
      required this.message,
      required this.status})
      : _result = result;

  factory _$FolderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderModelImplFromJson(json);

  final List<Folder> _result;
  @override
  List<Folder> get result {
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
    return 'FolderModel(result: $result, count: $count, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderModelImpl &&
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
  _$$FolderModelImplCopyWith<_$FolderModelImpl> get copyWith =>
      __$$FolderModelImplCopyWithImpl<_$FolderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderModelImplToJson(
      this,
    );
  }
}

abstract class _FolderModel implements FolderModel {
  const factory _FolderModel(
      {required final List<Folder> result,
      required final int count,
      required final String message,
      required final int status}) = _$FolderModelImpl;

  factory _FolderModel.fromJson(Map<String, dynamic> json) =
      _$FolderModelImpl.fromJson;

  @override
  List<Folder> get result;
  @override
  int get count;
  @override
  String get message;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$FolderModelImplCopyWith<_$FolderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Folder _$FolderFromJson(Map<String, dynamic> json) {
  return _Folder.fromJson(json);
}

/// @nodoc
mixin _$Folder {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_folder_id')
  int? get parentFolderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  dynamic get totalPrice =>
      throw _privateConstructorUsedError; // to handle both int and double types
  @JsonKey(name: 'total_units')
  dynamic get totalUnits => throw _privateConstructorUsedError; // made nullable
  List<Image> get images =>
      throw _privateConstructorUsedError; // defaults to an empty list if null
  List<Folder> get subFolders =>
      throw _privateConstructorUsedError; // defaults to an empty list if null
  List<Tag> get tags =>
      throw _privateConstructorUsedError; // defaults to an empty list if null
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FolderCopyWith<Folder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderCopyWith<$Res> {
  factory $FolderCopyWith(Folder value, $Res Function(Folder) then) =
      _$FolderCopyWithImpl<$Res, Folder>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      @JsonKey(name: 'parent_folder_id') int? parentFolderId,
      @JsonKey(name: 'total_price') dynamic totalPrice,
      @JsonKey(name: 'total_units') dynamic totalUnits,
      List<Image> images,
      List<Folder> subFolders,
      List<Tag> tags,
      List<Item> items});
}

/// @nodoc
class _$FolderCopyWithImpl<$Res, $Val extends Folder>
    implements $FolderCopyWith<$Res> {
  _$FolderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? parentFolderId = freezed,
    Object? totalPrice = freezed,
    Object? totalUnits = freezed,
    Object? images = null,
    Object? subFolders = null,
    Object? tags = null,
    Object? items = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      parentFolderId: freezed == parentFolderId
          ? _value.parentFolderId
          : parentFolderId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalUnits: freezed == totalUnits
          ? _value.totalUnits
          : totalUnits // ignore: cast_nullable_to_non_nullable
              as dynamic,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      subFolders: null == subFolders
          ? _value.subFolders
          : subFolders // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderImplCopyWith<$Res> implements $FolderCopyWith<$Res> {
  factory _$$FolderImplCopyWith(
          _$FolderImpl value, $Res Function(_$FolderImpl) then) =
      __$$FolderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      @JsonKey(name: 'parent_folder_id') int? parentFolderId,
      @JsonKey(name: 'total_price') dynamic totalPrice,
      @JsonKey(name: 'total_units') dynamic totalUnits,
      List<Image> images,
      List<Folder> subFolders,
      List<Tag> tags,
      List<Item> items});
}

/// @nodoc
class __$$FolderImplCopyWithImpl<$Res>
    extends _$FolderCopyWithImpl<$Res, _$FolderImpl>
    implements _$$FolderImplCopyWith<$Res> {
  __$$FolderImplCopyWithImpl(
      _$FolderImpl _value, $Res Function(_$FolderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? parentFolderId = freezed,
    Object? totalPrice = freezed,
    Object? totalUnits = freezed,
    Object? images = null,
    Object? subFolders = null,
    Object? tags = null,
    Object? items = null,
  }) {
    return _then(_$FolderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      parentFolderId: freezed == parentFolderId
          ? _value.parentFolderId
          : parentFolderId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalUnits: freezed == totalUnits
          ? _value.totalUnits
          : totalUnits // ignore: cast_nullable_to_non_nullable
              as dynamic,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      subFolders: null == subFolders
          ? _value._subFolders
          : subFolders // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolderImpl implements _Folder {
  const _$FolderImpl(
      {required this.id,
      required this.name,
      required this.description,
      @JsonKey(name: 'parent_folder_id') this.parentFolderId,
      @JsonKey(name: 'total_price') this.totalPrice,
      @JsonKey(name: 'total_units') this.totalUnits,
      final List<Image> images = const [],
      final List<Folder> subFolders = const [],
      final List<Tag> tags = const [],
      final List<Item> items = const []})
      : _images = images,
        _subFolders = subFolders,
        _tags = tags,
        _items = items;

  factory _$FolderImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: 'parent_folder_id')
  final int? parentFolderId;
  @override
  @JsonKey(name: 'total_price')
  final dynamic totalPrice;
// to handle both int and double types
  @override
  @JsonKey(name: 'total_units')
  final dynamic totalUnits;
// made nullable
  final List<Image> _images;
// made nullable
  @override
  @JsonKey()
  List<Image> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

// defaults to an empty list if null
  final List<Folder> _subFolders;
// defaults to an empty list if null
  @override
  @JsonKey()
  List<Folder> get subFolders {
    if (_subFolders is EqualUnmodifiableListView) return _subFolders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subFolders);
  }

// defaults to an empty list if null
  final List<Tag> _tags;
// defaults to an empty list if null
  @override
  @JsonKey()
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

// defaults to an empty list if null
  final List<Item> _items;
// defaults to an empty list if null
  @override
  @JsonKey()
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Folder(id: $id, name: $name, description: $description, parentFolderId: $parentFolderId, totalPrice: $totalPrice, totalUnits: $totalUnits, images: $images, subFolders: $subFolders, tags: $tags, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.parentFolderId, parentFolderId) ||
                other.parentFolderId == parentFolderId) &&
            const DeepCollectionEquality()
                .equals(other.totalPrice, totalPrice) &&
            const DeepCollectionEquality()
                .equals(other.totalUnits, totalUnits) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._subFolders, _subFolders) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      parentFolderId,
      const DeepCollectionEquality().hash(totalPrice),
      const DeepCollectionEquality().hash(totalUnits),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_subFolders),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderImplCopyWith<_$FolderImpl> get copyWith =>
      __$$FolderImplCopyWithImpl<_$FolderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderImplToJson(
      this,
    );
  }
}

abstract class _Folder implements Folder {
  const factory _Folder(
      {required final int id,
      required final String name,
      required final String description,
      @JsonKey(name: 'parent_folder_id') final int? parentFolderId,
      @JsonKey(name: 'total_price') final dynamic totalPrice,
      @JsonKey(name: 'total_units') final dynamic totalUnits,
      final List<Image> images,
      final List<Folder> subFolders,
      final List<Tag> tags,
      final List<Item> items}) = _$FolderImpl;

  factory _Folder.fromJson(Map<String, dynamic> json) = _$FolderImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: 'parent_folder_id')
  int? get parentFolderId;
  @override
  @JsonKey(name: 'total_price')
  dynamic get totalPrice;
  @override // to handle both int and double types
  @JsonKey(name: 'total_units')
  dynamic get totalUnits;
  @override // made nullable
  List<Image> get images;
  @override // defaults to an empty list if null
  List<Folder> get subFolders;
  @override // defaults to an empty list if null
  List<Tag> get tags;
  @override // defaults to an empty list if null
  List<Item> get items;
  @override
  @JsonKey(ignore: true)
  _$$FolderImplCopyWith<_$FolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_id')
  int? get fileId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  String? get metadata => throw _privateConstructorUsedError; // made nullable
  String get type => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_name')
  String? get tableName => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError; // made nullable
  String? get description =>
      throw _privateConstructorUsedError; // made nullable
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res, Image>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'file_id') int? fileId,
      String name,
      String tag,
      String? metadata,
      String type,
      String path,
      @JsonKey(name: 'table_name') String? tableName,
      String? model,
      String? description,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class _$ImageCopyWithImpl<$Res, $Val extends Image>
    implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileId = freezed,
    Object? name = null,
    Object? tag = null,
    Object? metadata = freezed,
    Object? type = null,
    Object? path = null,
    Object? tableName = freezed,
    Object? model = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileId: freezed == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      tableName: freezed == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageImplCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$ImageImplCopyWith(
          _$ImageImpl value, $Res Function(_$ImageImpl) then) =
      __$$ImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'file_id') int? fileId,
      String name,
      String tag,
      String? metadata,
      String type,
      String path,
      @JsonKey(name: 'table_name') String? tableName,
      String? model,
      String? description,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class __$$ImageImplCopyWithImpl<$Res>
    extends _$ImageCopyWithImpl<$Res, _$ImageImpl>
    implements _$$ImageImplCopyWith<$Res> {
  __$$ImageImplCopyWithImpl(
      _$ImageImpl _value, $Res Function(_$ImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileId = freezed,
    Object? name = null,
    Object? tag = null,
    Object? metadata = freezed,
    Object? type = null,
    Object? path = null,
    Object? tableName = freezed,
    Object? model = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileId: freezed == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      tableName: freezed == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageImpl implements _Image {
  const _$ImageImpl(
      {required this.id,
      @JsonKey(name: 'file_id') this.fileId,
      required this.name,
      required this.tag,
      this.metadata,
      required this.type,
      required this.path,
      @JsonKey(name: 'table_name') this.tableName,
      this.model,
      this.description,
      @JsonKey(name: 'created_at') this.createdAt = '',
      @JsonKey(name: 'updated_at') this.updatedAt = ''});

  factory _$ImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'file_id')
  final int? fileId;
  @override
  final String name;
  @override
  final String tag;
  @override
  final String? metadata;
// made nullable
  @override
  final String type;
  @override
  final String path;
  @override
  @JsonKey(name: 'table_name')
  final String? tableName;
  @override
  final String? model;
// made nullable
  @override
  final String? description;
// made nullable
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'Image(id: $id, fileId: $fileId, name: $name, tag: $tag, metadata: $metadata, type: $type, path: $path, tableName: $tableName, model: $model, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fileId, name, tag, metadata,
      type, path, tableName, model, description, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageImplCopyWith<_$ImageImpl> get copyWith =>
      __$$ImageImplCopyWithImpl<_$ImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageImplToJson(
      this,
    );
  }
}

abstract class _Image implements Image {
  const factory _Image(
      {required final int id,
      @JsonKey(name: 'file_id') final int? fileId,
      required final String name,
      required final String tag,
      final String? metadata,
      required final String type,
      required final String path,
      @JsonKey(name: 'table_name') final String? tableName,
      final String? model,
      final String? description,
      @JsonKey(name: 'created_at') final String createdAt,
      @JsonKey(name: 'updated_at') final String updatedAt}) = _$ImageImpl;

  factory _Image.fromJson(Map<String, dynamic> json) = _$ImageImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'file_id')
  int? get fileId;
  @override
  String get name;
  @override
  String get tag;
  @override
  String? get metadata;
  @override // made nullable
  String get type;
  @override
  String get path;
  @override
  @JsonKey(name: 'table_name')
  String? get tableName;
  @override
  String? get model;
  @override // made nullable
  String? get description;
  @override // made nullable
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ImageImplCopyWith<_$ImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'fabric_number')
  String? get fabricNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop_name')
  String? get shopName => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError; // made nullable
  String? get gsm => throw _privateConstructorUsedError; // made nullable
  @JsonKey(name: 'kg_to_meter_ratio')
  double? get kgToMeterRatio => throw _privateConstructorUsedError;
  double? get average => throw _privateConstructorUsedError; // made nullable
  double? get shortage => throw _privateConstructorUsedError; // made nullable
  int? get quantity => throw _privateConstructorUsedError; // made nullable
  @JsonKey(name: 'unit_id')
  int? get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'accessories_notes')
  String? get accessoriesNotes => throw _privateConstructorUsedError;
  int? get folder_id => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'fabric_number') String? fabricNumber,
      @JsonKey(name: 'shop_name') String? shopName,
      int? width,
      String? gsm,
      @JsonKey(name: 'kg_to_meter_ratio') double? kgToMeterRatio,
      double? average,
      double? shortage,
      int? quantity,
      @JsonKey(name: 'unit_id') int? unitId,
      @JsonKey(name: 'accessories_notes') String? accessoriesNotes,
      int? folder_id,
      String? sku});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fabricNumber = freezed,
    Object? shopName = freezed,
    Object? width = freezed,
    Object? gsm = freezed,
    Object? kgToMeterRatio = freezed,
    Object? average = freezed,
    Object? shortage = freezed,
    Object? quantity = freezed,
    Object? unitId = freezed,
    Object? accessoriesNotes = freezed,
    Object? folder_id = freezed,
    Object? sku = freezed,
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
      fabricNumber: freezed == fabricNumber
          ? _value.fabricNumber
          : fabricNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      shopName: freezed == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      gsm: freezed == gsm
          ? _value.gsm
          : gsm // ignore: cast_nullable_to_non_nullable
              as String?,
      kgToMeterRatio: freezed == kgToMeterRatio
          ? _value.kgToMeterRatio
          : kgToMeterRatio // ignore: cast_nullable_to_non_nullable
              as double?,
      average: freezed == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double?,
      shortage: freezed == shortage
          ? _value.shortage
          : shortage // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitId: freezed == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as int?,
      accessoriesNotes: freezed == accessoriesNotes
          ? _value.accessoriesNotes
          : accessoriesNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      folder_id: freezed == folder_id
          ? _value.folder_id
          : folder_id // ignore: cast_nullable_to_non_nullable
              as int?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'fabric_number') String? fabricNumber,
      @JsonKey(name: 'shop_name') String? shopName,
      int? width,
      String? gsm,
      @JsonKey(name: 'kg_to_meter_ratio') double? kgToMeterRatio,
      double? average,
      double? shortage,
      int? quantity,
      @JsonKey(name: 'unit_id') int? unitId,
      @JsonKey(name: 'accessories_notes') String? accessoriesNotes,
      int? folder_id,
      String? sku});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fabricNumber = freezed,
    Object? shopName = freezed,
    Object? width = freezed,
    Object? gsm = freezed,
    Object? kgToMeterRatio = freezed,
    Object? average = freezed,
    Object? shortage = freezed,
    Object? quantity = freezed,
    Object? unitId = freezed,
    Object? accessoriesNotes = freezed,
    Object? folder_id = freezed,
    Object? sku = freezed,
  }) {
    return _then(_$ItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fabricNumber: freezed == fabricNumber
          ? _value.fabricNumber
          : fabricNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      shopName: freezed == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      gsm: freezed == gsm
          ? _value.gsm
          : gsm // ignore: cast_nullable_to_non_nullable
              as String?,
      kgToMeterRatio: freezed == kgToMeterRatio
          ? _value.kgToMeterRatio
          : kgToMeterRatio // ignore: cast_nullable_to_non_nullable
              as double?,
      average: freezed == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double?,
      shortage: freezed == shortage
          ? _value.shortage
          : shortage // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitId: freezed == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as int?,
      accessoriesNotes: freezed == accessoriesNotes
          ? _value.accessoriesNotes
          : accessoriesNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      folder_id: freezed == folder_id
          ? _value.folder_id
          : folder_id // ignore: cast_nullable_to_non_nullable
              as int?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  const _$ItemImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'fabric_number') this.fabricNumber,
      @JsonKey(name: 'shop_name') this.shopName,
      this.width = 0,
      this.gsm = '',
      @JsonKey(name: 'kg_to_meter_ratio') this.kgToMeterRatio,
      this.average,
      this.shortage,
      this.quantity,
      @JsonKey(name: 'unit_id') this.unitId,
      @JsonKey(name: 'accessories_notes') this.accessoriesNotes,
      this.folder_id = 0,
      this.sku = ''});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'fabric_number')
  final String? fabricNumber;
  @override
  @JsonKey(name: 'shop_name')
  final String? shopName;
  @override
  @JsonKey()
  final int? width;
// made nullable
  @override
  @JsonKey()
  final String? gsm;
// made nullable
  @override
  @JsonKey(name: 'kg_to_meter_ratio')
  final double? kgToMeterRatio;
  @override
  final double? average;
// made nullable
  @override
  final double? shortage;
// made nullable
  @override
  final int? quantity;
// made nullable
  @override
  @JsonKey(name: 'unit_id')
  final int? unitId;
  @override
  @JsonKey(name: 'accessories_notes')
  final String? accessoriesNotes;
  @override
  @JsonKey()
  final int? folder_id;
  @override
  @JsonKey()
  final String? sku;

  @override
  String toString() {
    return 'Item(id: $id, name: $name, fabricNumber: $fabricNumber, shopName: $shopName, width: $width, gsm: $gsm, kgToMeterRatio: $kgToMeterRatio, average: $average, shortage: $shortage, quantity: $quantity, unitId: $unitId, accessoriesNotes: $accessoriesNotes, folder_id: $folder_id, sku: $sku)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fabricNumber, fabricNumber) ||
                other.fabricNumber == fabricNumber) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.gsm, gsm) || other.gsm == gsm) &&
            (identical(other.kgToMeterRatio, kgToMeterRatio) ||
                other.kgToMeterRatio == kgToMeterRatio) &&
            (identical(other.average, average) || other.average == average) &&
            (identical(other.shortage, shortage) ||
                other.shortage == shortage) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.accessoriesNotes, accessoriesNotes) ||
                other.accessoriesNotes == accessoriesNotes) &&
            (identical(other.folder_id, folder_id) ||
                other.folder_id == folder_id) &&
            (identical(other.sku, sku) || other.sku == sku));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      fabricNumber,
      shopName,
      width,
      gsm,
      kgToMeterRatio,
      average,
      shortage,
      quantity,
      unitId,
      accessoriesNotes,
      folder_id,
      sku);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {required final int id,
      required final String name,
      @JsonKey(name: 'fabric_number') final String? fabricNumber,
      @JsonKey(name: 'shop_name') final String? shopName,
      final int? width,
      final String? gsm,
      @JsonKey(name: 'kg_to_meter_ratio') final double? kgToMeterRatio,
      final double? average,
      final double? shortage,
      final int? quantity,
      @JsonKey(name: 'unit_id') final int? unitId,
      @JsonKey(name: 'accessories_notes') final String? accessoriesNotes,
      final int? folder_id,
      final String? sku}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'fabric_number')
  String? get fabricNumber;
  @override
  @JsonKey(name: 'shop_name')
  String? get shopName;
  @override
  int? get width;
  @override // made nullable
  String? get gsm;
  @override // made nullable
  @JsonKey(name: 'kg_to_meter_ratio')
  double? get kgToMeterRatio;
  @override
  double? get average;
  @override // made nullable
  double? get shortage;
  @override // made nullable
  int? get quantity;
  @override // made nullable
  @JsonKey(name: 'unit_id')
  int? get unitId;
  @override
  @JsonKey(name: 'accessories_notes')
  String? get accessoriesNotes;
  @override
  int? get folder_id;
  @override
  String? get sku;
  @override
  @JsonKey(ignore: true)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
