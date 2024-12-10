import 'package:flutter/material.dart';
import 'package:paypilot/ui/layout/position_bottom.dart';
import 'package:paypilot/ui/views/settings/change_password/change_password_viewmodel.dart';
import 'package:paypilot/ui/widgets/error_text.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/primary_button.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangePasswordViewModel>.reactive(
        viewModelBuilder: () => ChangePasswordViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(automaticallyImplyLeading: true),
            body: SafeArea(
                child: Stack(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Change password',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: Colors.black)),
                        const SizedBox(height: 20),
                        Text('Enter your current and new password',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 40),
                        TextField(
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Current password',
                          ),
                          onChanged: model.updateCurrentPassword,
                        ),
                        const SizedBox(height: 40),
                        TextField(
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'New password',
                                errorText:
                                    model.hasErrorForKey(model.passwordErrorKey)
                                        ? model.error(model.passwordErrorKey)
                                        : null),
                            onChanged: model.updateNewPassword),
                        if (model.hasErrorForKey(model.changePasswordErrorKey))
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 40),
                                ErrorText(
                                    errorText: model
                                        .error(model.changePasswordErrorKey)),
                              ],
                            ),
                          )
                      ])),
              PositionBottom(
                  child: PrimaryButton(
                      onPressed: model.changePassword,
                      text: 'Update',
                      isLoading: model.isBusy,
                      disabled: !model.isValid))
            ]))));
  }
}
