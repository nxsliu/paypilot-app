import 'package:flutter/material.dart';
import 'package:paypilot/enums/invoice_status.dart';
import 'package:paypilot/ui/layout/paypilot_theme.dart';
import 'package:paypilot/ui/views/invoice/invoice_display/invoice_display_viewmodel.dart';
import 'package:paypilot/ui/widgets/invoice_display.dart';
import 'package:stacked/stacked.dart';

class InvoiceDisplayView extends StatelessWidget {
  final String invoiceId;

  const InvoiceDisplayView({super.key, required this.invoiceId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InvoiceDisplayViewModel>.reactive(
      viewModelBuilder: () => InvoiceDisplayViewModel(invoiceId),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 4, // default value
          backgroundColor: PayPilotTheme.primaryColour,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text('${model.invoice!.status.name} invoice'),
          automaticallyImplyLeading: true,
          actions: [
            PopupMenuButton(
                icon: const Icon(Icons.more_vert_outlined),
                itemBuilder: (BuildContext context) => [
                      if (model.invoice?.status == InvoiceStatus.Paid)
                        PopupMenuItem(
                            child: TextButton(
                          onPressed: () => model.updateInvoiceStatus(
                              model.invoice!.id!, InvoiceStatus.Unpaid),
                          child: const Text('Mark as unpaid',
                              style: TextStyle(color: Colors.black)),
                        ))
                      else
                        PopupMenuItem(
                            child: TextButton(
                          onPressed: () => model.updateInvoiceStatus(
                              model.invoice!.id!, InvoiceStatus.Paid),
                          child: const Text('Mark as paid',
                              style: TextStyle(color: Colors.black)),
                        )),
                      PopupMenuItem(
                          child: TextButton(
                        onPressed: model.duplicateInvoice,
                        child: const Text('Duplicate invoice',
                            style: TextStyle(color: Colors.black)),
                      ))
                    ])
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 40),
                InvoiceDisplay(
                  invoice: model.invoice!,
                  business: model.business,
                ),
                const SizedBox(height: 50.0)
              ],
            )),
          ),
        ),
      ),
    );
  }
}
