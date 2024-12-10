// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i19;
import 'package:flutter/material.dart';
import 'package:paypilot/models/invoice.dart' as _i20;
import 'package:paypilot/models/invoice_item.dart' as _i21;
import 'package:paypilot/ui/views/authentication/sign_in/sign_in_view.dart'
    as _i4;
import 'package:paypilot/ui/views/authentication/splash/splash_view.dart'
    as _i2;
import 'package:paypilot/ui/views/authentication/welcome/welcome_view.dart'
    as _i3;
import 'package:paypilot/ui/views/customer/customer_edit_view.dart' as _i14;
import 'package:paypilot/ui/views/help/help_view.dart' as _i16;
import 'package:paypilot/ui/views/invoice/invoice_display/invoice_display_view.dart'
    as _i10;
import 'package:paypilot/ui/views/invoice/invoice_edit/invoice_edit_view.dart'
    as _i11;
import 'package:paypilot/ui/views/invoice/invoice_list/invoice_list_view.dart'
    as _i9;
import 'package:paypilot/ui/views/invoice/invoice_preview/invoice_preview_view.dart'
    as _i12;
import 'package:paypilot/ui/views/invoice/invoice_sent/invoice_sent_view.dart'
    as _i13;
import 'package:paypilot/ui/views/invoice_item/invoice_item_edit_view.dart'
    as _i15;
import 'package:paypilot/ui/views/onboarding/onboarding_business_name/onboarding_business_name_view.dart'
    as _i6;
import 'package:paypilot/ui/views/onboarding/onboarding_complete/onboarding_complete_view.dart'
    as _i8;
import 'package:paypilot/ui/views/onboarding/onboarding_credentials/onboarding_credentials_view.dart'
    as _i7;
import 'package:paypilot/ui/views/onboarding/onboarding_name/onboarding_name_view.dart'
    as _i5;
import 'package:paypilot/ui/views/settings/change_password/change_password_view.dart'
    as _i18;
import 'package:paypilot/ui/widgets/calendar_carousel/calendar_carousel_view.dart'
    as _i17;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i22;

class Routes {
  static const splashView = '/';

  static const welcomeView = '/welcome-view';

  static const signInView = '/sign-in-view';

  static const onboardingNameView = '/onboarding-name-view';

  static const onboardingBusinessNameView = '/onboarding-business-name-view';

  static const onboardingCredentialsView = '/onboarding-credentials-view';

  static const onboardingCompleteView = '/onboarding-complete-view';

  static const invoiceListView = '/invoice-list-view';

  static const invoiceDisplayView = '/invoice-display-view';

  static const invoiceEditView = '/invoice-edit-view';

  static const invoicePreviewView = '/invoice-preview-view';

  static const invoiceSentView = '/invoice-sent-view';

  static const customerEditView = '/customer-edit-view';

  static const invoiceItemEditView = '/invoice-item-edit-view';

  static const helpView = '/help-view';

  static const calendarCarouselView = '/calendar-carousel-view';

  static const changePasswordView = '/change-password-view';

  static const all = <String>{
    splashView,
    welcomeView,
    signInView,
    onboardingNameView,
    onboardingBusinessNameView,
    onboardingCredentialsView,
    onboardingCompleteView,
    invoiceListView,
    invoiceDisplayView,
    invoiceEditView,
    invoicePreviewView,
    invoiceSentView,
    customerEditView,
    invoiceItemEditView,
    helpView,
    calendarCarouselView,
    changePasswordView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.welcomeView,
      page: _i3.WelcomeView,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i4.SignInView,
    ),
    _i1.RouteDef(
      Routes.onboardingNameView,
      page: _i5.OnboardingNameView,
    ),
    _i1.RouteDef(
      Routes.onboardingBusinessNameView,
      page: _i6.OnboardingBusinessNameView,
    ),
    _i1.RouteDef(
      Routes.onboardingCredentialsView,
      page: _i7.OnboardingCredentialsView,
    ),
    _i1.RouteDef(
      Routes.onboardingCompleteView,
      page: _i8.OnboardingCompleteView,
    ),
    _i1.RouteDef(
      Routes.invoiceListView,
      page: _i9.InvoiceListView,
    ),
    _i1.RouteDef(
      Routes.invoiceDisplayView,
      page: _i10.InvoiceDisplayView,
    ),
    _i1.RouteDef(
      Routes.invoiceEditView,
      page: _i11.InvoiceEditView,
    ),
    _i1.RouteDef(
      Routes.invoicePreviewView,
      page: _i12.InvoicePreviewView,
    ),
    _i1.RouteDef(
      Routes.invoiceSentView,
      page: _i13.InvoiceSentView,
    ),
    _i1.RouteDef(
      Routes.customerEditView,
      page: _i14.CustomerEditView,
    ),
    _i1.RouteDef(
      Routes.invoiceItemEditView,
      page: _i15.InvoiceItemEditView,
    ),
    _i1.RouteDef(
      Routes.helpView,
      page: _i16.HelpView,
    ),
    _i1.RouteDef(
      Routes.calendarCarouselView,
      page: _i17.CalendarCarouselView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i18.ChangePasswordView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.WelcomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.WelcomeView(),
        settings: data,
      );
    },
    _i4.SignInView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SignInView(),
        settings: data,
      );
    },
    _i5.OnboardingNameView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.OnboardingNameView(),
        settings: data,
      );
    },
    _i6.OnboardingBusinessNameView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.OnboardingBusinessNameView(),
        settings: data,
      );
    },
    _i7.OnboardingCredentialsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.OnboardingCredentialsView(),
        settings: data,
      );
    },
    _i8.OnboardingCompleteView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.OnboardingCompleteView(),
        settings: data,
      );
    },
    _i9.InvoiceListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.InvoiceListView(),
        settings: data,
      );
    },
    _i10.InvoiceDisplayView: (data) {
      final args = data.getArgs<InvoiceDisplayViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.InvoiceDisplayView(key: args.key, invoiceId: args.invoiceId),
        settings: data,
      );
    },
    _i11.InvoiceEditView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.InvoiceEditView(),
        settings: data,
      );
    },
    _i12.InvoicePreviewView: (data) {
      final args = data.getArgs<InvoicePreviewViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i12.InvoicePreviewView(key: args.key, invoice: args.invoice),
        settings: data,
      );
    },
    _i13.InvoiceSentView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.InvoiceSentView(),
        settings: data,
      );
    },
    _i14.CustomerEditView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.CustomerEditView(),
        settings: data,
      );
    },
    _i15.InvoiceItemEditView: (data) {
      final args = data.getArgs<InvoiceItemEditViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i15.InvoiceItemEditView(
            key: args.key, invoiceItem: args.invoiceItem),
        settings: data,
      );
    },
    _i16.HelpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.HelpView(),
        settings: data,
      );
    },
    _i17.CalendarCarouselView: (data) {
      final args = data.getArgs<CalendarCarouselViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i17.CalendarCarouselView(
            key: args.key, title: args.title, selectedDate: args.selectedDate),
        settings: data,
      );
    },
    _i18.ChangePasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.ChangePasswordView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class InvoiceDisplayViewArguments {
  const InvoiceDisplayViewArguments({
    this.key,
    required this.invoiceId,
  });

  final _i19.Key? key;

  final String invoiceId;
}

