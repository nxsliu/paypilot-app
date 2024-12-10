// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessOwner _$BusinessOwnerFromJson(Map<String, dynamic> json) =>
    BusinessOwner(
      json['firstName'] as String,
      json['lastName'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$BusinessOwnerToJson(BusinessOwner instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };
