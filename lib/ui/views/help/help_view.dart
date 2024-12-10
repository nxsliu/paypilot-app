import 'package:flutter/material.dart';
import 'package:paypilot/ui/views/help/help_viewmodel.dart';
import 'package:paypilot/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HelpViewModel>.reactive(
      viewModelBuilder: () => HelpViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(automaticallyImplyLeading: true),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text('How can we help you?',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.black)),
                Expanded(
                  child: Image.asset(
                    'assets/images/help.png',
                    height: 240.0,
                    width: 240.0,
                  ),
                ),
                const SizedBox(height: 20),
                Text('Send us an email:',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 48),
                PrimaryButton(
                    text: 'contact@paypilot.io',
                    onPressed: model.sendHelpEmail),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
