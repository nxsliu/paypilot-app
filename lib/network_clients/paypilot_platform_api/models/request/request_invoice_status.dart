import 'package:json_annotation/json_annotation.dart';
part 'request_invoice_status.g.dart';

@JsonSerializable()
class RequestInvoiceStatus {
  final String status;

  RequestInvoiceStatus(this.status);

  factory RequestInvoiceStatus.fromJson(Map<String, dynamic> json) =>
      _$RequestInvoiceStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RequestInvoiceStatusToJson(this);
}
