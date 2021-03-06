import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metadent/routes.dart' as routes;
import '../../../app.dart';
import '../CustomWidgets/InsuranceDetailTextField.dart';
import '../CustomWidgets/PrimaryLongButton.dart';
import '../CustomWidgets/SecondaryLongButton.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({Key? key}) : super(key: key);

  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  final nameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final ccvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizedString!.addPaymentMethod,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: /*todo save changes*/ () {
              Navigator.pushNamed(context, routes.editPaymentMethod);
            },
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).r,
                  child: Text(
                    localizedString!.enterCardDetails,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                  child: DetailTextField(
                    hintText: localizedString!.nameHint,
                    errorText: localizedString!.noNameError,
                    labelText: localizedString!.holderName,
                    textEditingController: nameController,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                  child: DetailTextField(
                    hintText: "2234 4324 9845 0834",
                    errorText: localizedString!.policyNumberError,
                    labelText: localizedString!.cardNumber,
                    textEditingController: cardNumberController,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 157.w,
                        child: DetailTextField(
                          textEditingController: expiryDateController,
                          hintText: "04/24",
                          labelText: localizedString!.expiryDate,
                          errorText: localizedString!.expiryError,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        width: 157.w,
                        child: DetailTextField(
                          textEditingController: ccvController,
                          hintText: localizedString!.ccv,
                          labelText: localizedString!.ccv,
                          errorText: localizedString!.noNameError,
                          onChanged: (value) {},
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            PrimaryLongButton(
                buttonAction: () {
                  //todo set as default
                },
                buttonText: localizedString!.save.toUpperCase()),
            SizedBox(
              height: 6.h,
            ),
            SecondaryLongButton(
                buttonAction: () {
                  //todo delete card
                },
                buttonText: localizedString!.cancel.toUpperCase())
          ],
        ),
      ),
    );
  }
}
