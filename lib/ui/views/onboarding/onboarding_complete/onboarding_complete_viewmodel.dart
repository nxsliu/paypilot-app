import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/enums/invoice_status.dart';
import 'package:paypilot/models/invoice.dart';
import 'package:paypilot/services/business_service.dart';
import 'package:paypilot/services/cloud_messaging_service.dart';
import 'package:paypilot/services/invoice_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingCompleteViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _invoiceService = locator<InvoiceService>();
  final _cloudMessagingService = locator<CloudMessagingService>();
  final _businessService = locator<BusinessService>();

  Future<void> submitView() async {
    await _cloudMessagingService.requestPermission();

    // Do not await this operation.
    // Let it run in the background to improve performance UX
    _cloudMessagingService
        .registerBusinessUniqueDeviceToken(_businessService.business.id);

    _navigationService.pushNamedAndRemoveUntil(Routes.invoiceListView);

    _invoiceService.invoiceBeingEdited = Invoice(
        _invoiceService.getSuggestedInvoiceNumber(),
        DateTime.now(),
        DateTime.now().add(const Duration(days: 30)),
        InvoiceStatus.Draft);

    _navigationService.navigateTo(Routes.invoiceEditView);
  }

  void navigateToHelp() {
    _navigationService.navigateTo(Routes.helpView);
  }
}
