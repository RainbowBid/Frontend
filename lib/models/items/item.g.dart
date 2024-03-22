// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      id: json['id'] as String,
      brief: json['brief'] as String,
      description: json['description'] as String,
      userId: json['user_id'] as String,
      category: const CategoryConverter().fromJson(json['category'] as String),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brief': instance.brief,
      'description': instance.description,
      'user_id': instance.userId,
      'category': const CategoryConverter().toJson(instance.category),
    };
