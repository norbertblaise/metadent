import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:metadent/routes.dart' as routes;

class EnterOtp extends StatefulWidget {
  const EnterOtp({Key? key}) : super(key: key);

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {

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
        padding: const EdgeInsets.symmetric(horizontal:24.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
              height: 200.h,
            ),
            Row(
              children: [
                Text(
                  '${localizedString.codeSent} 0700 122 321.',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(
                  width: 4.w,
                ),
                InkWell(
                  child: Text(
                    localizedString.wrongNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                    ),
                  ),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              localizedString.enterCode,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
              buildPinput(),
            const SizedBox(
              height: 16 ,
            ),
            ElevatedButton(
              child:  Text(
                localizedString.verify,
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
                //todo request verify code
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  localizedString.messageNotReceived,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                InkWell(
                  child: Text(
                    localizedString.resend,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                    ),
                  ),
                  onTap: (){
                    //todo resend code implement waiting period
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPinput() {
    ///todo implement validation
    final pinController = TextEditingController();

    final defaultPinTheme = PinTheme(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(6.0),
          color: Theme.of(context).dividerColor,
        ),
        margin: EdgeInsets.only(right: 20.0),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(6.0),
    );


    return Form(
      child: Pinput(
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        controller: pinController,
      ),
    );
  }

  OutlineInputBorder buildInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(6.0),
    );
  }

}
