// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestCustomer _$RequestCustomerFromJson(Map<String, dynamic> json) =>
    RequestCustomer(
      json['name'] as String,
      json['email'] as String,
      json['businessName'] as String,
    );

Map<String, dynamic> _$RequestCustomerToJson(RequestCustomer instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'businessName': instance.businessName,
    };
