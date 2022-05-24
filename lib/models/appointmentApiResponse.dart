import 'package:metadent/models/appointment/appointmentsList.dart';

import 'appointment/appointment.dart';

class AppointmentApiResponse {
  String status;
  AppointmentsList payload;

  AppointmentApiResponse({required this.status, required this.payload});

  factory AppointmentApiResponse.fromJson(Map<String, dynamic> parsedJson) {
    var appointmentsListFromJson = parsedJson['payload'];

    return AppointmentApiResponse(

        status: parsedJson['status'], payload: AppointmentsList.fromJson(parsedJson['payload']));
  }
}
