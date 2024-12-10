import 'package:json_annotation/json_annotation.dart';
part 'business_owner.g.dart';

@JsonSerializable()
class BusinessOwner {
  final String firstName;
  final String lastName;
  final String email;

  BusinessOwner(this.firstName, this.lastName, this.email);

  factory BusinessOwner.fromJson(Map<String, dynamic> json) =>
      _$BusinessOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessOwnerToJson(this);
}
