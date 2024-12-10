import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/services/invoice_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InvoiceSentViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _invoiceService = locator<InvoiceService>();

  bool get isFirstInvoice => _invoiceService.invoices.length <= 1;

  Future<void> navigateToInvoiceList() async {
    _navigationService.clearStackAndShow(Routes.invoiceListView);
  }
}