class InvoicePreviewViewArguments {
  const InvoicePreviewViewArguments({
    this.key,
    required this.invoice,
  });

  final _i19.Key? key;

  final _i20.Invoice invoice;
}

class InvoiceItemEditViewArguments {
  const InvoiceItemEditViewArguments({
    this.key,
    required this.invoiceItem,
  });

  final _i19.Key? key;

  final _i21.InvoiceItem invoiceItem;
}

class CalendarCarouselViewArguments {
  const CalendarCarouselViewArguments({
    this.key,
    required this.title,
    required this.selectedDate,
  });

  final _i19.Key? key;

  final String title;

  final DateTime selectedDate;
}

extension NavigatorStateExtension on _i22.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWelcomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.welcomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingNameView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingNameView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingBusinessNameView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingBusinessNameView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingCredentialsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingCredentialsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingCompleteView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingCompleteView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInvoiceListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.invoiceListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInvoiceDisplayView({
    _i19.Key? key,
    required String invoiceId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.invoiceDisplayView,
        arguments: InvoiceDisplayViewArguments(key: key, invoiceId: invoiceId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInvoiceEditView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.invoiceEditView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInvoicePreviewView({
    _i19.Key? key,
    required _i20.Invoice invoice,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.invoicePreviewView,
        arguments: InvoicePreviewViewArguments(key: key, invoice: invoice),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInvoiceSentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.invoiceSentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCustomerEditView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.customerEditView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInvoiceItemEditView({
    _i19.Key? key,
    required _i21.InvoiceItem invoiceItem,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.invoiceItemEditView,
        arguments:
            InvoiceItemEditViewArguments(key: key, invoiceItem: invoiceItem),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHelpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.helpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCalendarCarouselView({
    _i19.Key? key,
    required String title,
    required DateTime selectedDate,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.calendarCarouselView,
        arguments: CalendarCarouselViewArguments(
            key: key, title: title, selectedDate: selectedDate),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWelcomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.welcomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingNameView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingNameView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingBusinessNameView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingBusinessNameView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingCredentialsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingCredentialsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingCompleteView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingCompleteView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInvoiceListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.invoiceListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInvoiceDisplayView({
    _i19.Key? key,
    required String invoiceId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.invoiceDisplayView,
        arguments: InvoiceDisplayViewArguments(key: key, invoiceId: invoiceId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInvoiceEditView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.invoiceEditView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInvoicePreviewView({
    _i19.Key? key,
    required _i20.Invoice invoice,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.invoicePreviewView,
        arguments: InvoicePreviewViewArguments(key: key, invoice: invoice),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInvoiceSentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.invoiceSentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCustomerEditView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.customerEditView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInvoiceItemEditView({
    _i19.Key? key,
    required _i21.InvoiceItem invoiceItem,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.invoiceItemEditView,
        arguments:
            InvoiceItemEditViewArguments(key: key, invoiceItem: invoiceItem),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHelpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.helpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCalendarCarouselView({
    _i19.Key? key,
    required String title,
    required DateTime selectedDate,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.calendarCarouselView,
        arguments: CalendarCarouselViewArguments(
            key: key, title: title, selectedDate: selectedDate),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
