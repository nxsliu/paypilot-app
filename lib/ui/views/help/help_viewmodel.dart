import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/services/authentication_service.dart';
import 'package:paypilot/services/business_service.dart';
import 'package:stacked/stacked.dart';

class HelpViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _businessService = locator<BusinessService>();

  Future<void> sendHelpEmail() async {
    if (await _authenticationService.reloadCurrentUser()) {
      final Email email = Email(
        subject: 'support request - ${_businessService.business.id}',
        recipients: ['contact@paypilot.io'],
        isHTML: false,
      );

      await FlutterEmailSender.send(email);
    } else {
      final Email email = Email(
        subject: 'support request',
        recipients: ['contact@paypilot.io'],
        isHTML: false,
      );

      await FlutterEmailSender.send(email);
    }
  }
}
