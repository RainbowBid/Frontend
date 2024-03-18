// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateItemDto {
  String get brief => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ({Uint8List bytes, String filename, String mimeType}) get picture =>
      throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateItemDtoCopyWith<CreateItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateItemDtoCopyWith<$Res> {
  factory $CreateItemDtoCopyWith(
          CreateItemDto value, $Res Function(CreateItemDto) then) =
      _$CreateItemDtoCopyWithImpl<$Res, CreateItemDto>;
  @useResult
  $Res call(
      {String brief,
      String description,
      ({Uint8List bytes, String filename, String mimeType}) picture,
      Category category});
}

/// @nodoc
class _$CreateItemDtoCopyWithImpl<$Res, $Val extends CreateItemDto>
    implements $CreateItemDtoCopyWith<$Res> {
  _$CreateItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brief = null,
    Object? description = null,
    Object? picture = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      brief: null == brief
          ? _value.brief
          : brief // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as ({Uint8List bytes, String filename, String mimeType}),
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateItemDtoImplCopyWith<$Res>
    implements $CreateItemDtoCopyWith<$Res> {
  factory _$$CreateItemDtoImplCopyWith(
          _$CreateItemDtoImpl value, $Res Function(_$CreateItemDtoImpl) then) =
      __$$CreateItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String brief,
      String description,
      ({Uint8List bytes, String filename, String mimeType}) picture,
      Category category});
}

/// @nodoc
class __$$CreateItemDtoImplCopyWithImpl<$Res>
    extends _$CreateItemDtoCopyWithImpl<$Res, _$CreateItemDtoImpl>
    implements _$$CreateItemDtoImplCopyWith<$Res> {
  __$$CreateItemDtoImplCopyWithImpl(
      _$CreateItemDtoImpl _value, $Res Function(_$CreateItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brief = null,
    Object? description = null,
    Object? picture = null,
    Object? category = null,
  }) {
    return _then(_$CreateItemDtoImpl(
      brief: null == brief
          ? _value.brief
          : brief // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as ({Uint8List bytes, String filename, String mimeType}),
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class _$CreateItemDtoImpl implements _CreateItemDto {
  const _$CreateItemDtoImpl(
      {required this.brief,
      required this.description,
      required this.picture,
      required this.category});

  @override
  final String brief;
  @override
  final String description;
  @override
  final ({Uint8List bytes, String filename, String mimeType}) picture;
  @override
  final Category category;

  @override
  String toString() {
    return 'CreateItemDto(brief: $brief, description: $description, picture: $picture, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateItemDtoImpl &&
            (identical(other.brief, brief) || other.brief == brief) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, brief, description, picture, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateItemDtoImplCopyWith<_$CreateItemDtoImpl> get copyWith =>
      __$$CreateItemDtoImplCopyWithImpl<_$CreateItemDtoImpl>(this, _$identity);
}

abstract class _CreateItemDto implements CreateItemDto {
  const factory _CreateItemDto(
      {required final String brief,
      required final String description,
      required final ({
        Uint8List bytes,
        String filename,
        String mimeType
      }) picture,
      required final Category category}) = _$CreateItemDtoImpl;

  @override
  String get brief;
  @override
  String get description;
  @override
  ({Uint8List bytes, String filename, String mimeType}) get picture;
  @override
  Category get category;
  @override
  @JsonKey(ignore: true)
  _$$CreateItemDtoImplCopyWith<_$CreateItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
