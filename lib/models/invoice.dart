import 'package:paypilot/enums/invoice_status.dart';
import 'package:paypilot/models/customer.dart';
import 'package:paypilot/models/invoice_action.dart';
import 'package:paypilot/models/invoice_item.dart';

class Invoice {
  String? id;
  String? logoURL;
  int invoiceNumber;
  DateTime invoiceDateLocal;
  DateTime dueDateLocal;
  String? message;
  InvoiceStatus status;
  DateTime? createdLocal;
  Customer? customer;
  List<InvoiceItem> invoiceItems = List.empty(growable: true);
  List<InvoiceAction> invoiceActions = List.empty(growable: true);

  Invoice(this.invoiceNumber, this.invoiceDateLocal, this.dueDateLocal,
      this.status);

  Invoice.initAsDuplicate(
    this.invoiceNumber,
    this.invoiceDateLocal,
    this.dueDateLocal,
    this.message,
    this.status,
    this.customer,
    this.invoiceItems,
  );

  Invoice.fullInit(
      this.id,
      this.logoURL,
      this.invoiceNumber,
      this.invoiceDateLocal,
      this.dueDateLocal,
      this.message,
      this.status,
      this.createdLocal,
      this.customer,
      this.invoiceItems,
      this.invoiceActions);

  double get totalAmount =>
      // Calculate Australian GST which is hardcoded as 10% for now
      invoiceItems.isNotEmpty
          ? invoiceItems
              .map((i) => i.unitCost * i.quantity * (i.GST ? 1.1 : 1))
              .reduce((a, b) => a + b)
          : 0;

  double get totalGSTAmount =>
      // Calculate Australian GST which is hardcoded as 10% for now
      invoiceItems.isNotEmpty
          ? invoiceItems
              .map((i) => i.unitCost * i.quantity * (i.GST ? 0.1 : 0))
              .reduce((a, b) => a + b)
          : 0;

  double get totalNoGSTAmount => invoiceItems.isNotEmpty
      ? invoiceItems.map((i) => i.unitCost * i.quantity).reduce((a, b) => a + b)
      : 0;

  DateTime? paidDate() {
    if (status == InvoiceStatus.Paid && invoiceActions.isNotEmpty) {
      var sortedActions = invoiceActions
        ..sort((a, b) => b.actionDateLocal.compareTo(a.actionDateLocal));

      return sortedActions
          .firstWhere((a) => a.action == 'Invoice paid')
          .actionDateLocal;
    } else {
      return null;
    }
  }
}
