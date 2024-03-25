// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_bid_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateBidDto _$CreateBidDtoFromJson(Map<String, dynamic> json) {
  return _CreateBidDto.fromJson(json);
}

/// @nodoc
mixin _$CreateBidDto {
  @JsonKey(includeToJson: false)
  String get auctionId => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateBidDtoCopyWith<CreateBidDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBidDtoCopyWith<$Res> {
  factory $CreateBidDtoCopyWith(
          CreateBidDto value, $Res Function(CreateBidDto) then) =
      _$CreateBidDtoCopyWithImpl<$Res, CreateBidDto>;
  @useResult
  $Res call({@JsonKey(includeToJson: false) String auctionId, double value});
}

/// @nodoc
class _$CreateBidDtoCopyWithImpl<$Res, $Val extends CreateBidDto>
    implements $CreateBidDtoCopyWith<$Res> {
  _$CreateBidDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auctionId = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      auctionId: null == auctionId
          ? _value.auctionId
          : auctionId // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateBidDtoImplCopyWith<$Res>
    implements $CreateBidDtoCopyWith<$Res> {
  factory _$$CreateBidDtoImplCopyWith(
          _$CreateBidDtoImpl value, $Res Function(_$CreateBidDtoImpl) then) =
      __$$CreateBidDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeToJson: false) String auctionId, double value});
}

/// @nodoc
class __$$CreateBidDtoImplCopyWithImpl<$Res>
    extends _$CreateBidDtoCopyWithImpl<$Res, _$CreateBidDtoImpl>
    implements _$$CreateBidDtoImplCopyWith<$Res> {
  __$$CreateBidDtoImplCopyWithImpl(
      _$CreateBidDtoImpl _value, $Res Function(_$CreateBidDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auctionId = null,
    Object? value = null,
  }) {
    return _then(_$CreateBidDtoImpl(
      auctionId: null == auctionId
          ? _value.auctionId
          : auctionId // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateBidDtoImpl implements _CreateBidDto {
  const _$CreateBidDtoImpl(
      {@JsonKey(includeToJson: false) required this.auctionId,
      required this.value});

  factory _$CreateBidDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateBidDtoImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String auctionId;
  @override
  final double value;

  @override
  String toString() {
    return 'CreateBidDto(auctionId: $auctionId, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBidDtoImpl &&
            (identical(other.auctionId, auctionId) ||
                other.auctionId == auctionId) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, auctionId, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBidDtoImplCopyWith<_$CreateBidDtoImpl> get copyWith =>
      __$$CreateBidDtoImplCopyWithImpl<_$CreateBidDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBidDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateBidDto implements CreateBidDto {
  const factory _CreateBidDto(
      {@JsonKey(includeToJson: false) required final String auctionId,
      required final double value}) = _$CreateBidDtoImpl;

  factory _CreateBidDto.fromJson(Map<String, dynamic> json) =
      _$CreateBidDtoImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String get auctionId;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$CreateBidDtoImplCopyWith<_$CreateBidDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
