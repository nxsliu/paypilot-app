import 'package:json_annotation/json_annotation.dart';
part 'request_uniquedevicetoken.g.dart';

@JsonSerializable()
class RequestUniqueDeviceToken {
  final String token;

  RequestUniqueDeviceToken(this.token);

  factory RequestUniqueDeviceToken.fromJson(Map<String, dynamic> json) =>
      _$RequestUniqueDeviceTokenFromJson(json);

  Map<String, dynamic> toJson() => _$RequestUniqueDeviceTokenToJson(this);
}
