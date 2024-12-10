import 'dart:math';

import 'package:dio/dio.dart';
import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/enums/invoice_status.dart';
import 'package:paypilot/models/customer.dart';
import 'package:paypilot/models/invoice.dart';
import 'package:paypilot/models/invoice_action.dart';
import 'package:paypilot/models/invoice_item.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/authorised_paypilot_platform_api_client.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/request/request_customer.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/request/request_invoice.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/request/request_invoice_item.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/request/request_invoice_status.dart';
import 'package:paypilot/services/business_service.dart';
import 'package:stacked/stacked.dart';

class InvoiceService with ReactiveServiceMixin {
  final _invoices = ReactiveValue<List<Invoice>>([].cast<Invoice>());
  List<Invoice> get invoices => _invoices.value;

  Invoice? invoiceBeingEdited;

  InvoiceService() {
    listenToReactiveValues([_invoices]);
  }

  final _businessService = locator<BusinessService>();

  int getSuggestedInvoiceNumber() {
    if (invoices.isEmpty) {
      return 1000000;
    } else {
      final maxInvoiceNumber = invoices.map((e) => e.invoiceNumber).reduce(max);

      return maxInvoiceNumber + 1;
    }
  }

  Future<void> getAllInvoices() async {
    final businessId = _businessService.business.id;

    final paypilotAPIClient = await AuthorisedPaypilotAPIClient().getClient();

    try {
      final invoices = await paypilotAPIClient.getAllInvoices(businessId);

      _invoices.value = invoices.invoices
          .map((invoice) => Invoice.fullInit(
              invoice.id,
              invoice.logoURL,
              invoice.invoiceNumber,
              invoice.invoiceDateUTC.toLocal(),
              invoice.dueDateUTC.toLocal(),
              invoice.message,
              InvoiceStatus.values.byName(invoice.status),
              invoice.createdUTC.toLocal(),
              invoice.customer == null
                  ? null
                  : Customer(invoice.customer!.name, invoice.customer!.email,
                      invoice.customer!.businessName),
              invoice.invoiceItems
                  .map((item) => InvoiceItem.fullInit(item.id, item.name,
                      item.unitCost, item.quantity, item.GST))
                  .toList(),
              invoice.invoiceActions
                  .map((action) => InvoiceAction(
                      action.action, action.actionDateUTC.toLocal()))
                  .toList()))
          .toList();
    } on DioError catch (e) {
      if (e.response != null) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        // TODO: log error
        //print(e.response.data)
        //print(e.response.headers)
        //print(e.response.requestOptions)
        rethrow;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        // TODO: log error
        //print(e.requestOptions)
        //print(e.message)
        rethrow;
      }
    }
  }

  Future<Invoice> createInvoice(Invoice invoice) async {
    final businessId = _businessService.business.id;

    final paypilotAPIClient = await AuthorisedPaypilotAPIClient().getClient();

    try {
      final createInvoice = RequestInvoice(
          invoice.invoiceNumber,
          invoice.invoiceDateLocal.toUtc(),
          invoice.dueDateLocal.toUtc(),
          invoice.message,
          invoice.status.name,
          RequestCustomer(invoice.customer!.name, invoice.customer!.email,
              invoice.customer!.businessName),
          invoice.invoiceItems
              .map((item) => RequestInvoiceItem(
                  item.name!, item.unitCost, item.quantity, item.GST))
              .toList());

      final newInvoice =
          await paypilotAPIClient.createInvoice(businessId, createInvoice);

      return Invoice.fullInit(
          newInvoice.id,
          newInvoice.logoURL,
          newInvoice.invoiceNumber,
          newInvoice.invoiceDateUTC.toLocal(),
          newInvoice.dueDateUTC.toLocal(),
          newInvoice.message,
          InvoiceStatus.values.byName(newInvoice.status),
          newInvoice.createdUTC.toLocal(),
          newInvoice.customer == null
              ? null
              : Customer(newInvoice.customer!.name, newInvoice.customer!.email,
                  newInvoice.customer!.businessName),
          newInvoice.invoiceItems
              .map((item) => InvoiceItem.fullInit(
                  item.id, item.name, item.unitCost, item.quantity, item.GST))
              .toList(),
          newInvoice.invoiceActions
              .map((action) =>
                  InvoiceAction(action.action, action.actionDateUTC.toLocal()))
              .toList());
    } on DioError catch (e) {
      if (e.response != null) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        // TODO: log error
        //print(e.response.data)
        //print(e.response.headers)
        //print(e.response.requestOptions)
        rethrow;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        // TODO: log error
        //print(e.requestOptions)
        //print(e.message)
        rethrow;
      }
    }
  }

  Future<Invoice> updateInvoice(Invoice invoice) async {
    final businessId = _businessService.business.id;

    final paypilotAPIClient = await AuthorisedPaypilotAPIClient().getClient();

    try {
      final updateInvoice = RequestInvoice(
          invoice.invoiceNumber,
          invoice.invoiceDateLocal.toUtc(),
          invoice.dueDateLocal.toUtc(),
          invoice.message,
          invoice.status.name,
          RequestCustomer(invoice.customer!.name, invoice.customer!.email,
              invoice.customer!.businessName),
          invoice.invoiceItems
              .map((item) => RequestInvoiceItem(
                  item.name!, item.unitCost, item.quantity, item.GST))
              .toList());

      final updatedInvoice = await paypilotAPIClient.updateInvoice(
          businessId, invoice.id!, updateInvoice);

      return Invoice.fullInit(
          updatedInvoice.id,
          updatedInvoice.logoURL,
          updatedInvoice.invoiceNumber,
          updatedInvoice.invoiceDateUTC.toLocal(),
          updatedInvoice.dueDateUTC.toLocal(),
          updatedInvoice.message,
          InvoiceStatus.values.byName(updatedInvoice.status),
          updatedInvoice.createdUTC.toLocal(),
          updatedInvoice.customer == null
              ? null
              : Customer(
                  updatedInvoice.customer!.name,
                  updatedInvoice.customer!.email,
                  updatedInvoice.customer!.businessName),
          updatedInvoice.invoiceItems
              .map((item) => InvoiceItem.fullInit(
                  item.id, item.name, item.unitCost, item.quantity, item.GST))
              .toList(),
          updatedInvoice.invoiceActions
              .map((action) =>
                  InvoiceAction(action.action, action.actionDateUTC.toLocal()))
              .toList());
    } on DioError catch (e) {
      if (e.response != null) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        // TODO: log error
        //print(e.response.data)
        //print(e.response.headers)
        //print(e.response.requestOptions)
        rethrow;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        // TODO: log error
        //print(e.requestOptions)
        //print(e.message)
        rethrow;
      }
    }
  }

  Future<void> deleteInvoice(String invoiceId) async {
    final businessId = _businessService.business.id;

    final paypilotAPIClient = await AuthorisedPaypilotAPIClient().getClient();

    try {
      await paypilotAPIClient.deleteInvoice(businessId, invoiceId);
    } on DioError catch (e) {
      if (e.response != null) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        // TODO: log error
        //print(e.response.data)
        //print(e.response.headers)
        //print(e.response.requestOptions)
        rethrow;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        // TODO: log error
        //print(e.requestOptions)
        //print(e.message)
        rethrow;
      }
    }
  }

  Future<void> updateInvoiceStatus(
      String invoiceId, InvoiceStatus status) async {
    final businessId = _businessService.business.id;

    final paypilotAPIClient = await AuthorisedPaypilotAPIClient().getClient();

    try {
      final udpateInvoiceStatus = RequestInvoiceStatus(
        status.name,
      );

      await paypilotAPIClient.updateInvoiceStatus(
          businessId, invoiceId, udpateInvoiceStatus);
    } on DioError catch (e) {
      if (e.response != null) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        // TODO: log error
        //print(e.response.data)
        //print(e.response.headers)
        //print(e.response.requestOptions)
        rethrow;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        // TODO: log error
        //print(e.requestOptions)
        //print(e.message)
        rethrow;
      }
    }
  }

  void clearInvoices() {
    _invoices.value = [].cast<Invoice>();
  }
}
