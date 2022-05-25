part of 'appointments_bloc.dart';

@immutable
abstract class AppointmentsState {}

class AppointmentsInitial extends AppointmentsState {}
class AppointmentsEmpty extends AppointmentsState{}
class AppointmentsFetching extends AppointmentsState{}
class AppointmentsFetchingFailed extends AppointmentsState{}
class AppointmentsFetched extends AppointmentsState{
  final AppointmentsList appointmentsList;
   AppointmentsFetched({required this.appointmentsList});
}


