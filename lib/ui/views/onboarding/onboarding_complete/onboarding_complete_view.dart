import 'package:flutter/material.dart';
import 'package:paypilot/ui/views/onboarding/onboarding_complete/onboarding_complete_viewmodel.dart';
import 'package:paypilot/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';

class OnboardingCompleteView extends StatelessWidget {
  const OnboardingCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingCompleteViewModel>.reactive(
        viewModelBuilder: () => OnboardingCompleteViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(automaticallyImplyLeading: false, actions: [
              IconButton(
                  onPressed: model.navigateToHelp,
                  icon: const Icon(Icons.help_outline))
            ]),
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Simple as that!',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: Colors.black)),
                          const SizedBox(height: 40),
                          Text('You\'re ready to create your first invoice',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: Colors.black)),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/rocket.png',
                                  height: 240.0,
                                  width: 240.0,
                                ),
                              ],
                            ),
                          ),
                          PrimaryButton(
                              onPressed: model.submitView, text: 'Continue'),
                          const SizedBox(height: 32),
                        ])))));
  }
}
