import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:metadent/blocs/formSubmissionStatus.dart';
import 'package:metadent/models/apiResponse.dart';
import 'package:metadent/providers/resources/authRepository.dart';

import '../../models/profileApiResponse.dart';
import '../../models/user.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository authRepository;
  User loadedUser = User();
  FlutterSecureStorage storage = FlutterSecureStorage();

  ProfileBloc({required this.authRepository}) : super(ProfileInitial()) {
    on<ProfileLoad>(_onProfileLoad);
    on<ProfileFirstNameChanged>(_onFirstNameChanged);
    on<ProfileLastNameChanged>(_onLastNameChanged);
    on<ProfileHomeAddressChanged>(_onHomeAddressChanged);
    on<ProfilePhoneChanged>(_onPhoneChanged);
    on<ProfileInsurerChanged>(_onInsurerChanged);
    on<ProfilePolicyNumberChanged>(_onPolicyNumberChanged);
    on<ProfileSaveButtonPressed>(_onSaveButtonPressed);
    on<ProfileUpdated>(_onProfileUpdated);
    on<ProfileEvent>((event, emit) {
      // TODO: implement event
    });
  }

  FutureOr<void> _onProfileLoad(
      ProfileLoad event, Emitter<ProfileState> emit) async {
    var userJson = await storage.read(key: 'userData');
    var user = User.fromJson(jsonDecode(userJson!));
    loadedUser = user;

    emit(ProfileLoaded(user));
  }

  FutureOr<void> _onFirstNameChanged(
      ProfileFirstNameChanged event, Emitter<ProfileState> emit) {
    emit(ProfileState(firstName: event.firstName));
  }

  FutureOr<void> _onLastNameChanged(
      ProfileLastNameChanged event, Emitter<ProfileState> emit) {
    emit(ProfileState(lastName: event.lastName));
  }

  FutureOr<void> _onHomeAddressChanged(
      ProfileHomeAddressChanged event, Emitter<ProfileState> emit) {
    emit(ProfileState(homeAddress: event.homeAddress));
  }

  FutureOr<void> _onPhoneChanged(
      ProfilePhoneChanged event, Emitter<ProfileState> emit) {
    emit(ProfileState(phone: event.phoneNumber));
  }

  FutureOr<void> _onInsurerChanged(
      ProfileInsurerChanged event, Emitter<ProfileState> emit) {
    emit(ProfileState(insurer: event.insurer));
  }

  FutureOr<void> _onPolicyNumberChanged(
      ProfilePolicyNumberChanged event, Emitter<ProfileState> emit) {
    emit(ProfileState(policyNumber: event.policyNumber));
  }

  void _onSaveButtonPressed(
      ProfileSaveButtonPressed event, Emitter<ProfileState> emit) async {
    emit(ProfileState(formStatus: FormSubmitting()));
    // make network call
    if (kDebugMode) {
      print("onSaveButtonPressed called");
      print('profilebloc event first name is ${event.firstName}');
    }
    try {
      var token = await storage.read(key: 'token');
      ProfileApiResponse apiResponse = await authRepository.updateUserInfo(
          token: token!,
          firstName: event.firstName,
          lastName: event.lastName,
          phone: event.phone,
          homeAddress: event.homeAddress,
          insurer: event.insurer,
          policyNumber: event.policyNumber);

      if (apiResponse.payload.contains("Info Updated")) {
        //save the fields to storage
        var updatedUser = loadedUser;
        updatedUser.firstName = event.firstName;
        updatedUser.lastName = event.lastName;
        updatedUser.homeAddress = event.homeAddress;
        updatedUser.patientPhone = event.phone;
        updatedUser.patientInsurer = event.insurer;
        updatedUser.insurancePolicyNumber = event.policyNumber;

        if (kDebugMode) {
          print("profile bloc event address is ${event.homeAddress}");
          print("profile bloc address is ${updatedUser.homeAddress}");
        }
        var userJson = json.encode(updatedUser.toJson());
        if (kDebugMode) {
          print("userjson is $userJson");
        }
        await storage.delete(key: 'userData');
        await storage.write(key: 'userData', value: userJson);
        emit(ProfileState(formStatus: SubmissionSuccess()));
        emit(ProfileSaved(updatedUser));

      }
      if (kDebugMode) {
        print(apiResponse.payload);
      }

    } catch (e) {
      emit(ProfileState(formStatus: SubmissionFailed(Exception(e))));
      if (kDebugMode) {
        print("error is $e");
      }
    }
  }

  FutureOr<void> _onProfileSaved(
      ProfileSaved event, Emitter<ProfileState> emit) {}

  FutureOr<void> _onProfileUpdated(ProfileUpdated event, Emitter<ProfileState> emit) {
    // emit(ProfileSaved(updated));
  }
}
