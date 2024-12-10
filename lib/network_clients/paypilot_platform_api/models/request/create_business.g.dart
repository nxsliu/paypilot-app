// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBusiness _$CreateBusinessFromJson(Map<String, dynamic> json) =>
    CreateBusiness(
      json['fireBaseAuthenticationUserId'] as String,
      json['name'] as String,
      BusinessOwner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateBusinessToJson(CreateBusiness instance) =>
    <String, dynamic>{
      'fireBaseAuthenticationUserId': instance.fireBaseAuthenticationUserId,
      'name': instance.name,
      'owner': instance.owner,
    };

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
