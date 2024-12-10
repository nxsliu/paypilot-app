import 'package:paypilot/services/authentication_service.dart';
import 'package:paypilot/services/business_service.dart';
import 'package:paypilot/services/cloud_messaging_service.dart';
import 'package:paypilot/services/invoice_service.dart';
import 'package:paypilot/services/onboarding_service.dart';
import 'package:paypilot/ui/views/authentication/sign_in/sign_in_view.dart';
import 'package:paypilot/ui/views/authentication/splash/splash_view.dart';
import 'package:paypilot/ui/views/authentication/welcome/welcome_view.dart';
import 'package:paypilot/ui/views/customer/customer_edit_view.dart';
import 'package:paypilot/ui/views/help/help_view.dart';
import 'package:paypilot/ui/views/invoice/invoice_display/invoice_display_view.dart';
import 'package:paypilot/ui/views/invoice/invoice_edit/invoice_edit_view.dart';
import 'package:paypilot/ui/views/invoice/invoice_list/invoice_list_view.dart';
import 'package:paypilot/ui/views/invoice/invoice_preview/invoice_preview_view.dart';
import 'package:paypilot/ui/views/invoice/invoice_sent/invoice_sent_view.dart';
import 'package:paypilot/ui/views/invoice_item/invoice_item_edit_view.dart';
import 'package:paypilot/ui/views/onboarding/onboarding_business_name/onboarding_business_name_view.dart';
import 'package:paypilot/ui/views/onboarding/onboarding_complete/onboarding_complete_view.dart';
import 'package:paypilot/ui/views/onboarding/onboarding_credentials/onboarding_credentials_view.dart';
import 'package:paypilot/ui/views/onboarding/onboarding_name/onboarding_name_view.dart';
import 'package:paypilot/ui/views/settings/change_password/change_password_view.dart';
import 'package:paypilot/ui/widgets/calendar_carousel/calendar_carousel_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: WelcomeView),
  MaterialRoute(page: SignInView),
  MaterialRoute(page: OnboardingNameView),
  MaterialRoute(page: OnboardingBusinessNameView),
  MaterialRoute(page: OnboardingCredentialsView),
  MaterialRoute(page: OnboardingCompleteView),
  MaterialRoute(page: InvoiceListView),
  MaterialRoute(page: InvoiceDisplayView),
  MaterialRoute(page: InvoiceEditView),
  MaterialRoute(page: InvoicePreviewView),
  MaterialRoute(page: InvoiceSentView),
  MaterialRoute(page: CustomerEditView),
  MaterialRoute(page: InvoiceItemEditView),
  MaterialRoute(page: HelpView),
  MaterialRoute(page: CalendarCarouselView),
  MaterialRoute(page: ChangePasswordView)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: AuthenticationService),
  LazySingleton(classType: OnboardingService),
  LazySingleton(classType: BusinessService),
  LazySingleton(classType: InvoiceService),
  LazySingleton(classType: CloudMessagingService),
])
class App {}
