import 'package:flutter/foundation.dart';
import 'package:metadent/models/apiResponse.dart';
import 'package:metadent/models/appointmentsApiResponse.dart';
import 'package:metadent/models/models.dart';
import 'package:metadent/providers/resources/metadentApiProvider.dart';

import '../../models/profileApiResponse.dart';

class AuthRepository {
  final metadentApiProvider = MetaDentApiProvider();

  Future<ApiResponse> authenticateUser(
      {required String email, required String password}) async {
    var apiResponse = await metadentApiProvider.authenticateUser(
        email: email, password: password);

    return apiResponse;
  }

  Future<ProfileApiResponse> updateUserInfo({
    required String token,
    required String firstName,
    required String lastName,
    required String phone,
    required String homeAddress,
    required String insurer,
    required String policyNumber,
  }) async {
    if (kDebugMode) {
      print(token);
      print('repo firstName is $firstName');
    }

    var apiResponse = await metadentApiProvider.updateUserInfo(
        token: token,
        firstName: firstName,
        lastName: lastName,
        homeAddress: homeAddress,
        phone: phone,
        insurer: insurer,
        policyNumber: policyNumber);

    return apiResponse;
  }

  Future<AppointmentsApiResponse> getUserAppointments(
      {required String token}) async {
    if (kDebugMode) {
      print("getUserAppointments called");
    }
    return await metadentApiProvider.getUserAppointments(token: token);
  }
}
