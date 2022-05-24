import 'package:metadent/models/appointment/appointment.dart';

import '../../src/ui/Appointments/appointmentsListPage.dart';

class AppointmentsList {
  final List<Appointment> appointments;

  AppointmentsList({required this.appointments});

  factory AppointmentsList.fromJson(List<dynamic> parsedJson) {
    List<Appointment> appointments = <Appointment>[];

    appointments = parsedJson.map((i) => Appointment.fromJson(i)).toList();
    return AppointmentsList(appointments: appointments);
  }
}
