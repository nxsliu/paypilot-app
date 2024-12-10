import 'package:paypilot/network_clients/paypilot_platform_api/models/response/business_owner.dart';

class Business {
  String id;
  String name;
  String? logoURL;
  BusinessOwner owner;

  Business(this.id, this.name, this.logoURL, this.owner);
}
