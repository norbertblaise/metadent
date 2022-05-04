import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metadent/routes.dart' as routes;
import 'package:metadent/app.dart';
import 'package:metadent/src/ui/CustomWidgets/LongButton.dart';

import '../CustomWidgets/InsuranceDetailTextField.dart';
import '../Methods/methods.dart';

class EditInsuranceInfo extends StatefulWidget {
  const EditInsuranceInfo({Key? key}) : super(key: key);

  @override
  State<EditInsuranceInfo> createState() => _EditInsuranceInfoState();
}

class _EditInsuranceInfoState extends State<EditInsuranceInfo> {
  final nameController = TextEditingController(
      /*todo get name from API*/
      text: "Clarissa Hamilton");
  final policyNumberController = TextEditingController(text: "RID029354856");
  final providerController = TextEditingController(text: "Old Town Insurance");
  final planController = TextEditingController(text: "Premium Coverage");
  final expiryController = TextEditingController(text: "12 Jun 2024");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizedString!.insurance,
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
        child: ListView(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0).r,
              child: Text(localizedString!.editInsuranceInfo,
              style: Theme.of(context).textTheme.labelMedium,),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0).r,
              child: Text(localizedString!.policyDetails,
              style: Theme.of(context).textTheme.labelSmall,),
            ),
            SizedBox(height: 8.h,),
            Card(
              elevation: 6.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0).r,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 25, bottom: 18.0)
                    .r,
                child: Column(
                  children: [
                    InsuranceDetailTextField(
                        hintText: localizedString!.nameHint,
                        errorText: localizedString!.noNameError,
                        labelText: localizedString!.holderName,
                        textEditingController: nameController),
                    SizedBox(
                      height: 16.h,
                    ),
                    InsuranceDetailTextField(
                        hintText: localizedString!.nameHint,
                        errorText: localizedString!.policyNumberError,
                        labelText: localizedString!.policyNumber,
                        textEditingController: policyNumberController),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.only(left:20.0).r,
              child: Text(localizedString!.providerInfo,
                style: Theme.of(context).textTheme.labelSmall,),
            ),
            SizedBox(height: 8.h,),
            Card(
              elevation: 6.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0).r,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 25, bottom: 18.0)
                    .r,
                child: Column(
                  children: [
                    InsuranceDetailTextField(
                        hintText: localizedString!.providerHint,
                        errorText: localizedString!.providerError,
                        labelText: localizedString!.provider,
                        textEditingController: providerController),
                    SizedBox(
                      height: 16.h,
                    ),
                    InsuranceDetailTextField(
                        hintText: localizedString!.coveragePlan,
                        errorText: localizedString!.coveragePlanError,
                        labelText: localizedString!.coveragePlan,
                        textEditingController: planController),
                    SizedBox(
                      height: 16.h,
                    ),
                    InsuranceDetailTextField(
                        hintText: localizedString!.expiry,
                        errorText: localizedString!.policyNumberError,
                        labelText: localizedString!.expiry,
                        textEditingController: expiryController),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            LongButton(buttonAction: (){
              //todo save changes insurance details
              Navigator.pop(context);
            }, buttonText: localizedString!.save.toUpperCase())
          ],
        ),
      ),
    );
  }
}
