import 'package:metadent/models/appointment/appointmentsList.dart';

import 'appointment/appointment.dart';

class AppointmentsApiResponse {
  String status;
  AppointmentsList payload;

  AppointmentsApiResponse({required this.status, required this.payload});

  factory AppointmentsApiResponse.fromJson(Map<String, dynamic> parsedJson) {
    var appointmentsListFromJson = parsedJson['payload'];

    return AppointmentsApiResponse(

        status: parsedJson['status'], payload: AppointmentsList.fromJson(parsedJson['payload']));
  }
}
