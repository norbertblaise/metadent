import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metadent/src/ui/CustomWidgets/signinSignupHeader.dart';
import 'package:metadent/src/ui/Methods/methods.dart';
import 'package:metadent/src/ui/homePage.dart';
import 'package:metadent/src/ui/login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:metadent/routes.dart' as routes;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
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
    var localizedString = AppLocalizations.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SigninSignupHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Text(
                        'Create Account',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Theme.of(context).accentColor,
                      ),
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value?.length == 0) {
                          return localizedString!.noNameError;
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: Text(
                          localizedString!.name,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18.sp,
                          ),
                        ),
                        hintText: localizedString.nameHint,
                        hintStyle: TextStyle(
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => validateEmail(value),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Theme.of(context).accentColor,
                      ),
                      decoration: InputDecoration(
                        label: Text(
                          localizedString.email,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 16.sp,
                          ),
                        ),
                        hintText: localizedString.emailHint,
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
                          localizedString.password,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 16.sp,
                          ),
                        ),
                        hintText: localizedString.passwordHint,
                        hintStyle:  TextStyle(
                          fontSize: 16.sp,
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
                      height: 10.h,
                    ),
                    ElevatedButton(
                      child:  Text(
                        localizedString.signUp,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize:  Size.fromHeight(42.r),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        final isValid = formKey.currentState?.validate();
                        //todo request authentication
                        // Navigator.of(context)
                        //     .push(
                        //   MaterialPageRoute(
                        //     builder: (context) => HomePage(),
                        //   ),
                        // )
                        //     .then((_) {
                        //   setState(() {});
                        // });
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
                            localizedString.alreadyHasAccount,
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0).r,
                            child: InkWell(
                              child: Text(
                                localizedString.signIn,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                //todo go to login page
                                Navigator.pushNamed(context, routes.loginPage);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
      borderRadius: BorderRadius.circular(9.0.r),
    );
  }
}
