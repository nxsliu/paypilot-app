import 'package:json_annotation/json_annotation.dart';
part 'request_customer.g.dart';

@JsonSerializable()
class RequestCustomer {
  final String name;
  final String email;
  final String businessName;

  RequestCustomer(this.name, this.email, this.businessName);

  factory RequestCustomer.fromJson(Map<String, dynamic> json) =>
      _$RequestCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$RequestCustomerToJson(this);
}
