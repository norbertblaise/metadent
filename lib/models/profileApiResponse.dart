class ProfileApiResponse{
  String status;
  String payload;

  ProfileApiResponse({required this.status, required this.payload});

  factory ProfileApiResponse.fromJson(Map<String, dynamic> parsedJson){
    return ProfileApiResponse(status: parsedJson['status'], payload: parsedJson['payload']);
  }
}