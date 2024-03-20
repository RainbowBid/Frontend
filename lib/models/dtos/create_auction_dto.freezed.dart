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

/// @nodoc
mixin _$CreateAuctionDto {
  double get startingPrice => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;

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
  $Res call({double startingPrice, String endDate});
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
    Object? startingPrice = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      startingPrice: null == startingPrice
          ? _value.startingPrice
          : startingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
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
  $Res call({double startingPrice, String endDate});
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
    Object? startingPrice = null,
    Object? endDate = null,
  }) {
    return _then(_$CreateAuctionDtoImpl(
      startingPrice: null == startingPrice
          ? _value.startingPrice
          : startingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateAuctionDtoImpl implements _CreateAuctionDto {
  const _$CreateAuctionDtoImpl(
      {required this.startingPrice, required this.endDate});

  @override
  final double startingPrice;
  @override
  final String endDate;

  @override
  String toString() {
    return 'CreateAuctionDto(startingPrice: $startingPrice, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAuctionDtoImpl &&
            (identical(other.startingPrice, startingPrice) ||
                other.startingPrice == startingPrice) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startingPrice, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAuctionDtoImplCopyWith<_$CreateAuctionDtoImpl> get copyWith =>
      __$$CreateAuctionDtoImplCopyWithImpl<_$CreateAuctionDtoImpl>(
          this, _$identity);
}

abstract class _CreateAuctionDto implements CreateAuctionDto {
  const factory _CreateAuctionDto(
      {required final double startingPrice,
      required final String endDate}) = _$CreateAuctionDtoImpl;

  @override
  double get startingPrice;
  @override
  String get endDate;
  @override
  @JsonKey(ignore: true)
  _$$CreateAuctionDtoImplCopyWith<_$CreateAuctionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}