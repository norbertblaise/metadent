// class ApiResponse{
//   late Object _data;
//   late Object _apiError;
//
//   Object get Data => _data;
//   set Data(Object data) =>_data = data;
//
//   Object get ApiError => _apiError;
//   set ApiError(Object error) => _apiError = error;
// }
import 'package:metadent/models/models.dart';

class ApiResponse{
  String status;
  Payload payload;

  ApiResponse({required this.status, required this.payload});
  
  factory ApiResponse.fromJson(Map<String, dynamic> parsedJson){
    return ApiResponse(status: parsedJson['status'], payload: Payload.fromJson(parsedJson['payload']));
  }
}

class Payload {
  String token;
  String tokenType;
  User user;
  Payload({required this.token, required this.tokenType, required this.user});

  factory Payload.fromJson(Map<String, dynamic> parsedJson){
    return Payload(token: parsedJson['token'],
        tokenType: parsedJson['token_type'],
        user: User.fromJson(parsedJson["user"]));
  }
}

