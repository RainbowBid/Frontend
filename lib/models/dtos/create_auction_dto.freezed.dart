// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_auction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateAuctionDto _$CreateAuctionDtoFromJson(Map<String, dynamic> json) {
  return _CreateAuctionDto.fromJson(json);
}

/// @nodoc
mixin _$CreateAuctionDto {
  String get item_id => throw _privateConstructorUsedError;
  double get starting_price => throw _privateConstructorUsedError;
  DateTime get end_date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateAuctionDtoCopyWith<CreateAuctionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAuctionDtoCopyWith<$Res> {
  factory $CreateAuctionDtoCopyWith(
          CreateAuctionDto value, $Res Function(CreateAuctionDto) then) =
      _$CreateAuctionDtoCopyWithImpl<$Res, CreateAuctionDto>;
  @useResult
  $Res call({String item_id, double starting_price, DateTime end_date});
}

/// @nodoc
class _$CreateAuctionDtoCopyWithImpl<$Res, $Val extends CreateAuctionDto>
    implements $CreateAuctionDtoCopyWith<$Res> {
  _$CreateAuctionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item_id = null,
    Object? starting_price = null,
    Object? end_date = null,
  }) {
    return _then(_value.copyWith(
      item_id: null == item_id
          ? _value.item_id
          : item_id // ignore: cast_nullable_to_non_nullable
              as String,
      starting_price: null == starting_price
          ? _value.starting_price
          : starting_price // ignore: cast_nullable_to_non_nullable
              as double,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateAuctionDtoImplCopyWith<$Res>
    implements $CreateAuctionDtoCopyWith<$Res> {
  factory _$$CreateAuctionDtoImplCopyWith(_$CreateAuctionDtoImpl value,
          $Res Function(_$CreateAuctionDtoImpl) then) =
      __$$CreateAuctionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String item_id, double starting_price, DateTime end_date});
}

/// @nodoc
class __$$CreateAuctionDtoImplCopyWithImpl<$Res>
    extends _$CreateAuctionDtoCopyWithImpl<$Res, _$CreateAuctionDtoImpl>
    implements _$$CreateAuctionDtoImplCopyWith<$Res> {
  __$$CreateAuctionDtoImplCopyWithImpl(_$CreateAuctionDtoImpl _value,
      $Res Function(_$CreateAuctionDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item_id = null,
    Object? starting_price = null,
    Object? end_date = null,
  }) {
    return _then(_$CreateAuctionDtoImpl(
      item_id: null == item_id
          ? _value.item_id
          : item_id // ignore: cast_nullable_to_non_nullable
              as String,
      starting_price: null == starting_price
          ? _value.starting_price
          : starting_price // ignore: cast_nullable_to_non_nullable
              as double,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateAuctionDtoImpl implements _CreateAuctionDto {
  const _$CreateAuctionDtoImpl(
      {required this.item_id,
      required this.starting_price,
      required this.end_date});

  factory _$CreateAuctionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateAuctionDtoImplFromJson(json);

  @override
  final String item_id;
  @override
  final double starting_price;
  @override
  final DateTime end_date;

  @override
  String toString() {
    return 'CreateAuctionDto(item_id: $item_id, starting_price: $starting_price, end_date: $end_date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAuctionDtoImpl &&
            (identical(other.item_id, item_id) || other.item_id == item_id) &&
            (identical(other.starting_price, starting_price) ||
                other.starting_price == starting_price) &&
            (identical(other.end_date, end_date) ||
                other.end_date == end_date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, item_id, starting_price, end_date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAuctionDtoImplCopyWith<_$CreateAuctionDtoImpl> get copyWith =>
      __$$CreateAuctionDtoImplCopyWithImpl<_$CreateAuctionDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateAuctionDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateAuctionDto implements CreateAuctionDto {
  const factory _CreateAuctionDto(
      {required final String item_id,
      required final double starting_price,
      required final DateTime end_date}) = _$CreateAuctionDtoImpl;

  factory _CreateAuctionDto.fromJson(Map<String, dynamic> json) =
      _$CreateAuctionDtoImpl.fromJson;

  @override
  String get item_id;
  @override
  double get starting_price;
  @override
  DateTime get end_date;
  @override
  @JsonKey(ignore: true)
  _$$CreateAuctionDtoImplCopyWith<_$CreateAuctionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
