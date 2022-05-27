import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metadent/src/ui/CustomWidgets/PrimaryLongButton.dart';

import '../../../app.dart';
import '../../../models/InvoiceModel/invoiceModel.dart';

class InvoiceDetailPage extends StatelessWidget {
  final Invoice? invoice;
  const InvoiceDetailPage({Key? key, this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var invoiceTitle = invoice?.services;
    String shortenedTitle =
    invoiceTitle.replaceRange(13, invoiceTitle.length, "...");
    String? shortenedDate = invoice?.createdAt.toString().substring(0, 10);
    String services = invoice?.services.replaceAll(" ", "");
    var serviceList = services.split(',');
    var priceList = invoice?.prices.toString().split(',');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // flexibleSpace: const GradientAppBar(),
        title: const Text(
          // localizedString!.invoices,
          "Invoice",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shortenedTitle,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "\$${invoice?.totalWithVat}",
              style: TextStyle(
                  fontSize: 30.sp,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 30.h,
            ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "Status",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),

                        Text(
                          "Services",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for(var i in serviceList)
                              Text(
                                i,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$shortenedDate",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "${invoice?.paymentStatus}",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),

                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "Prices",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),

                        SizedBox(
                          height: 14.h,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            for(var i in priceList!)
                              Text(
                                i,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Card(
              elevation: 8.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0).r,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 19.0, vertical: 19.0)
                        .r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Subtotal",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "Vat",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "Grand total",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${invoice?.balanceDue}",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "${invoice?.vat}",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "${invoice?.totalWithVat}",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            PrimaryLongButton(buttonAction: () {
              //TODO implement payment flow
            }, buttonText: "MAKE PAYMENT")
          ],
        ),
      ),
    );
  }
}
