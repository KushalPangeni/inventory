// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FolderState {
  ApiRequestState<dynamic>? get status => throw _privateConstructorUsedError;
  ApiRequestState<dynamic>? get uploadStatus =>
      throw _privateConstructorUsedError;
  ApiRequestState<dynamic>? get moveStatus =>
      throw _privateConstructorUsedError;
  List<Folder> get listOfFolders => throw _privateConstructorUsedError;
  String get folderName => throw _privateConstructorUsedError;
  List<Tag> get foldersTag => throw _privateConstructorUsedError;
  String get folderDescription => throw _privateConstructorUsedError;
  String get folderImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FolderStateCopyWith<FolderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderStateCopyWith<$Res> {
  factory $FolderStateCopyWith(
          FolderState value, $Res Function(FolderState) then) =
      _$FolderStateCopyWithImpl<$Res, FolderState>;
  @useResult
  $Res call(
      {ApiRequestState<dynamic>? status,
      ApiRequestState<dynamic>? uploadStatus,
      ApiRequestState<dynamic>? moveStatus,
      List<Folder> listOfFolders,
      String folderName,
      List<Tag> foldersTag,
      String folderDescription,
      String folderImage});

  $ApiRequestStateCopyWith<dynamic, $Res>? get status;
  $ApiRequestStateCopyWith<dynamic, $Res>? get uploadStatus;
  $ApiRequestStateCopyWith<dynamic, $Res>? get moveStatus;
}

