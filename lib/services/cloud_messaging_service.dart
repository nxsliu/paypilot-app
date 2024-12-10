import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/services/business_service.dart';

class CloudMessagingService {
  final _businessService = locator<BusinessService>();

  Future<void> requestPermission() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> registerBusinessUniqueDeviceToken(String businessId) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    final token = await messaging.getToken();

    if (token != null) {
      await _businessService.updateBusinessUniqueDeviceToken(businessId, token);
    }
  }
}
