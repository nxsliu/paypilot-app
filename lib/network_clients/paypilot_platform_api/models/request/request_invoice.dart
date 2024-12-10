import 'package:json_annotation/json_annotation.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/request/request_customer.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/request/request_invoice_item.dart';
part 'request_invoice.g.dart';

@JsonSerializable()
class RequestInvoice {
  final int invoiceNumber;
  final DateTime invoiceDateUTC;
  final DateTime dueDateUTC;
  final String? message;
  final String status;
  final RequestCustomer? customer;
  final List<RequestInvoiceItem> invoiceItems;

  RequestInvoice(this.invoiceNumber, this.invoiceDateUTC, this.dueDateUTC,
      this.message, this.status, this.customer, this.invoiceItems);

  factory RequestInvoice.fromJson(Map<String, dynamic> json) =>
      _$RequestInvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$RequestInvoiceToJson(this);
}
