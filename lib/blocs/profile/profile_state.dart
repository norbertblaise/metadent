part of 'profile_bloc.dart';

@immutable
class ProfileState {
  final String firstName;
  final String lastName;
  final String homeAddress;
  final String phone;
  final String insurer;
  final String policyNumber;
  final FormSubmissionStatus formStatus;

  bool isFirstNameValid(String value) => value.length > 0;

  bool isLastNameValid(String value) => value.length > 0;

  bool isHomeAddressValid(String value) => value.length > 0;

  bool isPhoneValid(String value) => value.length > 0;

  bool isInsurerValid(String value) => value.length > 0;

  bool isPolicyNumberValid(String value) => value.length > 0;

  const ProfileState({
    this.firstName = '',
    this.lastName = '',
    this.homeAddress = '',
    this.insurer = '',
    this.phone = '',
    this.policyNumber = '',
    this.formStatus = const InitialFormStatus(),
  });

  ProfileState copyWith(
      {String? firstName,
      String? lastName,
      String? homeAddress,
      String? phone,
      String? insurer,
      String? policyNumber,
      FormSubmissionStatus? formStatus}) {
    return ProfileState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        homeAddress: homeAddress ?? this.homeAddress,
        insurer: insurer ?? this.insurer,
        phone: phone ?? this.phone,
        policyNumber: policyNumber ?? this.policyNumber,
        formStatus: formStatus ?? this.formStatus);
  }
}

class ProfileUnInitialized extends ProfileState {}

class ProfileSaved extends ProfileState {
  final User loadedUser;

  ProfileSaved(this.loadedUser);
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User loadedUser;

  ProfileLoaded(this.loadedUser);
}
