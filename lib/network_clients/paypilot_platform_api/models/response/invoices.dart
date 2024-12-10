import 'package:json_annotation/json_annotation.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/response/invoice.dart';
part 'invoices.g.dart';

@JsonSerializable()
class Invoices {
  final List<Invoice> invoices;

  Invoices(this.invoices);

  factory Invoices.fromJson(Map<String, dynamic> json) =>
      _$InvoicesFromJson(json);

  Map<String, dynamic> toJson() => _$InvoicesToJson(this);
}
