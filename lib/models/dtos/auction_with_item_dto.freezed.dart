// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auction_with_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuctionWithItemDto _$AuctionWithItemDtoFromJson(Map<String, dynamic> json) {
  return _AuctionWithItemDto.fromJson(json);
}

/// @nodoc
mixin _$AuctionWithItemDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'starting_price')
  double get startingPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  @TimestampConverter()
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_id')
  String get itemId => throw _privateConstructorUsedError;
  String get brief => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @CategoryConverter()
  Category get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'strategy')
  @StrategyConverter()
  String get strategy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuctionWithItemDtoCopyWith<AuctionWithItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuctionWithItemDtoCopyWith<$Res> {
  factory $AuctionWithItemDtoCopyWith(
          AuctionWithItemDto value, $Res Function(AuctionWithItemDto) then) =
      _$AuctionWithItemDtoCopyWithImpl<$Res, AuctionWithItemDto>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'starting_price') double startingPrice,
      @JsonKey(name: 'end_date') @TimestampConverter() DateTime endDate,
      @JsonKey(name: 'item_id') String itemId,
      String brief,
      String description,
      @CategoryConverter() Category category,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'strategy') @StrategyConverter() String strategy});
}

/// @nodoc
class _$AuctionWithItemDtoCopyWithImpl<$Res, $Val extends AuctionWithItemDto>
    implements $AuctionWithItemDtoCopyWith<$Res> {
  _$AuctionWithItemDtoCopyWithImpl(this._value, this._then);

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
    Object? itemId = null,
    Object? brief = null,
    Object? description = null,
    Object? category = null,
    Object? userId = null,
    Object? strategy = null,
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
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      brief: null == brief
          ? _value.brief
          : brief // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      strategy: null == strategy
          ? _value.strategy
          : strategy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuctionWithItemDtoImplCopyWith<$Res>
    implements $AuctionWithItemDtoCopyWith<$Res> {
  factory _$$AuctionWithItemDtoImplCopyWith(_$AuctionWithItemDtoImpl value,
          $Res Function(_$AuctionWithItemDtoImpl) then) =
      __$$AuctionWithItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'starting_price') double startingPrice,
      @JsonKey(name: 'end_date') @TimestampConverter() DateTime endDate,
      @JsonKey(name: 'item_id') String itemId,
      String brief,
      String description,
      @CategoryConverter() Category category,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'strategy') @StrategyConverter() String strategy});
}

/// @nodoc
class __$$AuctionWithItemDtoImplCopyWithImpl<$Res>
    extends _$AuctionWithItemDtoCopyWithImpl<$Res, _$AuctionWithItemDtoImpl>
    implements _$$AuctionWithItemDtoImplCopyWith<$Res> {
  __$$AuctionWithItemDtoImplCopyWithImpl(_$AuctionWithItemDtoImpl _value,
      $Res Function(_$AuctionWithItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startingPrice = null,
    Object? endDate = null,
    Object? itemId = null,
    Object? brief = null,
    Object? description = null,
    Object? category = null,
    Object? userId = null,
    Object? strategy = null,
  }) {
    return _then(_$AuctionWithItemDtoImpl(
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
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      brief: null == brief
          ? _value.brief
          : brief // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      strategy: null == strategy
          ? _value.strategy
          : strategy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuctionWithItemDtoImpl implements _AuctionWithItemDto {
  const _$AuctionWithItemDtoImpl(
      {required this.id,
      @JsonKey(name: 'starting_price') required this.startingPrice,
      @JsonKey(name: 'end_date') @TimestampConverter() required this.endDate,
      @JsonKey(name: 'item_id') required this.itemId,
      required this.brief,
      required this.description,
      @CategoryConverter() required this.category,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'strategy') @StrategyConverter() required this.strategy});

  factory _$AuctionWithItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuctionWithItemDtoImplFromJson(json);

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
  @JsonKey(name: 'item_id')
  final String itemId;
  @override
  final String brief;
  @override
  final String description;
  @override
  @CategoryConverter()
  final Category category;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'strategy')
  @StrategyConverter()
  final String strategy;

  @override
  String toString() {
    return 'AuctionWithItemDto(id: $id, startingPrice: $startingPrice, endDate: $endDate, itemId: $itemId, brief: $brief, description: $description, category: $category, userId: $userId, strategy: $strategy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuctionWithItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startingPrice, startingPrice) ||
                other.startingPrice == startingPrice) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.brief, brief) || other.brief == brief) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.strategy, strategy) ||
                other.strategy == strategy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startingPrice, endDate,
      itemId, brief, description, category, userId, strategy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuctionWithItemDtoImplCopyWith<_$AuctionWithItemDtoImpl> get copyWith =>
      __$$AuctionWithItemDtoImplCopyWithImpl<_$AuctionWithItemDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuctionWithItemDtoImplToJson(
      this,
    );
  }
}

abstract class _AuctionWithItemDto implements AuctionWithItemDto {
  const factory _AuctionWithItemDto(
      {required final String id,
      @JsonKey(name: 'starting_price') required final double startingPrice,
      @JsonKey(name: 'end_date')
      @TimestampConverter()
      required final DateTime endDate,
      @JsonKey(name: 'item_id') required final String itemId,
      required final String brief,
      required final String description,
      @CategoryConverter() required final Category category,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'strategy')
      @StrategyConverter()
      required final String strategy}) = _$AuctionWithItemDtoImpl;

  factory _AuctionWithItemDto.fromJson(Map<String, dynamic> json) =
      _$AuctionWithItemDtoImpl.fromJson;

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
  @JsonKey(name: 'item_id')
  String get itemId;
  @override
  String get brief;
  @override
  String get description;
  @override
  @CategoryConverter()
  Category get category;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'strategy')
  @StrategyConverter()
  String get strategy;
  @override
  @JsonKey(ignore: true)
  _$$AuctionWithItemDtoImplCopyWith<_$AuctionWithItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
