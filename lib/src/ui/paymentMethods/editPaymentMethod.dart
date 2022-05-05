import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metadent/routes.dart' as routes;
import '../../../app.dart';
import '../CustomWidgets/InsuranceDetailTextField.dart';
import '../CustomWidgets/PrimaryLongButton.dart';
import '../CustomWidgets/SecondaryLongButton.dart';

class EditPaymentMethod extends StatefulWidget {
  const EditPaymentMethod({Key? key}) : super(key: key);

  @override
  State<EditPaymentMethod> createState() => _EditPaymentMethodState();
}

class _EditPaymentMethodState extends State<EditPaymentMethod> {
  final nameController = TextEditingController(
      /*todo get name from API*/
      text: "Clarissa Hamilton");
  final cardNumberController =
      TextEditingController(text: "2234 4324 9845 0834");
  final expiryDateController = TextEditingController(text: "04/24");
  final ccvController = TextEditingController(text: "768");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizedString!.editPaymentMethod,
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
                      textEditingController: nameController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                  child: DetailTextField(
                      hintText: "2234 4324 9845 0834",
                      errorText: localizedString!.policyNumberError,
                      labelText: localizedString!.cardNumber,
                      textEditingController: cardNumberController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:157.w,
                        child: DetailTextField(
                            textEditingController: expiryDateController,
                            hintText: "04/24",
                            labelText: localizedString!.expiryDate,
                            errorText: localizedString!.expiryError),
                      ),

                      SizedBox(
                        width:157.w,
                        child: DetailTextField(
                            textEditingController: ccvController,
                            hintText: localizedString!.ccv,
                            labelText: localizedString!.ccv,
                            errorText: localizedString!.noNameError),
                      )
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            PrimaryLongButton(
                buttonAction: () {
                  //todo save new card

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
