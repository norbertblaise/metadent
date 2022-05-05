import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metadent/routes.dart' as routes;
import 'package:metadent/src/ui/CustomWidgets/PrimaryLongButton.dart';
import 'package:metadent/src/ui/CustomWidgets/SecondaryLongButton.dart';

import '../../../app.dart';

class PaymentMethodDetails extends StatelessWidget {
  const PaymentMethodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizedString!.cardDetails,
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
            onPressed: /*todo open edit payment method button*/ () {
              Navigator.pushNamed(context, routes.editPaymentMethod);
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          children: [
            Card(
              elevation: 8.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0).r,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 19.0, vertical: 19)
                        .r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(localizedString!.holderName,
                            style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          localizedString!.issuer,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          localizedString!.cardNumber,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          localizedString!.expiryDate,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          localizedString!.ccv,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Clarrisa Hamilton",
                            style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "Visa",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "2234 4324 9845 0834",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "04/24",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "***",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            PrimaryLongButton(
                buttonAction: () {
                  //todo set as default
                },
                buttonText: localizedString!.setAsDefault),
            SizedBox(
              height: 6.h,
            ),
            SecondaryLongButton(
                buttonAction: () {
                  //todo delete card
                },
                buttonText: localizedString!.delete)
          ],
        ),
      ),
    );
  }
}
