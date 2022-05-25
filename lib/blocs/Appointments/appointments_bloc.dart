import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:metadent/providers/resources/authRepository.dart';

import '../../models/appointment/appointment.dart';
import '../../models/appointment/appointmentsList.dart';
import '../../models/appointmentsApiResponse.dart';

part 'appointments_event.dart';

part 'appointments_state.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  final AuthRepository authRepository;
  FlutterSecureStorage storage = FlutterSecureStorage();

  AppointmentsBloc({required this.authRepository})
      : super(AppointmentsInitial()) {
    on<FetchAppointments>(_fetchAppointments);

    on<AppointmentsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  FutureOr<void> _fetchAppointments(
      FetchAppointments event, Emitter<AppointmentsState> emit) async {
    emit(AppointmentsFetching());
    try {
      var token = await storage.read(key: 'token');
      AppointmentsApiResponse apiResponse =
          await authRepository.getUserAppointments(token: token!);
      if (apiResponse.status == "SUCCESS") {
        AppointmentsList appointments = apiResponse.payload;
        var appointmentsJson = appointments.toJson();

        //add the appointments to the local storage
        await storage.write(key: "appointments", value: appointmentsJson);
        if (kDebugMode) {
          print(appointments.appointments[0].appointmentType.title);
        }
        emit(AppointmentsFetched(appointmentsList: appointments));
      }
    } catch (e) {
      if (kDebugMode) {
        print("error is $e");
      }
      emit(AppointmentsFetchingFailed());
    }
  }
}
