import 'package:json_annotation/json_annotation.dart';
part 'invoice_action.g.dart';

@JsonSerializable()
class InvoiceAction {
  final String action;
  final DateTime actionDateUTC;

  InvoiceAction(this.action, this.actionDateUTC);

  factory InvoiceAction.fromJson(Map<String, dynamic> json) =>
      _$InvoiceActionFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceActionToJson(this);
}
