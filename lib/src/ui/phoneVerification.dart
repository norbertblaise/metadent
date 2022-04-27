import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:metadent/routes.dart' as routes;

import '../../app.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final phoneController = TextEditingController();
  var localizedString = AppLocalizations.of(NavigationService.navigatorKey.currentContext!);
  String validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return localizedString!.invalidEmailError;
    } else {
      return 'null';
    }
  }

  @override
  Widget build(BuildContext context) {
    var localizedString = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          localizedString!.verifyPhone,
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                localizedString.enterPhoneLabel,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) => validateEmail(value),
              style: TextStyle(
                fontSize: 16.0,
                color: Theme.of(context).accentColor,
              ),
              decoration: InputDecoration(
                label: Text(
                  localizedString.phone,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 18.0,
                  ),
                ),
                hintText: localizedString.phoneHint,
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
            ElevatedButton(
              child:  Text(
                localizedString.getCode,
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
                //todo send otp
                Navigator.pushNamed(context, routes.enterOTP);
              },
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
