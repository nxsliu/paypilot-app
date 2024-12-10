// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestInvoice _$RequestInvoiceFromJson(Map<String, dynamic> json) =>
    RequestInvoice(
      json['invoiceNumber'] as int,
      DateTime.parse(json['invoiceDateUTC'] as String),
      DateTime.parse(json['dueDateUTC'] as String),
      json['message'] as String?,
      json['status'] as String,
      json['customer'] == null
          ? null
          : RequestCustomer.fromJson(json['customer'] as Map<String, dynamic>),
      (json['invoiceItems'] as List<dynamic>)
          .map((e) => RequestInvoiceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestInvoiceToJson(RequestInvoice instance) =>
    <String, dynamic>{
      'invoiceNumber': instance.invoiceNumber,
      'invoiceDateUTC': instance.invoiceDateUTC.toIso8601String(),
      'dueDateUTC': instance.dueDateUTC.toIso8601String(),
      'message': instance.message,
      'status': instance.status,
      'customer': instance.customer,
      'invoiceItems': instance.invoiceItems,
    };
