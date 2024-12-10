import 'package:email_validator/email_validator.dart';
import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/exceptions/app_exception.dart';
import 'package:paypilot/services/authentication_service.dart';
import 'package:paypilot/services/business_service.dart';
import 'package:paypilot/services/cloud_messaging_service.dart';
import 'package:paypilot/services/invoice_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _businessService = locator<BusinessService>();
  final _invoiceService = locator<InvoiceService>();
  final _snackbarService = locator<SnackbarService>();
  final _cloudMessagingService = locator<CloudMessagingService>();

  String _email = '';
  String _password = '';

  // the string VALUES must be unique for each key
  final String emailErrorKey = 'emailErrorKey';
  final String signInErrorKey = 'signInErrorKey';

  bool get isValid => _email.isNotEmpty && _password.isNotEmpty;

  void updateEmail(String email) {
    _email = email;
    clearErrors();
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    clearErrors();
    notifyListeners();
  }

  Future<void> signIn() async {
    if (isValid) {
      if (!EmailValidator.validate(_email)) {
        setErrorForObject(emailErrorKey, 'Invalid email, please try again');
        return;
      }

      try {
        setBusy(true);
        await _authenticationService.signInUser(_email, _password);

        await _businessService.getBusiness();
        await _invoiceService.getAllInvoices();

        await _cloudMessagingService.requestPermission();
/*
        NotificationSettings settings =
            await FirebaseMessaging.instance.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );

        if (kDebugMode) {
          if (settings.authorizationStatus == AuthorizationStatus.authorized) {
            print('User granted permission');
          } else if (settings.authorizationStatus ==
              AuthorizationStatus.provisional) {
            print('User granted provisional permission');
          } else {
            print('User declined or has not accepted permission');
          }
        }
*/
        // Do not await this operation.
        // Let it run in the background to improve performance UX
        _cloudMessagingService
            .registerBusinessUniqueDeviceToken(_businessService.business.id);

        _navigationService.clearStackAndShow(Routes.invoiceListView);
      } on AppException catch (e) {
        _snackbarService.showSnackbar(message: e.message);
        setErrorForObject(signInErrorKey, 'Sign in failed, please try again');
      } catch (e) {
        _snackbarService.showSnackbar(message: e.toString());
        setErrorForObject(signInErrorKey, 'Sign in failed');
      } finally {
        setBusy(false);
      }
    }
  }

  void navigateToHelp() {
    _navigationService.navigateTo(Routes.helpView);
  }
}
