import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:paypilot/ui/layout/paypilot_theme.dart';
import 'package:paypilot/ui/views/customer/customer_edit_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class CustomerEditView extends StatelessWidget {
  const CustomerEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerEditViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 4, // default value
            backgroundColor: PayPilotTheme.primaryColour,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text('Customer'),
            actions: [
              TextButton(
                  onPressed: model.saveCustomer,
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: _customerDetailForm(),
          ))),
      viewModelBuilder: () => CustomerEditViewModel(),
    );
  }
}

// Form that makes use of the ViewModel provided above but also makes use of hooks
class _customerDetailForm extends HookViewModelWidget<CustomerEditViewModel> {
  @override
  Widget buildViewModelWidget(
      BuildContext context, CustomerEditViewModel model) {
    var customerNameController =
        useTextEditingController(text: model.customerBeingEdited.name);
    var customerEmailController =
        useTextEditingController(text: model.customerBeingEdited.email);
    var customerBusinessNameController =
        useTextEditingController(text: model.customerBeingEdited.businessName);

    return Column(
      children: [
        const SizedBox(height: 40.0),
        TextField(
          textInputAction: TextInputAction.next,
          controller: customerBusinessNameController,
          decoration:
              const InputDecoration(labelText: 'Business name (optional)'),
          onChanged: model.updateBusinessName,
        ),
        const SizedBox(height: 50),
        TextField(
          textInputAction: TextInputAction.next,
          controller: customerNameController,
          decoration: const InputDecoration(labelText: 'Customer contact'),
          onChanged: model.updateName,
        ),
        const SizedBox(height: 50),
        TextField(
          textInputAction: TextInputAction.next,
          controller: customerEmailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Customer email',
              errorText: model.hasErrorForKey(model.customerEmailErrorKey)
                  ? model.error(model.customerEmailErrorKey)
                  : null),
          onChanged: model.updateEmail,
        )
      ],
    );
  }
}
