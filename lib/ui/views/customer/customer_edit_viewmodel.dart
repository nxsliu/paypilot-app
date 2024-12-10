import 'package:email_validator/email_validator.dart';
import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/models/customer.dart';
import 'package:paypilot/services/invoice_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomerEditViewModel extends BaseViewModel {
  final _invoiceService = locator<InvoiceService>();
  final _navigationService = locator<NavigationService>();

  late Customer customerBeingEdited;

  final String customerEmailErrorKey = 'emailErrorKey';

  CustomerEditViewModel() {
    if (_invoiceService.invoiceBeingEdited!.customer == null) {
      customerBeingEdited = Customer("", "", "");
    } else {
      customerBeingEdited = Customer(
          _invoiceService.invoiceBeingEdited!.customer!.name,
          _invoiceService.invoiceBeingEdited!.customer!.email,
          _invoiceService.invoiceBeingEdited!.customer!.businessName);
    }
  }

  void updateName(String customerName) {
    customerBeingEdited.name = customerName;
    clearErrors();
    notifyListeners();
  }

  void updateEmail(String customerEmail) {
    customerBeingEdited.email = customerEmail;
    clearErrors();
    notifyListeners();
  }

  void updateBusinessName(String customerBusinessName) {
    customerBeingEdited.businessName = customerBusinessName;
    clearErrors();
    notifyListeners();
  }

  void saveCustomer() {
    if (customerBeingEdited.isValid) {
      if (!EmailValidator.validate(customerBeingEdited.email)) {
        setErrorForObject(
            customerEmailErrorKey, 'Invalid email, please try again');
        return;
      }

      _invoiceService.invoiceBeingEdited!.customer = customerBeingEdited;
      notifyListeners();

      _navigationService.back();
    }
  }
}
