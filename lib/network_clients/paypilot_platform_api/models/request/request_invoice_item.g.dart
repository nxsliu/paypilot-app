// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_invoice_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestInvoiceItem _$RequestInvoiceItemFromJson(Map<String, dynamic> json) =>
    RequestInvoiceItem(
      json['name'] as String,
      (json['unitCost'] as num).toDouble(),
      (json['quantity'] as num).toDouble(),
      json['GST'] as bool,
    );

Map<String, dynamic> _$RequestInvoiceItemToJson(RequestInvoiceItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'unitCost': instance.unitCost,
      'quantity': instance.quantity,
      'GST': instance.GST,
    };
