import 'package:flutter/material.dart';
import 'package:paypilot/models/invoice.dart';
import 'package:paypilot/ui/layout/paypilot_theme.dart';
import 'package:paypilot/ui/views/invoice/invoice_preview/invoice_preview_viewmodel.dart';
import 'package:paypilot/ui/widgets/invoice_display.dart';
import 'package:paypilot/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';

class InvoicePreviewView extends StatelessWidget {
  final Invoice invoice;

  const InvoicePreviewView({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InvoicePreviewViewModel>.reactive(
      viewModelBuilder: () => InvoicePreviewViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 4, // default value
          backgroundColor: PayPilotTheme.primaryColour,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('Invoice preview'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Text('Invoice preview',
                  //    style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Text('Email:',
                          style: Theme.of(context).textTheme.labelLarge),
                      const SizedBox(width: 20),
                      Text(invoice.customer!.email,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Subject:',
                          style: Theme.of(context).textTheme.labelLarge),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text('${model.business.name} invoice',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 40),
                  InvoiceDisplay(invoice: invoice, business: model.business),
                  const SizedBox(height: 50),
                  PrimaryButton(
                      onPressed: () => model.sendInvoice(invoice.id!),
                      text: 'Send Invoice',
                      isLoading: model.isBusy),
                  const SizedBox(height: 50.0)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
