import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/services/onboarding_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingNameViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _onboardingService = locator<OnboardingService>();

  String _firstName = '';
  String _lastName = '';

  bool get isValid => _firstName.isNotEmpty && _lastName.isNotEmpty;

  void updateFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void updateLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void submiteView() {
    if (isValid) {
      _onboardingService.firstName = _firstName;
      _onboardingService.lastName = _lastName;
      _navigationService.navigateTo(Routes.onboardingBusinessNameView);
    }
  }

  void navigateToHelp() {
    _navigationService.navigateTo(Routes.helpView);
  }
}
