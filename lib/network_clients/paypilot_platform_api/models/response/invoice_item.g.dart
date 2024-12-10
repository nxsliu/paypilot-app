// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceItem _$InvoiceItemFromJson(Map<String, dynamic> json) => InvoiceItem(
      json['id'] as String,
      json['name'] as String,
      (json['unitCost'] as num).toDouble(),
      (json['quantity'] as num).toDouble(),
      json['GST'] as bool,
    );

Map<String, dynamic> _$InvoiceItemToJson(InvoiceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unitCost': instance.unitCost,
      'quantity': instance.quantity,
      'GST': instance.GST,
    };
