// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceAction _$InvoiceActionFromJson(Map<String, dynamic> json) =>
    InvoiceAction(
      json['action'] as String,
      DateTime.parse(json['actionDateUTC'] as String),
    );

Map<String, dynamic> _$InvoiceActionToJson(InvoiceAction instance) =>
    <String, dynamic>{
      'action': instance.action,
      'actionDateUTC': instance.actionDateUTC.toIso8601String(),
    };
