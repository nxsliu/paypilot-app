import 'package:flutter/material.dart';
import 'package:paypilot/ui/layout/paypilot_theme.dart';
import 'package:paypilot/ui/views/authentication/splash/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (model) => WidgetsBinding.instance.addPostFrameCallback(
              (_) => model.initialise(),
            ),
        builder: (context, model, child) => Scaffold(
                body: SafeArea(
                    child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/paypilot_logo_black.png',
                    height: 106.0,
                    width: 305.0,
                  ),
                ],
              ),
            ))));
  }
}
