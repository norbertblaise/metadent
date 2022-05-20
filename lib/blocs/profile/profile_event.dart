part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {
  const ProfileEvent();
}
class ProfileLoad extends ProfileEvent {}

class ProfileFirstNameChanged extends ProfileEvent {
  final String firstName;

  ProfileFirstNameChanged({required this.firstName});
}

class ProfileLastNameChanged extends ProfileEvent {
  final String lastName;

  ProfileLastNameChanged({required this.lastName});
}

class ProfileInsurerChanged extends ProfileEvent {
  final String insurer;

  ProfileInsurerChanged({required this.insurer});
}

class ProfilePhoneChanged extends ProfileEvent {
  final String phoneNumber;

  ProfilePhoneChanged({required this.phoneNumber});
}

class ProfileHomeAddressChanged extends ProfileEvent {
  final String homeAddress;

  ProfileHomeAddressChanged({required this.homeAddress});
}

class ProfilePolicyNumberChanged extends ProfileEvent {
  final String policyNumber;

  ProfilePolicyNumberChanged({required this.policyNumber});
}

class ProfileSaveButtonPressed extends ProfileEvent {
  final String firstName;
  final String lastName;
  final String phone;
  final String homeAddress;
  final String insurer;
  final String policyNumber;

  ProfileSaveButtonPressed(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.homeAddress,
      required this.insurer,
      required this.policyNumber});
}
class ProfileUpdated extends ProfileEvent{}

