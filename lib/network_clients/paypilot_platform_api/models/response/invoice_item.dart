import 'package:json_annotation/json_annotation.dart';
part 'invoice_item.g.dart';

@JsonSerializable()
class InvoiceItem {
  final String id;
  final String name;
  final double unitCost;
  final double quantity;
  final bool GST;

  InvoiceItem(this.id, this.name, this.unitCost, this.quantity, this.GST);

  factory InvoiceItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceItemToJson(this);
}
