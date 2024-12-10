import 'package:package_info_plus/package_info_plus.dart';
import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/services/authentication_service.dart';
import 'package:paypilot/services/business_service.dart';
import 'package:paypilot/services/invoice_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final _invoiceService = locator<InvoiceService>();
  final _businessService = locator<BusinessService>();
  final _dialogueService = locator<DialogService>();
  final _snackbarService = locator<SnackbarService>();

  PackageInfo? _packageInfo;

  void initialise() async {
    _packageInfo = await PackageInfo.fromPlatform();

    notifyListeners();
  }

  String get appVersion =>
      'v${_packageInfo?.version} (${_packageInfo?.buildNumber})';

  Future<void> navigateToChangePassword() async {
    _navigationService.navigateTo(Routes.changePasswordView);
  }

  Future<void> launchTermsOfService() async {
    if (!await launchUrl(Uri.parse('https://paypilot.io/terms-of-service'))) {
      throw 'Could not launch terms of service';
    }
  }

  Future<void> launchPrivacyPolicy() async {
    if (!await launchUrl(Uri.parse('https://paypilot.io/privacy-policy'))) {
      throw 'Could not launch privacy policy';
    }
  }

  Future<void> signOutUser() async {
    await _authenticationService.signOutUser();

    _invoiceService.clearInvoices();
    _businessService.clearBusiness();

    _navigationService.clearStackAndShow(Routes.welcomeView);
  }

  Future<void> deleteBusiness() async {
    try {
      final dialogueResponse = await _dialogueService.showConfirmationDialog(
          title: 'Are you sure you want to delete your account?',
          description:
              'All information associated with this account will be deleted and will not be recoverable.',
          barrierDismissible: false,
          confirmationTitle: 'Delete');

      if (dialogueResponse != null && dialogueResponse.confirmed) {
        setBusy(true);

        await _businessService.deleteBusiness();

        await _authenticationService.signOutUser();

        _invoiceService.clearInvoices();
        _businessService.clearBusiness();

        notifyListeners();

        _navigationService.clearStackAndShow(Routes.welcomeView);
      }
    } catch (e) {
      _snackbarService.showSnackbar(message: e.toString());
    } finally {
      setBusy(false);
    }
  }
}
