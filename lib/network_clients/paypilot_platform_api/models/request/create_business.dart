import 'package:json_annotation/json_annotation.dart';
part 'create_business.g.dart';

@JsonSerializable()
class CreateBusiness {
  final String fireBaseAuthenticationUserId;
  final String name;
  final BusinessOwner owner;

  CreateBusiness(this.fireBaseAuthenticationUserId, this.name, this.owner);

  factory CreateBusiness.fromJson(Map<String, dynamic> json) =>
      _$CreateBusinessFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBusinessToJson(this);
}

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
