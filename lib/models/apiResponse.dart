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

class Generic{
  static T fromJson<T, K>(dynamic json) {
    if (json is Iterable) {
      return _fromJsonList<K>(json) as T;
    } else if (T == User) {
      return User.fromJson(json) as T;
    }  else if (T == bool || T == String || T == int || T == double) {
      // primitives
      return json;
    } else {
      throw Exception("Unknown class");
    }
  }

  ///
  /// for Lists, for each subtype [K], create its corresponding [fromJson] value
  ///
  static List<K> _fromJsonList<K>(Iterable jsonList) {
    return jsonList.map<K>((dynamic json) => fromJson<K, void>(json)).toList();
  }
}

class GenericApiResponse<T, K>{
  bool? success;
  T? data;
  String? message;
  String? error;

  GenericApiResponse({
    required this.success,
    this.data,
    this.message,
    this.error,
  });

  factory GenericApiResponse.fromJson(Map<String, dynamic> json) =>
      _$WrapperFromJson(json);

  Map<String, dynamic> toJson() => _$WrapperToJson(this);

}

GenericApiResponse<T, K> _$WrapperFromJson<T, K>(Map<String, dynamic> json) {
  return GenericApiResponse<T, K>(
    success: json['success'] as bool,
    data: json['data'] == null ? null : Generic.fromJson<T, K>(json['data']),
    message: json['message'],
    error: json['error'],
  );
}

Map<String, dynamic> _$WrapperToJson(GenericApiResponse wrapper) => {
  "success": wrapper.success,
  "data": wrapper.data,
  "message": wrapper.message,
  "error": wrapper.error,
};




