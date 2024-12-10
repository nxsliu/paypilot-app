import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/models/invoice_item.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InvoiceItemEditViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  late InvoiceItem invoiceItemBeingEdited;

  InvoiceItemEditViewModel(InvoiceItem invoiceItem) {
    // create a new instance of InvoiceItem for editing
    // as we only want to save changes when we click
    // save button and disgard changes when we click
    // the back button
    invoiceItemBeingEdited = InvoiceItem.fullInit(
        invoiceItem.id,
        invoiceItem.name,
        invoiceItem.unitCost,
        invoiceItem.quantity,
        invoiceItem.GST);
  }

  void updateItemName(String itemName) {
    invoiceItemBeingEdited.name = itemName;
    clearErrors();
    notifyListeners();
  }

  void updateItemUnitCost(String itemUnitCost) {
    if (itemUnitCost.isEmpty) itemUnitCost = '0';
    invoiceItemBeingEdited.unitCost = double.parse(itemUnitCost);
    clearErrors();
    notifyListeners();
  }

  void updateItemQuantity(String itemQuantity) {
    if (itemQuantity.isEmpty) itemQuantity = '0';
    invoiceItemBeingEdited.quantity = double.parse(itemQuantity);
    clearErrors();
    notifyListeners();
  }

  void updateItemGST(bool itemGST) {
    invoiceItemBeingEdited.GST = itemGST;
    clearErrors();
    notifyListeners();
  }

  void saveInvoiceItem() {
    if (invoiceItemBeingEdited.isValid) {
      _navigationService.back(result: invoiceItemBeingEdited);
    }
  }
}
