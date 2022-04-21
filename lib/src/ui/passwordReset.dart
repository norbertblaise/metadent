import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final emailController = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reset Password',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
        Padding(
          padding: const EdgeInsets.only(left:8.0).r,
          child: Text(
              'Enter your email',
              style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
                  SizedBox(
                    height: 8.h,
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
                'Email',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16.sp,
                ),
              ),
              hintText: 'someone@example.com',
              hintStyle:  TextStyle(
                fontSize: 18.sp,
              ),
              filled: true,
              focusedBorder: buildInputBorder(),
              errorBorder: buildInputBorder(),
              border: buildInputBorder(),
              enabledBorder: buildInputBorder(),
            ),
        ),
        const SizedBox(
            height: 8,
        ),
      ]),
          )),
    );
  }

  OutlineInputBorder buildInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(9.0),
    );
  }
}
