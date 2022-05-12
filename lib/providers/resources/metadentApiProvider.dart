import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:metadent/models/models.dart';

class MetaDentApiProvider {
  var baseUrl = "https://projectdental.nl/staging-backend/api/patients/";
  Client client = Client();


  Future<ApiResponse> authenticateUser({required String email, required String password}) async {

    if (kDebugMode) {
      print("email is $email");
      print("pass is $password");
    }
   
    // try {
      final response = await client.post(Uri.parse('${baseUrl}auth/login'), body: {
        'identifier': email,
        'password': password,
      });

      if(response.statusCode == 200){
        if (kDebugMode) {
          print(response.body.toString());
        }

        ApiResponse apiResponse = ApiResponse.fromJson(json.decode(response.body));
        if (kDebugMode) {
          print(apiResponse.payload.user.firstName);
        }
        return ApiResponse.fromJson(json.decode(response.body));
      }else{
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
}
