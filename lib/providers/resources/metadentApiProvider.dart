import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:metadent/models/models.dart';

import '../../models/appointmentsApiResponse.dart';
import '../../models/profileApiResponse.dart';

class MetaDentApiProvider {
  var baseUrl = "https://projectdental.nl/staging-backend/api/patients/";
  Client client = Client();

  Future<ApiResponse> authenticateUser(
      {required String email, required String password}) async {
    if (kDebugMode) {
      print("email is $email");
      print("pass is $password");
    }

    // try {
    final response =
        await client.post(Uri.parse('${baseUrl}auth/login'), body: {
      'identifier': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body.toString());
      }

      ApiResponse apiResponse =
          ApiResponse.fromJson(json.decode(response.body));
      if (kDebugMode) {
        print(apiResponse.payload.user.firstName);
      }
      return ApiResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Something went wrong');
    }

    // switch (response.statusCode) {
    //   case 200:
    //     response.body = User.fromJson(json.decode(response.body));
    //
    //     print("${response.statusCode}");
    //     break;
    //   case 401:
    //     user.ApiError = ApiError.fromJson(json.decode(response.body));
    //     break;
    //   default:
    //     user.ApiError = ApiError.fromJson(json.decode(response.body));
    //     break;
    // }
    // } on SocketException {
    //   user.ApiError = ApiError(error: "Server error. Please retry");
    // }
    // return user;
  }

  Future<AppointmentsApiResponse> getUserAppointments({required String token}) async {
    final response = await client.post(Uri.parse(
      '${baseUrl}appointments/all',
    ),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body.toString());
      }

      AppointmentsApiResponse apiResponse =
          AppointmentsApiResponse.fromJson(json.decode(response.body));
      if (kDebugMode) {
        print(apiResponse.payload.appointments[1]);
      }
      return AppointmentsApiResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<ProfileApiResponse> updateUserInfo(
      {required String token,
      required String firstName,
      required String lastName,
      required String homeAddress,
      required String phone,
      required String insurer,
      required String policyNumber}) async {
    if (kDebugMode) {
      print("update user called");
      print('apiProvider firstName is $firstName');
    }
    final response = await client.post(
      Uri.parse('${baseUrl}auth/update_info'),
      body: {
        'firstName': firstName,
        'lastName': lastName,
        'homeAddress': homeAddress,
        'phone': phone,
        'patient_insurer': insurer,
        'insurance_policy_number': policyNumber
      },
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    if (kDebugMode) {
      print(response.reasonPhrase);
      print(response.statusCode);
    }

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body.toString());
      }

      ProfileApiResponse apiResponse =
          ProfileApiResponse.fromJson(json.decode(response.body));
      if (kDebugMode) {
        print(apiResponse.status);
      }
      return apiResponse;
    } else {
      throw Exception('Something went wrong');
    }
  }
}
