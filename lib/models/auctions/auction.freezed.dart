// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Auction _$AuctionFromJson(Map<String, dynamic> json) {
  return _Auction.fromJson(json);
}

/// @nodoc
mixin _$Auction {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'starting_price')
  double get startingPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  @TimestampConverter()
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'strategy')
  @StrategyConverter()
  AuctionStrategy get strategy => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_id')
  String get itemId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuctionCopyWith<Auction> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuctionCopyWith<$Res> {
  factory $AuctionCopyWith(Auction value, $Res Function(Auction) then) =
      _$AuctionCopyWithImpl<$Res, Auction>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'starting_price') double startingPrice,
      @JsonKey(name: 'end_date') @TimestampConverter() DateTime endDate,
      @JsonKey(name: 'strategy') @StrategyConverter() AuctionStrategy strategy,
      @JsonKey(name: 'item_id') String itemId});
}

/// @nodoc
class _$AuctionCopyWithImpl<$Res, $Val extends Auction>
    implements $AuctionCopyWith<$Res> {
  _$AuctionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startingPrice = null,
    Object? endDate = null,
    Object? strategy = null,
    Object? itemId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as AuctionStrategy,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuctionImplCopyWith<$Res> implements $AuctionCopyWith<$Res> {
  factory _$$AuctionImplCopyWith(
          _$AuctionImpl value, $Res Function(_$AuctionImpl) then) =
      __$$AuctionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'starting_price') double startingPrice,
      @JsonKey(name: 'end_date') @TimestampConverter() DateTime endDate,
      @JsonKey(name: 'strategy') @StrategyConverter() AuctionStrategy strategy,
      @JsonKey(name: 'item_id') String itemId});
}

/// @nodoc
class __$$AuctionImplCopyWithImpl<$Res>
    extends _$AuctionCopyWithImpl<$Res, _$AuctionImpl>
    implements _$$AuctionImplCopyWith<$Res> {
  __$$AuctionImplCopyWithImpl(
      _$AuctionImpl _value, $Res Function(_$AuctionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startingPrice = null,
    Object? endDate = null,
    Object? strategy = null,
    Object? itemId = null,
  }) {
    return _then(_$AuctionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as AuctionStrategy,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuctionImpl implements _Auction {
  _$AuctionImpl(
      {required this.id,
      @JsonKey(name: 'starting_price') required this.startingPrice,
      @JsonKey(name: 'end_date') @TimestampConverter() required this.endDate,
      @JsonKey(name: 'strategy') @StrategyConverter() required this.strategy,
      @JsonKey(name: 'item_id') required this.itemId});

  factory _$AuctionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuctionImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'starting_price')
  final double startingPrice;
  @override
  @JsonKey(name: 'end_date')
  @TimestampConverter()
  final DateTime endDate;
  @override
  @JsonKey(name: 'strategy')
  @StrategyConverter()
  final AuctionStrategy strategy;
  @override
  @JsonKey(name: 'item_id')
  final String itemId;

  @override
  String toString() {
    return 'Auction(id: $id, startingPrice: $startingPrice, endDate: $endDate, strategy: $strategy, itemId: $itemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuctionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startingPrice, startingPrice) ||
                other.startingPrice == startingPrice) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.strategy, strategy) ||
                other.strategy == strategy) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, startingPrice, endDate, strategy, itemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuctionImplCopyWith<_$AuctionImpl> get copyWith =>
      __$$AuctionImplCopyWithImpl<_$AuctionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuctionImplToJson(
      this,
    );
  }
}

abstract class _Auction implements Auction {
  factory _Auction(
      {required final String id,
      @JsonKey(name: 'starting_price') required final double startingPrice,
      @JsonKey(name: 'end_date')
      @TimestampConverter()
      required final DateTime endDate,
      @JsonKey(name: 'strategy')
      @StrategyConverter()
      required final AuctionStrategy strategy,
      @JsonKey(name: 'item_id') required final String itemId}) = _$AuctionImpl;

  factory _Auction.fromJson(Map<String, dynamic> json) = _$AuctionImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'starting_price')
  double get startingPrice;
  @override
  @JsonKey(name: 'end_date')
  @TimestampConverter()
  DateTime get endDate;
  @override
  @JsonKey(name: 'strategy')
  @StrategyConverter()
  AuctionStrategy get strategy;
  @override
  @JsonKey(name: 'item_id')
  String get itemId;
  @override
  @JsonKey(ignore: true)
  _$$AuctionImplCopyWith<_$AuctionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
