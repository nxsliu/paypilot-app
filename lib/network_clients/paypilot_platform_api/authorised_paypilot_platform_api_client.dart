import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paypilot/flavor_config.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/paypilot_platform_api_client.dart';

class AuthorisedPaypilotAPIClient {
  Future<PaypilotAPIClient> getClient() async {
    final userIdToken = await FirebaseAuth.instance.currentUser!.getIdToken();

    var dio = Dio();
    dio.options.contentType = Headers.jsonContentType;
    dio.options.headers["Authorization"] = 'Bearer $userIdToken';

    return PaypilotAPIClient(dio, baseUrl: FlavorConfig.paypilotPlatformAPI);
  }
}
