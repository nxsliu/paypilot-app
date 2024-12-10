import 'package:flutter/material.dart';
import 'package:paypilot/ui/layout/position_bottom.dart';
import 'package:paypilot/ui/views/authentication/sign_in/sign_in_viewmodel.dart';
import 'package:paypilot/ui/widgets/error_text.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/primary_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
        viewModelBuilder: () => SignInViewModel(),
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
                        Text('Welcome back!',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: Colors.black)),
                        const SizedBox(height: 20),
                        Text('Sign in to start invoicing faster',
                            style: Theme.of(context).textTheme.titleMedium),
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
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            onChanged: model.updatePassword),
                        if (model.hasErrorForKey(model.signInErrorKey))
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 40),
                                ErrorText(
                                    errorText:
                                        model.error(model.signInErrorKey)),
                              ],
                            ),
                          )
                      ])),
              PositionBottom(
                  child: PrimaryButton(
                      onPressed: model.signIn,
                      text: 'Sign In',
                      isLoading: model.isBusy,
                      disabled: !model.isValid))
            ]))));
  }
}
