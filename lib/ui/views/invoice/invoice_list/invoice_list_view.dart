import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paypilot/enums/invoice_status.dart';
import 'package:paypilot/ui/layout/paypilot_theme.dart';
import 'package:paypilot/ui/views/invoice/invoice_list/invoice_list_viewmodel.dart';
import 'package:paypilot/ui/views/settings/settings_view.dart';
import 'package:stacked/stacked.dart';

class InvoiceListView extends StatelessWidget {
  const InvoiceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InvoiceListViewModel>.reactive(
      viewModelBuilder: () => InvoiceListViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            elevation: 4, // default value
            backgroundColor: PayPilotTheme.primaryColour,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text('Invoices'),
            actions: [
              IconButton(
                  onPressed: model.navigateToHelp,
                  icon: const Icon(Icons.help_outline))
            ]),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 40.0),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: model.refreshInvoices,
                    child: model.invoices.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 40),
                              const Icon(Icons.emoji_food_beverage_outlined,
                                  size: 50),
                              const SizedBox(height: 20),
                              Text(
                                  'No invoices yet. Click + to create a new one.',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          )
                        : ListView.separated(
                            itemCount: model.invoices.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(color: Colors.grey),
                            itemBuilder: (BuildContext context, int index) {
                              final invoice = model.invoices[index];
                              return InkWell(
                                onTap: () => {
                                  invoice.status == InvoiceStatus.Draft
                                      ? model.editInvoice(invoice.id!)
                                      : model.displayInvoice(invoice.id!)
                                },
                                child: ListTile(
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        invoice.customer!.name.toString(),
                                        style:
                                            PayPilotTheme.textTheme.titleMedium,
                                      ),
                                    ),
                                    subtitle: (Text(DateFormat('dd-MMM-yyyy')
                                        .format(invoice.createdLocal!))),
                                    trailing: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                            NumberFormat.simpleCurrency(
                                                    name: 'AUD')
                                                .format(invoice.totalAmount),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                        const SizedBox(height: 8),
                                        Text(
                                          invoice.status.name,
                                          style: TextStyle(color: () {
                                            if (invoice.status ==
                                                InvoiceStatus.Draft) {
                                              return Colors.grey;
                                            } else if (invoice.status ==
                                                InvoiceStatus.Unpaid) {
                                              return Colors.red;
                                            } else if (invoice.status ==
                                                InvoiceStatus.Paid) {
                                              return Colors.green;
                                            } else {
                                              return Colors.grey;
                                            }
                                          }()),
                                        ),
                                      ],
                                    )),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: model.newInvoice, child: const Icon(Icons.add)),
        drawer: const Drawer(child: SettingsView()),
      ),
    );
  }
}
