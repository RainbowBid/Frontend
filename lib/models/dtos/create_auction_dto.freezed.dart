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
  @JsonKey(name: 'item_id')
  String get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'starting_price')
  double get startingPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  @TimestampConverter()
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'strategy')
  String get strategy => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'starting_price') double startingPrice,
      @JsonKey(name: 'end_date') @TimestampConverter() DateTime endDate,
      @JsonKey(name: 'strategy') String strategy});
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
    Object? itemId = null,
    Object? startingPrice = null,
    Object? endDate = null,
    Object? strategy = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      startingPrice: null == startingPrice
          ? _value.startingPrice
          : startingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      strategy: null == strategy
          ? _value.strategy
          : strategy // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call(
      {@JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'starting_price') double startingPrice,
      @JsonKey(name: 'end_date') @TimestampConverter() DateTime endDate,
      @JsonKey(name: 'strategy') String strategy});
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
    Object? itemId = null,
    Object? startingPrice = null,
    Object? endDate = null,
    Object? strategy = null,
  }) {
    return _then(_$CreateAuctionDtoImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      startingPrice: null == startingPrice
          ? _value.startingPrice
          : startingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      strategy: null == strategy
          ? _value.strategy
          : strategy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateAuctionDtoImpl implements _CreateAuctionDto {
  const _$CreateAuctionDtoImpl(
      {@JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'starting_price') required this.startingPrice,
      @JsonKey(name: 'end_date') @TimestampConverter() required this.endDate,
      @JsonKey(name: 'strategy') required this.strategy});

  factory _$CreateAuctionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateAuctionDtoImplFromJson(json);

  @override
  @JsonKey(name: 'item_id')
  final String itemId;
  @override
  @JsonKey(name: 'starting_price')
  final double startingPrice;
  @override
  @JsonKey(name: 'end_date')
  @TimestampConverter()
  final DateTime endDate;
  @override
  @JsonKey(name: 'strategy')
  final String strategy;

  @override
  String toString() {
    return 'CreateAuctionDto(itemId: $itemId, startingPrice: $startingPrice, endDate: $endDate, strategy: $strategy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAuctionDtoImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.startingPrice, startingPrice) ||
                other.startingPrice == startingPrice) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.strategy, strategy) ||
                other.strategy == strategy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, itemId, startingPrice, endDate, strategy);

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
          {@JsonKey(name: 'item_id') required final String itemId,
          @JsonKey(name: 'starting_price') required final double startingPrice,
          @JsonKey(name: 'end_date')
          @TimestampConverter()
          required final DateTime endDate,
          @JsonKey(name: 'strategy') required final String strategy}) =
      _$CreateAuctionDtoImpl;

  factory _CreateAuctionDto.fromJson(Map<String, dynamic> json) =
      _$CreateAuctionDtoImpl.fromJson;

  @override
  @JsonKey(name: 'item_id')
  String get itemId;
  @override
  @JsonKey(name: 'starting_price')
  double get startingPrice;
  @override
  @JsonKey(name: 'end_date')
  @TimestampConverter()
  DateTime get endDate;
  @override
  @JsonKey(name: 'strategy')
  String get strategy;
  @override
  @JsonKey(ignore: true)
  _$$CreateAuctionDtoImplCopyWith<_$CreateAuctionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
