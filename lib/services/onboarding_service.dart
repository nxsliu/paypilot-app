import 'package:dio/dio.dart';
import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/services/business_service.dart';

class OnboardingService {
  String? firstName;
  String? lastName;
  String? email;
  String? businessName;
  String? password;

  final _businessService = locator<BusinessService>();

  Future<void> createBusiness(String fireBaseAuthenticationUserId) async {
    try {
      await _businessService.createBusiness(fireBaseAuthenticationUserId,
          businessName!, firstName!, lastName!, email!);
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
}
