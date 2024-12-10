import 'package:json_annotation/json_annotation.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/response/customer.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/response/invoice_action.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/response/invoice_item.dart';
part 'invoice.g.dart';

@JsonSerializable()
class Invoice {
  final String id;
  final String? logoURL;
  final int invoiceNumber;
  final DateTime invoiceDateUTC;
  final DateTime dueDateUTC;
  final String? message;
  final String status;
  final DateTime createdUTC;
  final Customer? customer;
  final List<InvoiceItem> invoiceItems;
  final List<InvoiceAction> invoiceActions;

  Invoice(
      this.id,
      this.logoURL,
      this.invoiceNumber,
      this.invoiceDateUTC,
      this.dueDateUTC,
      this.message,
      this.status,
      this.createdUTC,
      this.customer,
      this.invoiceItems,
      this.invoiceActions);

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
