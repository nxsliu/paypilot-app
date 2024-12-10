import 'package:flutter/material.dart';
import 'package:paypilot/ui/layout/position_bottom.dart';
import 'package:paypilot/ui/views/onboarding/onboarding_name/onboarding_name_viewmodel.dart';
import 'package:paypilot/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';

class OnboardingNameView extends StatelessWidget {
  const OnboardingNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingNameViewModel>.reactive(
        viewModelBuilder: () => OnboardingNameViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(automaticallyImplyLeading: true, actions: [
              IconButton(
                  onPressed: model.navigateToHelp,
                  icon: const Icon(Icons.help_outline))
            ]),
            body: SafeArea(
                child: Stack(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('What\'s your name?',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: Colors.black)),
                        const SizedBox(height: 40),
                        TextField(
                          textInputAction: TextInputAction.next,
                          decoration:
                              const InputDecoration(labelText: 'First name'),
                          onChanged: model.updateFirstName,
                        ),
                        const SizedBox(height: 40),
                        TextField(
                            textInputAction: TextInputAction.next,
                            decoration:
                                const InputDecoration(labelText: 'Last name'),
                            onChanged: model.updateLastName)
                      ])),
              PositionBottom(
                  child: PrimaryButton(
                      onPressed: model.submiteView,
                      text: 'Continue',
                      disabled: !model.isValid))
            ]))));
  }
}
