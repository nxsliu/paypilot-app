import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/enums/invoice_status.dart';
import 'package:paypilot/exceptions/app_exception.dart';
import 'package:paypilot/models/customer.dart';
import 'package:paypilot/models/invoice.dart';
import 'package:paypilot/models/invoice_action.dart';
import 'package:paypilot/models/invoice_item.dart';
import 'package:paypilot/services/invoice_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InvoiceListViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _invoiceService = locator<InvoiceService>();

  List<Invoice> get invoices => _invoiceService.invoices;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_invoiceService];

  Future<void> initialise() async {
    _getAllInvoices();

    notifyListeners();
  }

  Future<void> _getAllInvoices() async {
    try {
      await _invoiceService.getAllInvoices();
    } on AppException catch (e) {
      _snackbarService.showSnackbar(message: e.message);
    } catch (e) {
      _snackbarService.showSnackbar(message: e.toString());
    }
  }

  Future<void> refreshInvoices() async {
    try {
      await _invoiceService.getAllInvoices();

      notifyListeners();
    } on AppException catch (e) {
      _snackbarService.showSnackbar(message: e.message);
    } catch (e) {
      _snackbarService.showSnackbar(message: e.toString());
    }
  }

  void newInvoice() {
    _invoiceService.invoiceBeingEdited = Invoice(
        _invoiceService.getSuggestedInvoiceNumber(),
        DateTime.now(),
        DateTime.now().add(const Duration(days: 30)),
        InvoiceStatus.Draft);

    _navigationService.navigateTo(Routes.invoiceEditView);
  }

  void editInvoice(String invoiceId) {
    // create a new instance of InvoiceItem for editing
    // as we only want to save changes when we click
    // save button and disgard changes when we click
    // the back button

    final invoice =
        _invoiceService.invoices.singleWhere((i) => i.id == invoiceId);

    _invoiceService.invoiceBeingEdited = Invoice.fullInit(
        invoice.id,
        invoice.logoURL,
        invoice.invoiceNumber,
        invoice.invoiceDateLocal,
        invoice.dueDateLocal,
        invoice.message,
        invoice.status,
        invoice.createdLocal,
        invoice.customer == null
            ? null
            : Customer(invoice.customer!.name, invoice.customer!.email,
                invoice.customer!.businessName),
        invoice.invoiceItems
            .map((item) => InvoiceItem.fullInit(
                item.id, item.name, item.unitCost, item.quantity, item.GST))
            .toList(),
        invoice.invoiceActions
            .map((action) =>
                InvoiceAction(action.action, action.actionDateLocal))
            .toList());

    _navigationService.navigateTo(Routes.invoiceEditView);
  }

  void displayInvoice(String invoiceId) {
    _navigationService.navigateTo(Routes.invoiceDisplayView,
        arguments: InvoiceDisplayViewArguments(invoiceId: invoiceId));
  }

  void navigateToHelp() {
    _navigationService.navigateTo(Routes.helpView);
  }
}
