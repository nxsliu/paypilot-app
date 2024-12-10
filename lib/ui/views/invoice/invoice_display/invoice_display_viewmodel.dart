import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/enums/invoice_status.dart';
import 'package:paypilot/models/business.dart';
import 'package:paypilot/models/invoice.dart';
import 'package:paypilot/services/business_service.dart';
import 'package:paypilot/services/invoice_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InvoiceDisplayViewModel extends BaseViewModel {
  final _invoiceService = locator<InvoiceService>();
  final _businessService = locator<BusinessService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  Business get business => _businessService.business;

  Invoice? invoice;

  InvoiceDisplayViewModel(String invoiceId) {
    invoice = _invoiceService.invoices.singleWhere((i) => i.id == invoiceId);
  }

  Future<void> updateInvoiceStatus(
      String invoiceId, InvoiceStatus invoiceStatus) async {
    try {
      setBusy(true);

      await _invoiceService.updateInvoiceStatus(invoiceId, invoiceStatus);

      notifyListeners();

      _navigationService.clearStackAndShow(Routes.invoiceListView);
    } catch (e) {
      _snackbarService.showSnackbar(message: e.toString());
    } finally {
      setBusy(false);
    }
  }

  void duplicateInvoice() {
    _invoiceService.invoiceBeingEdited = Invoice.initAsDuplicate(
        _invoiceService.getSuggestedInvoiceNumber(),
        DateTime.now(),
        DateTime.now().add(const Duration(days: 30)),
        invoice!.message,
        InvoiceStatus.Draft,
        invoice!.customer,
        invoice!.invoiceItems);

    _navigationService.pushNamedAndRemoveUntil(Routes.invoiceListView);

    _navigationService.navigateTo(Routes.invoiceEditView);
  }
}
