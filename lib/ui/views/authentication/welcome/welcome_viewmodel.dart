import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  int currentIndex = 0;

  void updateCarouselSliderDot(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void navigateToOnboardingName() {
    _navigationService.navigateTo(Routes.onboardingNameView);
  }

  void navigateToSignIn() {
    _navigationService.navigateTo(Routes.signInView);
  }
}
