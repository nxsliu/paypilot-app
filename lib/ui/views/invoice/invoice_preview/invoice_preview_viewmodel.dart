import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/enums/invoice_status.dart';
import 'package:paypilot/exceptions/app_exception.dart';
import 'package:paypilot/models/business.dart';
import 'package:paypilot/services/business_service.dart';
import 'package:paypilot/services/invoice_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InvoicePreviewViewModel extends BaseViewModel {
  final _invoiceService = locator<InvoiceService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _businessService = locator<BusinessService>();

  Business get business => _businessService.business;

  Future<void> sendInvoice(String invoiceId) async {
    try {
      setBusy(true);

      if (_invoiceService.invoices
          .where((i) => i.status != InvoiceStatus.Draft)
          .isEmpty) {
        await _businessService.createBusinessStripeAccount();
      }

      await _invoiceService.updateInvoiceStatus(
          invoiceId, InvoiceStatus.Sending);

      _navigationService.navigateTo(Routes.invoiceSentView);
    } on AppException catch (e) {
      _snackbarService.showSnackbar(message: e.message);
    } catch (e) {
      _snackbarService.showSnackbar(message: e.toString());
    } finally {
      setBusy(false);
    }
  }
}
