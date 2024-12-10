import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/exceptions/app_exception.dart';
import 'package:paypilot/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangePasswordViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _snackbarService = locator<SnackbarService>();

  String _currentPassword = '';
  String _newPassword = '';

  // the string VALUES must be unique for each key
  final String passwordErrorKey = 'passwordErrorKey';
  final String changePasswordErrorKey = 'changePasswordErrorKey';

  bool get isValid => _currentPassword.isNotEmpty && _newPassword.isNotEmpty;

  void updateCurrentPassword(String currentPassword) {
    _currentPassword = currentPassword;
    clearErrors();
    notifyListeners();
  }

  void updateNewPassword(String newPassword) {
    _newPassword = newPassword;
    clearErrors();
    notifyListeners();
  }

  Future<void> changePassword() async {
    if (isValid) {
      if (_newPassword.length < 6) {
        setErrorForObject(
            passwordErrorKey, 'Password must be longer than 5 characters');
        return;
      }

      try {
        setBusy(true);
        await _authenticationService.changePassword(
            _currentPassword, _newPassword);

        _navigatorService.back();
        _snackbarService.showSnackbar(message: 'Password changed');
      } on AppException catch (e) {
        _snackbarService.showSnackbar(message: e.message);
        setErrorForObject(
            changePasswordErrorKey, 'Password change failed, please try again');
      } catch (e) {
        _snackbarService.showSnackbar(message: e.toString());
        setErrorForObject(changePasswordErrorKey, 'Password change failed');
      } finally {
        setBusy(false);
      }
    }
  }
}
