import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/services/authentication_service.dart';
import 'package:paypilot/services/business_service.dart';
import 'package:paypilot/services/cloud_messaging_service.dart';
import 'package:paypilot/services/invoice_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _businessService = locator<BusinessService>();
  final _invoiceService = locator<InvoiceService>();
  final _cloudMessagingService = locator<CloudMessagingService>();
  final _dialogueService = locator<DialogService>();

  Future<void> initialise() async {
    /*
    // asynchronously call GET /api/app to check min supported app versions

    // If App version is below the min supported version then 
    final dialogueResponse = await _dialogueService.showDialog(
        title: 'Update required',
        description:
            'Please install the latest version of paypilot from your app store.',
        barrierDismissible: false,
        buttonTitle: 'Update app');

    if (dialogueResponse != null && dialogueResponse.confirmed) {
      // Open app store page
      // Use dynamic link to link to app store depending on platform
    }
    */

    if (await _authenticationService.reloadCurrentUser()) {
      await _businessService.getBusiness();
      await _invoiceService.getAllInvoices();

      await _cloudMessagingService.requestPermission();

      // Do not await this operation.
      // Let it run in the background to improve performance UX
      _cloudMessagingService
          .registerBusinessUniqueDeviceToken(_businessService.business.id);

      _navigatorService.clearStackAndShow(Routes.invoiceListView);
    } else {
      _navigatorService.clearStackAndShow(Routes.welcomeView);
    }
  }
}
