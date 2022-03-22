import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:metadent/src/ui/CustomWidgets/signinSignupHeader.dart';
import 'package:metadent/src/ui/Methods/methods.dart';
import 'package:metadent/src/ui/login.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SigninSignupHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Create Account',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).accentColor,
                      ),
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value?.length == 0) {
                          return 'Please provide a name';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: Text(
                          'Name',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18.0,
                          ),
                        ),
                        hintText: 'John Doe',
                        hintStyle: const TextStyle(
                          fontSize: 18.0,
                        ),
                        filled: true,
                        focusedBorder: buildInputBorder(),
                        errorBorder: buildInputBorder(),
                        border: buildInputBorder(),
                        enabledBorder: buildInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
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
                          'Email',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18.0,
                          ),
                        ),
                        hintText: 'someone@example.com',
                        hintStyle: const TextStyle(
                          fontSize: 18.0,
                        ),
                        filled: true,
                        focusedBorder: buildInputBorder(),
                        errorBorder: buildInputBorder(),
                        border: buildInputBorder(),
                        enabledBorder: buildInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: isPasswordVisible,
                      // onChanged: (value) => setState(() {
                      //   password = value;
                      // }),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).accentColor,
                      ),
                      decoration: InputDecoration(
                        label: Text(
                          'Password',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18.0,
                          ),
                        ),
                        hintText: 'Your password...',
                        hintStyle: const TextStyle(
                          fontSize: 18.0,
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
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(42),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        final isValid = formKey.currentState?.validate();
                        //todo request authentication
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 16.0,
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
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
  OutlineInputBorder buildInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(9.0),
    );
  }
}
