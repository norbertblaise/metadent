part of 'appointments_bloc.dart';

@immutable
abstract class AppointmentsEvent {}

class FetchAppointments extends AppointmentsEvent{}