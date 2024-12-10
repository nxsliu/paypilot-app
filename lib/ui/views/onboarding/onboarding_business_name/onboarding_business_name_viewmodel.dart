import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/services/onboarding_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingBusinessNameViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _onboardingService = locator<OnboardingService>();

  String _businessName = '';

  bool get isValid => _businessName.isNotEmpty;

  void updateBusinessName(String businessName) {
    _businessName = businessName;
    notifyListeners();
  }

  void submitView() {
    if (isValid) {
      _onboardingService.businessName = _businessName;
      _navigationService.navigateTo(Routes.onboardingCredentialsView);
    }
  }

  void navigateToHelp() {
    _navigationService.navigateTo(Routes.helpView);
  }
}
