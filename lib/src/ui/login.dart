import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metadent/src/ui/CustomWidgets/signinSignupHeader.dart';
import 'package:metadent/src/ui/homePage.dart';
import 'package:metadent/src/ui/register.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:metadent/routes.dart' as routes;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  bool isEmail(String input) => EmailValidator.validate(input);

  String validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return 'null';
    }
  }

  @override
  Widget build(BuildContext context) {
    var localizedStrings = AppLocalizations.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SigninSignupHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: Text(
                      AppLocalizations.of(context)!.signIn,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                   SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => validateEmail(value),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).accentColor,
                    ),
                    decoration: InputDecoration(
                      label: Text(
                          AppLocalizations.of(context)!.email,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 16.0.sp,
                        ),
                      ),
                      hintText: localizedStrings!.emailHint,
                      hintStyle:  TextStyle(
                        fontSize: 16.sp,
                      ),
                      filled: true,
                      focusedBorder: buildInputBorder(),
                      errorBorder: buildInputBorder(),
                      border: buildInputBorder(),
                      enabledBorder: buildInputBorder(),
                    ),
                  ),
                   SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: isPasswordVisible,
                    // onChanged: (value) => setState(() {
                    //   password = value;
                    // }),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Theme.of(context).accentColor,
                    ),
                    decoration: InputDecoration(
                      label: Text(
                        AppLocalizations.of(context)!.password,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 16.sp,
                        ),
                      ),
                      hintText: localizedStrings.passwordHint,
                      hintStyle:  TextStyle(
                        fontSize: 18.0.sp,
                      ),
                      suffixIcon: IconButton(
                        icon: isPasswordVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible != isPasswordVisible;
                          });
                        },
                      ),
                      suffixIconColor: Theme.of(context).primaryColor,
                      filled: true,
                      focusedBorder: buildInputBorder(),
                      errorBorder: buildInputBorder(),
                      border: buildInputBorder(),
                      enabledBorder: buildInputBorder(),
                    ),
                  ),
                   SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                    child: InkWell(
                      child: Text(
                        AppLocalizations.of(context)!.forgotPassword,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        //todo go to password recovery
                        Navigator.pushNamed(context, routes.passwordResetPage);
                      },
                    ),
                  ),
                   SizedBox(
                    height: 8.h,
                  ),
                  ElevatedButton(
                    child:  Text(
                      AppLocalizations.of(context)!.signIn,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize:  Size.fromHeight(38.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r))),
                    onPressed: () {
                      //todo request authentication and verify phone
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder:
                      //   (context) =>HomePage(),
                      //
                      // ),
                      // ).then((_){
                      //   setState(() {
                      //
                      //   });
                      // });
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder:
                            (context) =>HomePage(),
                      ),
                          (route) => false,
                      ).then((_){
                        setState(() {

                        });
                      });
                    },
                  ),
                   SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0).r,
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.noAccount,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            child: Text(
                              AppLocalizations.of(context)!.signUp,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Source Sans Pro',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              //todo go to register page
                              Navigator.pushNamed(context, routes.registerPage);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder buildInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(9.r),
    );
  }
}
