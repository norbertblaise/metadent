import 'dart:core';

class User {
  var token;
  var id;
  var facilityId;
  var firstName;
  var lastName;
  var middleName;
  var gender;
  var maritalStatus;
  var birthDate;
  var email;
  var reviews;
  var homePhone;
  var nationality;
  var country;
  var state;
  var city;
  var street;
  var homeAddress;
  var patientPhone;
  var photo;
  var postalCode;
  var occupation;
  var patientInsurer;
  var insurancePolicyNumber;
  var guardianName;
  var guardianPhone;
  var guardianEmail;
  var guardianAddress;
  var fmRelationship;
  var fmName;
  var fmPhoneNumber;
  var fmEmail;
  var fillIfNotFilled;
  var referredBy;
  var refereeEmail;
  var refereePhone;
  var nokName;
  var nokEmail;
  var citizenServiceNumber;
  var createdAt;
  var updatedAt;
  var mainDoctorId;
  var secondaryDoctorId;

  User({this.token, this.id, this.firstName, this.lastName, this.email});

  User.all({
    required this.id,
    required this.facilityId,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.gender,
    required this.maritalStatus,
    required this.birthDate,
    required this.email,
    required this.reviews,
    required this.homePhone,
    required this.nationality,
    required this.country,
    required this.state,
    required this.city,
    required this.street,
    required this.homeAddress,
    required this.patientPhone,
    required this.photo,
    required this.postalCode,
    required this.occupation,
    required this.patientInsurer,
    required this.insurancePolicyNumber,
    required this.guardianName,
    required this.guardianPhone,
    required this.guardianEmail,
    required this.guardianAddress,
    required this.fmRelationship,
    required this.fmName,
    required this.fmPhoneNumber,
    required this.fmEmail,
    required this.fillIfNotFilled,
    required this.referredBy,
    required this.refereeEmail,
    required this.refereePhone,
    required this.nokName,
    required this.nokEmail,
    required this.citizenServiceNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.mainDoctorId,
    required this.secondaryDoctorId
  });


  


  //create user object from json input
 factory User.fromJson(Map<String, dynamic> parsedJson) {
   // _token = json['token'];
   // _id = json['id'];
   // _firstName = json["first_name"];
   // _lastName = json["last_name"];
   // _email = json["email"];
   return User(token: parsedJson['token'],
     id: parsedJson['id'],
     firstName: parsedJson['first_name'],
     lastName: parsedJson['last_name'],
     email:  parsedJson['email']
   );
 }
  //Export to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = this.token;
    data['userId'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}