/// @nodoc
class _$FolderStateCopyWithImpl<$Res, $Val extends FolderState>
    implements $FolderStateCopyWith<$Res> {
  _$FolderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? uploadStatus = freezed,
    Object? moveStatus = freezed,
    Object? listOfFolders = null,
    Object? folderName = null,
    Object? foldersTag = null,
    Object? folderDescription = null,
    Object? folderImage = null,
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
      moveStatus: freezed == moveStatus
          ? _value.moveStatus
          : moveStatus // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      listOfFolders: null == listOfFolders
          ? _value.listOfFolders
          : listOfFolders // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
      folderName: null == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String,
      foldersTag: null == foldersTag
          ? _value.foldersTag
          : foldersTag // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      folderDescription: null == folderDescription
          ? _value.folderDescription
          : folderDescription // ignore: cast_nullable_to_non_nullable
              as String,
      folderImage: null == folderImage
          ? _value.folderImage
          : folderImage // ignore: cast_nullable_to_non_nullable
              as String,
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

  @override
  @pragma('vm:prefer-inline')
  $ApiRequestStateCopyWith<dynamic, $Res>? get moveStatus {
    if (_value.moveStatus == null) {
      return null;
    }

    return $ApiRequestStateCopyWith<dynamic, $Res>(_value.moveStatus!, (value) {
      return _then(_value.copyWith(moveStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FolderStateImplCopyWith<$Res>
    implements $FolderStateCopyWith<$Res> {
  factory _$$FolderStateImplCopyWith(
          _$FolderStateImpl value, $Res Function(_$FolderStateImpl) then) =
      __$$FolderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiRequestState<dynamic>? status,
      ApiRequestState<dynamic>? uploadStatus,
      ApiRequestState<dynamic>? moveStatus,
      List<Folder> listOfFolders,
      String folderName,
      List<Tag> foldersTag,
      String folderDescription,
      String folderImage});

  @override
  $ApiRequestStateCopyWith<dynamic, $Res>? get status;
  @override
  $ApiRequestStateCopyWith<dynamic, $Res>? get uploadStatus;
  @override
  $ApiRequestStateCopyWith<dynamic, $Res>? get moveStatus;
}

/// @nodoc
class __$$FolderStateImplCopyWithImpl<$Res>
    extends _$FolderStateCopyWithImpl<$Res, _$FolderStateImpl>
    implements _$$FolderStateImplCopyWith<$Res> {
  __$$FolderStateImplCopyWithImpl(
      _$FolderStateImpl _value, $Res Function(_$FolderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? uploadStatus = freezed,
    Object? moveStatus = freezed,
    Object? listOfFolders = null,
    Object? folderName = null,
    Object? foldersTag = null,
    Object? folderDescription = null,
    Object? folderImage = null,
  }) {
    return _then(_$FolderStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      uploadStatus: freezed == uploadStatus
          ? _value.uploadStatus
          : uploadStatus // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      moveStatus: freezed == moveStatus
          ? _value.moveStatus
          : moveStatus // ignore: cast_nullable_to_non_nullable
              as ApiRequestState<dynamic>?,
      listOfFolders: null == listOfFolders
          ? _value._listOfFolders
          : listOfFolders // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
      folderName: null == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String,
      foldersTag: null == foldersTag
          ? _value._foldersTag
          : foldersTag // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      folderDescription: null == folderDescription
          ? _value.folderDescription
          : folderDescription // ignore: cast_nullable_to_non_nullable
              as String,
      folderImage: null == folderImage
          ? _value.folderImage
          : folderImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FolderStateImpl implements _FolderState {
  const _$FolderStateImpl(
      {this.status = const InitialState(),
      this.uploadStatus = const InitialState(),
      this.moveStatus = const InitialState(),
      final List<Folder> listOfFolders = const [],
      this.folderName = '',
      final List<Tag> foldersTag = const [],
      this.folderDescription = '',
      this.folderImage = ''})
      : _listOfFolders = listOfFolders,
        _foldersTag = foldersTag;

  @override
  @JsonKey()
  final ApiRequestState<dynamic>? status;
  @override
  @JsonKey()
  final ApiRequestState<dynamic>? uploadStatus;
  @override
  @JsonKey()
  final ApiRequestState<dynamic>? moveStatus;
  final List<Folder> _listOfFolders;
  @override
  @JsonKey()
  List<Folder> get listOfFolders {
    if (_listOfFolders is EqualUnmodifiableListView) return _listOfFolders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfFolders);
  }

  @override
  @JsonKey()
  final String folderName;
  final List<Tag> _foldersTag;
  @override
  @JsonKey()
  List<Tag> get foldersTag {
    if (_foldersTag is EqualUnmodifiableListView) return _foldersTag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foldersTag);
  }

  @override
  @JsonKey()
  final String folderDescription;
  @override
  @JsonKey()
  final String folderImage;

  @override
  String toString() {
    return 'FolderState(status: $status, uploadStatus: $uploadStatus, moveStatus: $moveStatus, listOfFolders: $listOfFolders, folderName: $folderName, foldersTag: $foldersTag, folderDescription: $folderDescription, folderImage: $folderImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.uploadStatus, uploadStatus) ||
                other.uploadStatus == uploadStatus) &&
            (identical(other.moveStatus, moveStatus) ||
                other.moveStatus == moveStatus) &&
            const DeepCollectionEquality()
                .equals(other._listOfFolders, _listOfFolders) &&
            (identical(other.folderName, folderName) ||
                other.folderName == folderName) &&
            const DeepCollectionEquality()
                .equals(other._foldersTag, _foldersTag) &&
            (identical(other.folderDescription, folderDescription) ||
                other.folderDescription == folderDescription) &&
            (identical(other.folderImage, folderImage) ||
                other.folderImage == folderImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      uploadStatus,
      moveStatus,
      const DeepCollectionEquality().hash(_listOfFolders),
      folderName,
      const DeepCollectionEquality().hash(_foldersTag),
      folderDescription,
      folderImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderStateImplCopyWith<_$FolderStateImpl> get copyWith =>
      __$$FolderStateImplCopyWithImpl<_$FolderStateImpl>(this, _$identity);
}

abstract class _FolderState implements FolderState {
  const factory _FolderState(
      {final ApiRequestState<dynamic>? status,
      final ApiRequestState<dynamic>? uploadStatus,
      final ApiRequestState<dynamic>? moveStatus,
      final List<Folder> listOfFolders,
      final String folderName,
      final List<Tag> foldersTag,
      final String folderDescription,
      final String folderImage}) = _$FolderStateImpl;

  @override
  ApiRequestState<dynamic>? get status;
  @override
  ApiRequestState<dynamic>? get uploadStatus;
  @override
  ApiRequestState<dynamic>? get moveStatus;
  @override
  List<Folder> get listOfFolders;
  @override
  String get folderName;
  @override
  List<Tag> get foldersTag;
  @override
  String get folderDescription;
  @override
  String get folderImage;
  @override
  @JsonKey(ignore: true)
  _$$FolderStateImplCopyWith<_$FolderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
