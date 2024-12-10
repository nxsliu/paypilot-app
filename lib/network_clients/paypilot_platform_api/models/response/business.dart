import 'package:json_annotation/json_annotation.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/response/business_owner.dart';
part 'business.g.dart';

@JsonSerializable()
class Business {
  final String id;
  final String name;
  final String? logoURL;
  final BusinessOwner owner;

  Business(this.id, this.name, this.logoURL, this.owner);

  factory Business.fromJson(Map<String, dynamic> json) =>
      _$BusinessFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessToJson(this);
}
