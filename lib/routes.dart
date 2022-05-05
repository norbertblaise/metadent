import 'package:flutter/material.dart';

import 'package:metadent/src/ui/login.dart';
import 'package:metadent/src/ui/register.dart';
import 'package:metadent/src/ui/dashboard.dart';
import 'package:metadent/src/ui/communications.dart';
import 'package:metadent/src/ui/homePage.dart';
import 'package:metadent/src/ui/notifications.dart';
import 'package:metadent/src/ui/passwordReset.dart';
import 'package:metadent/src/ui/phoneVerification.dart';
import 'package:metadent/src/ui/enterOTP.dart';
import 'package:metadent/src/ui/Appointments/appointments.dart';
import 'package:metadent/src/ui/Appointments/newAppointment.dart';
import 'package:metadent/src/ui/Profile/Profile.dart';
import 'package:metadent/src/ui/Profile/EditInsuranceInfo.dart';
import 'package:metadent/src/ui/Profile/EditPersonalInfo.dart';
import 'package:metadent/src/ui/paymentMethods/paymentMethods.dart';
import 'package:metadent/src/ui/paymentMethods/paymentMethodDetails.dart';
import 'package:metadent/src/ui/paymentMethods/addPaymentMethod.dart';
import 'package:metadent/src/ui/paymentMethods/editPaymentMethod.dart';

//route names
const String loginPage = 'login';
const String registerPage = 'register';
const String homePage = 'home';
const String passwordResetPage = 'passwordReset';
const String phoneVerification = 'phoneVerification';
const String enterOTP = 'enterOtp';
const String appointments = 'appointments';
const String newAppointment = 'newAppointment';
const String dashboard = 'dashboard';
const String profile = "profile";
const String editInsuranceInfo = 'editInsuranceInfo';
const String editPersonalInfo = "editPersonalInfo";
const String paymentMethods = "paymentMethods";
const String paymentMethodDetails = "paymentMethodDetails";
const String addPaymentMethod = "addPaymentMethod";
const String editPaymentMethod = "editPaymentMethod";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => Login());
    case registerPage:
      return MaterialPageRoute(builder: (context) => Register());
    case homePage:
      return MaterialPageRoute(builder: (context) => HomePage());
    case passwordResetPage:
      return MaterialPageRoute(builder: (context) => PasswordReset());
    case phoneVerification:
      return MaterialPageRoute(builder: (context) => PhoneVerification());
    case enterOTP:
      return MaterialPageRoute(builder: (context) => EnterOtp());
    case appointments:
      return MaterialPageRoute(builder: (context) => Appointments());
    case dashboard:
      return MaterialPageRoute(builder: (context) => Dashboard());
    case newAppointment:
      return MaterialPageRoute(builder: (context) => NewAppointment());
    case profile:
      return MaterialPageRoute(builder: (context) => Profile());
    case editInsuranceInfo:
      return MaterialPageRoute(builder: (context) => EditInsuranceInfo());
    case editPersonalInfo:
      return MaterialPageRoute(builder: (context) => EditPersonalInfo());
    case paymentMethods:
      return MaterialPageRoute(builder: (context) => PaymentMethods());
    case paymentMethodDetails:
      return MaterialPageRoute(builder: (context) => PaymentMethodDetails());
    case addPaymentMethod:
      return MaterialPageRoute(builder: (context) => AddPaymentMethod());
    case editPaymentMethod:
      return MaterialPageRoute(builder: (context) => EditPaymentMethod());
    default:
      throw ('This route name does not exist');
  }
}
