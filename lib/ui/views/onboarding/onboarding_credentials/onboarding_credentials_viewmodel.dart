import 'package:email_validator/email_validator.dart';
import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/exceptions/app_exception.dart';
import 'package:paypilot/services/authentication_service.dart';
import 'package:paypilot/services/onboarding_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingCredentialsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _onboardingService = locator<OnboardingService>();
  final _authenticationService = locator<AuthenticationService>();
  final _snackbarService = locator<SnackbarService>();

  String _email = '';
  String _password = '';

  // the string VALUES must be unique for each key
  final String emailErrorKey = 'emailErrorKey';
  final String passwordErrorKey = 'passwordErrorKey';
  final String accountCreationErrorKey = 'signInErrorKey';

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

  Future<void> submitView() async {
    if (isValid) {
      if (!EmailValidator.validate(_email)) {
        setErrorForObject(emailErrorKey, 'Invalid email, please try again');
        return;
      }

      if (_password.length < 6) {
        setErrorForObject(
            passwordErrorKey, 'Password must be longer than 5 characters');
        return;
      }

      _onboardingService.email = _email;
      _onboardingService.password = _password;

      try {
        setBusy(true);
        final fireBaseAuthenticationUserId =
            await _authenticationService.signUpUser(
                _onboardingService.email!, _onboardingService.password!);

        await _onboardingService.createBusiness(fireBaseAuthenticationUserId);

        _navigationService.navigateTo(Routes.onboardingCompleteView);
      } on AppException catch (e) {
        _snackbarService.showSnackbar(message: e.message);
        setErrorForObject(accountCreationErrorKey,
            'Account creation failed, please try again');
      } catch (e) {
        _snackbarService.showSnackbar(message: e.toString());
        setErrorForObject(accountCreationErrorKey, 'Account creation failed');
      } finally {
        setBusy(false);
      }
    }
  }

  void navigateToHelp() {
    _navigationService.navigateTo(Routes.helpView);
  }
}
