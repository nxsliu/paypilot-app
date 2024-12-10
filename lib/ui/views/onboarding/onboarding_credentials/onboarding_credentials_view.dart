import 'package:flutter/material.dart';
import 'package:paypilot/ui/layout/position_bottom.dart';
import 'package:paypilot/ui/views/onboarding/onboarding_credentials/onboarding_credentials_viewmodel.dart';
import 'package:paypilot/ui/widgets/error_text.dart';
import 'package:paypilot/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';

class OnboardingCredentialsView extends StatelessWidget {
  const OnboardingCredentialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingCredentialsViewModel>.reactive(
        viewModelBuilder: () => OnboardingCredentialsViewModel(),
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
                        Text('Setup your email and password',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: Colors.black)),
                        const SizedBox(height: 40),
                        TextField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              errorText:
                                  model.hasErrorForKey(model.emailErrorKey)
                                      ? model.error(model.emailErrorKey)
                                      : null),
                          onChanged: model.updateEmail,
                        ),
                        const SizedBox(height: 40),
                        TextField(
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                errorText:
                                    model.hasErrorForKey(model.passwordErrorKey)
                                        ? model.error(model.passwordErrorKey)
                                        : null),
                            onChanged: model.updatePassword),
                        if (model.hasErrorForKey(model.accountCreationErrorKey))
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 40),
                                ErrorText(
                                    errorText: model
                                        .error(model.accountCreationErrorKey)),
                              ],
                            ),
                          )
                      ])),
              PositionBottom(
                  child: PrimaryButton(
                      onPressed: model.submitView,
                      text: 'Continue',
                      isLoading: model.isBusy,
                      disabled: !model.isValid))
            ]))));
  }
}
