import 'package:json_annotation/json_annotation.dart';
part 'request_invoice_item.g.dart';

@JsonSerializable()
class RequestInvoiceItem {
  final String name;
  final double unitCost;
  final double quantity;
  final bool GST;

  RequestInvoiceItem(this.name, this.unitCost, this.quantity, this.GST);

  factory RequestInvoiceItem.fromJson(Map<String, dynamic> json) =>
      _$RequestInvoiceItemFromJson(json);

  Map<String, dynamic> toJson() => _$RequestInvoiceItemToJson(this);
}
