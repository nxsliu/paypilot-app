import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paypilot/ui/layout/material_color_creator.dart';
import 'package:paypilot/ui/layout/paypilot_theme.dart';
import 'package:paypilot/ui/views/invoice/invoice_edit/invoice_edit_viewmodel.dart';
import 'package:paypilot/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class InvoiceEditView extends StatelessWidget {
  const InvoiceEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InvoiceEditViewModel>.reactive(
      viewModelBuilder: () => InvoiceEditViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 4, // default value
          backgroundColor: PayPilotTheme.primaryColour,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('Draft invoice'),
          automaticallyImplyLeading: true,
          actions: [
            PopupMenuButton(
                icon: const Icon(Icons.more_vert_outlined),
                itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                          child: TextButton(
                        onPressed: () => model.deleteInvoice(
                            model.invoiceBeingEdited!.id ?? 'newInvoice'),
                        child: const Text('Delete draft',
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
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Business',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(model.businessBeingEdited!.name,
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: model.uploadBusinessLogo,
                          child: model.businessBeingEdited!.logoURL == null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.2),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(2.5),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 5),
                                              const Icon(
                                                  Icons.upload_file_outlined),
                                              Text('logo',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        model.businessBeingEdited!.logoURL!,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                    width: 50.0,
                                    height: 50.0,
                                  ),
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: TextEditingController(
                          text: model.invoiceBeingEdited!.invoiceNumber
                              .toString()),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                          labelText: 'Invoice number',
                          labelStyle: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 16)),
                      style: PayPilotTheme.textTheme.titleMedium,
                      onChanged: model.updateInvoiceNumber,
                    ),
                    const SizedBox(height: 30),
                    Text('Invoice date',
                        style: Theme.of(context).textTheme.caption),
                    //const SizedBox(height: 2),
                    Builder(builder: (context) {
                      return InkWell(
                        onTap: model.editInvoiceDate,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                    DateFormat('dd/MM/y').format(model
                                        .invoiceBeingEdited!.invoiceDateLocal),
                                    style:
                                        PayPilotTheme.textTheme.titleMedium)),
                            const Icon(Icons.calendar_month_outlined)
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 30),
                    Text('Due date',
                        style: Theme.of(context).textTheme.caption),
                    //const SizedBox(height: 10),
                    Builder(builder: (context) {
                      return InkWell(
                        onTap: model.editDueDate,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                    DateFormat('dd/MM/y').format(
                                        model.invoiceBeingEdited!.dueDateLocal),
                                    style:
                                        PayPilotTheme.textTheme.titleMedium)),
                            const Icon(Icons.calendar_month_outlined)
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 30),
                    Text('Bill to', style: Theme.of(context).textTheme.caption),
                    //const SizedBox(height: 10),
                    Builder(builder: (context) {
                      return InkWell(
                        onTap: model.editCustomer,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                    model.invoiceBeingEdited!.customer == null
                                        ? 'Create a customer'
                                        : model
                                            .invoiceBeingEdited!.customer!.name,
                                    style:
                                        PayPilotTheme.textTheme.titleMedium)),
                            const Icon(Icons.chevron_right)
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 30),
                    Text('Items', style: Theme.of(context).textTheme.caption),
                    const SizedBox(height: 10),
                    if (model.invoiceBeingEdited!.invoiceItems.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Column(
                              children: model.invoiceBeingEdited!.invoiceItems
                                  .map((invoiceItem) {
                                return ColoredBox(
                                  color: createMaterialColor(
                                      const Color(0xFFCBE0DD))[100]!,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(invoiceItem.name!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium)),
                                            Builder(builder: (context) {
                                              return IconButton(
                                                  onPressed: () => {
                                                        model.editInvoiceItem(
                                                            invoiceItem)
                                                      },
                                                  icon: const Icon(
                                                      Icons.create_outlined));
                                            }),
                                            IconButton(
                                                onPressed: () =>
                                                    model.removeInvoiceItem(
                                                        invoiceItem.id!),
                                                icon: const Icon(
                                                    Icons.delete_outline))
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      '${NumberFormat("0.##").format(invoiceItem.quantity)} x ${NumberFormat("0.00").format(invoiceItem.unitCost)}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium)),
                                              Text(
                                                  (NumberFormat("0.00").format(
                                                          invoiceItem
                                                              .totalNoGSTAmount))
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium),
                                            ],
                                          ),
                                        ),
                                        if (invoiceItem.GST)
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Text('GST',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium)),
                                                Text(
                                                    (NumberFormat("0.00")
                                                            .format(invoiceItem
                                                                .totalGSTAmount))
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            ColoredBox(
                              color: createMaterialColor(
                                  const Color(0xFFCBE0DD))[400]!,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text('Total',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium)),
                                    Text(
                                        NumberFormat.simpleCurrency(name: 'AUD')
                                            .format(model.invoiceBeingEdited!
                                                .totalAmount),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Builder(builder: (context) {
                        return InkWell(
                          onTap: model.newInvoiceItem,
                          child: Row(
                            children: const [
                              Expanded(child: Text('Add an item')),
                              Icon(Icons.chevron_right)
                            ],
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: TextEditingController(
                          text: model.invoiceBeingEdited!.message),
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      maxLength: 250,
                      decoration: InputDecoration(
                          labelText: 'Message',
                          labelStyle: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 16)),
                      style: PayPilotTheme.textTheme.titleMedium,
                      onChanged: model.saveMessage,
                    ),
                    const SizedBox(height: 40),
                    PrimaryButton(
                        onPressed: model.saveAndPreviewInvoice,
                        text: 'Save and Preview',
                        isLoading: model.isBusy,
                        disabled: !model.isInvoiceValid),
                    const SizedBox(height: 50.0)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
