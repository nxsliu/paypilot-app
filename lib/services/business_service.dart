import 'dart:io';

import 'package:dio/dio.dart';
import 'package:paypilot/models/business.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/authorised_paypilot_platform_api_client.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/request/create_business.dart'
    as request;
import 'package:paypilot/network_clients/paypilot_platform_api/models/request/request_uniquedevicetoken.dart';
import 'package:paypilot/network_clients/paypilot_platform_api/models/response/business_owner.dart';
import 'package:stacked/stacked.dart';

class BusinessService with ReactiveServiceMixin {
  Business? _business;

  Business get business => _business!;

  Future<void> createBusiness(String identityServiceUserId, businessName,
      ownerFirstName, ownerLastName, ownerEmail) async {
    final paypilotAPIClient = await AuthorisedPaypilotAPIClient().getClient();

    try {
      final createBusiness = request.CreateBusiness(
          identityServiceUserId,
          businessName,
          request.BusinessOwner(ownerFirstName, ownerLastName, ownerEmail));

      final newBusiness =
          await paypilotAPIClient.createBusiness(createBusiness);

      _business = Business(
          newBusiness.id,
          newBusiness.name,
          newBusiness.logoURL,
          BusinessOwner(newBusiness.owner.firstName, newBusiness.owner.lastName,
              newBusiness.owner.email));
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

  Future<void> getBusiness() async {
    final paypilotAPIClient = await AuthorisedPaypilotAPIClient().getClient();

    try {
      final currentbusiness = await paypilotAPIClient.getBusiness();

      _business = Business(
          currentbusiness.id,
          currentbusiness.name,
          currentbusiness.logoURL,
          BusinessOwner(currentbusiness.owner.firstName,
              currentbusiness.owner.lastName, currentbusiness.owner.email));
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

  Future<void> updateBusinessUniqueDeviceToken(
      String businessId, String token) async {
    final paypilotAPIClient = await AuthorisedPaypilotAPIClient().getClient();

    try {
      await paypilotAPIClient.updateBusinessUniqueDeviceToken(
          businessId, RequestUniqueDeviceToken(token));
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

  Future<void> updateBusinessLogo(File businessLogo) async {
    final paypilotAPIClient = await AuthorisedPaypilotAPIClient().getClient();

    try {
      final currentbusiness =
          await paypilotAPIClient.updateBusinessLogo(business.id, businessLogo);

      _business = Business(
          currentbusiness.id,
          currentbusiness.name,
          currentbusiness.logoURL,
          BusinessOwner(currentbusiness.owner.firstName,
              currentbusiness.owner.lastName, currentbusiness.owner.email));
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

  Future<void> createBusinessStripeAccount() async {
    final paypilotAPIClient = await AuthorisedPaypilotAPIClient().getClient();

    try {
      await paypilotAPIClient.createBusinessStripeAccount(business.id);
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

  Future<void> deleteBusiness() async {
    final paypilotAPIClient = await AuthorisedPaypilotAPIClient().getClient();

    try {
      await paypilotAPIClient.deleteBusiness(business.id);
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

  void clearBusiness() {
    _business = null;
  }
}
