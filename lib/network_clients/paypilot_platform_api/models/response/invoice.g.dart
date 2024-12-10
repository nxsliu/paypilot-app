// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      json['id'] as String,
      json['logoURL'] as String?,
      json['invoiceNumber'] as int,
      DateTime.parse(json['invoiceDateUTC'] as String),
      DateTime.parse(json['dueDateUTC'] as String),
      json['message'] as String?,
      json['status'] as String,
      DateTime.parse(json['createdUTC'] as String),
      json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      (json['invoiceItems'] as List<dynamic>)
          .map((e) => InvoiceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['invoiceActions'] as List<dynamic>)
          .map((e) => InvoiceAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'logoURL': instance.logoURL,
      'invoiceNumber': instance.invoiceNumber,
      'invoiceDateUTC': instance.invoiceDateUTC.toIso8601String(),
      'dueDateUTC': instance.dueDateUTC.toIso8601String(),
      'message': instance.message,
      'status': instance.status,
      'createdUTC': instance.createdUTC.toIso8601String(),
      'customer': instance.customer,
      'invoiceItems': instance.invoiceItems,
      'invoiceActions': instance.invoiceActions,
    };
