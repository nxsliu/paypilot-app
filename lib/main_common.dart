import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/flavor_config.dart';
import 'package:paypilot/ui/layout/paypilot_theme.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stacked_services/stacked_services.dart';
import 'ui/layout/material_color_creator.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  //await Firebase.initializeApp();

  // nothing to do right now :)
}

Future<void> mainCommon() async {
  await SentryFlutter.init(
    (options) => {
      options.dsn = FlavorConfig.sentryDSN,
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0
    },
    appRunner: () async => {
      WidgetsFlutterBinding.ensureInitialized(),
      await Firebase.initializeApp(),
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler),
      setupLocator(),
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]).then((value) => runApp(const MyApp())),
      runApp(const MyApp())
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'paypilot',
      theme: ThemeData(
          primarySwatch: createMaterialColor(PayPilotTheme.primaryColour),
          fontFamily: 'Montserrat',
          inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.grey)),
          appBarTheme: PayPilotTheme.appBarTheme,
          scaffoldBackgroundColor: PayPilotTheme.secondaryColour),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
