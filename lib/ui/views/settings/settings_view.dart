import 'package:flutter/material.dart';
import 'package:paypilot/ui/views/settings/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(automaticallyImplyLeading: true),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(color: Colors.grey),
                TextButton(
                    onPressed: model.navigateToChangePassword,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text('Change password',
                          style: Theme.of(context).textTheme.titleMedium)
                    ])),
                const Divider(color: Colors.grey),
                TextButton(
                    onPressed: model.deleteBusiness,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text('Delete account',
                          style: Theme.of(context).textTheme.titleMedium)
                    ])),
                const Divider(color: Colors.grey),
                TextButton(
                    onPressed: model.launchTermsOfService,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text('Terms of service',
                          style: Theme.of(context).textTheme.titleMedium)
                    ])),
                const Divider(color: Colors.grey),
                TextButton(
                    onPressed: model.launchPrivacyPolicy,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text('Privacy policy',
                          style: Theme.of(context).textTheme.titleMedium)
                    ])),
                const Divider(color: Colors.grey),
                TextButton(
                    onPressed: model.signOutUser,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text('Sign out',
                          style: Theme.of(context).textTheme.titleMedium)
                    ])),
                const Divider(color: Colors.grey),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/paypilot_logo_black.png',
                      height: 42.0,
                      width: 120.85,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(model.appVersion,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
