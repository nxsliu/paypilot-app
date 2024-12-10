import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:paypilot/models/invoice_item.dart';
import 'package:paypilot/ui/layout/paypilot_theme.dart';
import 'package:paypilot/ui/views/invoice_item/invoice_item_edit_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class InvoiceItemEditView extends StatelessWidget {
  final InvoiceItem invoiceItem;

  const InvoiceItemEditView({super.key, required this.invoiceItem});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InvoiceItemEditViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 4, // default value
            backgroundColor: PayPilotTheme.primaryColour,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text('Item'),
            actions: [
              TextButton(
                  onPressed: model.saveInvoiceItem,
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: _invoiceItemDetailForm(),
          ))),
      viewModelBuilder: () => InvoiceItemEditViewModel(invoiceItem),
    );
  }
}

// Form that makes use of the ViewModel provided above but also makes use of hooks
class _invoiceItemDetailForm
    extends HookViewModelWidget<InvoiceItemEditViewModel> {
  @override
  Widget buildViewModelWidget(
      BuildContext context, InvoiceItemEditViewModel model) {
    var itemNameController =
        useTextEditingController(text: model.invoiceItemBeingEdited.name);
    var itemUnitCostController = useTextEditingController(
        text:
            NumberFormat("0.00").format(model.invoiceItemBeingEdited.unitCost));
    var itemQuantityController = useTextEditingController(
        text:
            NumberFormat("0.##").format(model.invoiceItemBeingEdited.quantity));

    return Column(
      children: [
        const SizedBox(height: 40.0),
        TextField(
          textInputAction: TextInputAction.next,
          controller: itemNameController,
          decoration: const InputDecoration(labelText: 'Item name'),
          onChanged: model.updateItemName,
        ),
        const SizedBox(height: 50),
        TextField(
          textInputAction: TextInputAction.next,
          controller: itemUnitCostController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            // Allow Decimal Number With Precision of 2 Only
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
          ],
          decoration: const InputDecoration(
            labelText: 'Unit cost (excl GST)',
          ),
          onChanged: model.updateItemUnitCost,
        ),
        const SizedBox(height: 50),
        TextField(
          textInputAction: TextInputAction.next,
          controller: itemQuantityController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            // Allow Decimal Number With Precision of 2 Only
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
          ],
          decoration: const InputDecoration(
            labelText: 'Quantity',
          ),
          onChanged: model.updateItemQuantity,
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            const Expanded(child: Text('Add GST?')),
            Switch.adaptive(
                value: model.invoiceItemBeingEdited.GST,
                onChanged: model.updateItemGST)
          ],
        ),
      ],
    );
  }
}
