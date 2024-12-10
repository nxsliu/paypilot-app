import 'dart:io';

import 'package:dio/dio.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/request/create_business.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/request/request_invoice.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/request/request_invoice_status.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/request/request_uniquedevicetoken.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/response/business.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/response/invoice.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/response/invoices.dart';
import 'package:retrofit/retrofit.dart';

part 'paypilot_platform_api_client.g.dart';

@RestApi()
abstract class PaypilotAPIClient {
  factory PaypilotAPIClient(Dio dio, {String baseUrl}) = _PaypilotAPIClient;

  @GET('/businesses')
  Future<Business> getBusiness();

  @POST('/businesses')
  Future<Business> createBusiness(@Body() CreateBusiness params);

  @DELETE('/businesses/{businessid}')
  Future<void> deleteBusiness(@Path() String businessid);

  @PUT('/businesses/{businessid}/uniquedevicetoken')
  Future<void> updateBusinessUniqueDeviceToken(
      @Path() String businessid, @Body() RequestUniqueDeviceToken params);

  @POST('/businesses/{businessid}/stripe')
  Future<void> createBusinessStripeAccount(@Path() String businessid);

  @PUT('/businesses/{businessid}/logo')
  Future<Business> updateBusinessLogo(
      @Path() String businessid, @Part(name: 'image') File image);

  @GET('/businesses/{businessid}/invoices')
  Future<Invoices> getAllInvoices(@Path() String businessid);

  @POST('/businesses/{businessid}/invoices')
  Future<Invoice> createInvoice(
      @Path() String businessid, @Body() RequestInvoice params);

  @PUT('/businesses/{businessid}/invoices/{invoiceid}')
  Future<Invoice> updateInvoice(@Path() String businessid,
      @Path() String invoiceid, @Body() RequestInvoice params);

  @PATCH('/businesses/{businessid}/invoices/{invoiceid}')
  Future<Invoice> updateInvoiceStatus(@Path() String businessid,
      @Path() String invoiceid, @Body() RequestInvoiceStatus params);

  @DELETE('/businesses/{businessid}/invoices/{invoiceid}')
  Future<void> deleteInvoice(
      @Path() String businessid, @Path() String invoiceid);
}
