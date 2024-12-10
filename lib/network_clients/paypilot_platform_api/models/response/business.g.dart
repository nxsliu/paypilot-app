// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Business _$BusinessFromJson(Map<String, dynamic> json) => Business(
      json['id'] as String,
      json['name'] as String,
      json['logoURL'] as String?,
      BusinessOwner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusinessToJson(Business instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoURL': instance.logoURL,
      'owner': instance.owner,
    };
