import 'package:flutter/material.dart';
import 'package:paypilot/ui/views/invoice/invoice_sent/invoice_sent_viewmodel.dart';
import 'package:paypilot/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';

class InvoiceSentView extends StatelessWidget {
  const InvoiceSentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InvoiceSentViewModel>.reactive(
      viewModelBuilder: () => InvoiceSentViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    model.isFirstInvoice
                        ? 'And you\'re done!'
                        : 'Congratulations!',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.black)),
                const SizedBox(height: 40),
                Text(
                    model.isFirstInvoice
                        ? 'Get paid faster with paypilot'
                        : 'Invoice successfully sent!',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.black)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/sent.png',
                        height: 240.0,
                        width: 240.0,
                      ),
                    ],
                  ),
                ),
                PrimaryButton(
                    onPressed: model.navigateToInvoiceList, text: 'Continue'),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
