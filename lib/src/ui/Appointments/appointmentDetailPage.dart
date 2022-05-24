import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app.dart';

class AppointmentDetail extends StatelessWidget {
  const AppointmentDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizedString!.yourAppointment,
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
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Routine Check",
              style: Theme.of(context).textTheme.headlineLarge,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(localizedString!.date,
                            style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          localizedString!.time,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          localizedString!.treatment,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        // SizedBox(
                        //   height: 14.h,
                        // ),
                        // Text(
                        //   localizedString!.expiryDate,
                        //   style: Theme.of(context).textTheme.bodyText2,
                        // ),
                        // SizedBox(
                        //   height: 14.h,
                        // ),
                        // Text(
                        //   localizedString!.ccv,
                        //   style: Theme.of(context).textTheme.bodyText2,
                        // ),
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
                        // SizedBox(
                        //   height: 14.h,
                        // ),
                        // Text(
                        //   "04/24",
                        //   style: Theme.of(context).textTheme.bodyText2,
                        // ),
                        // SizedBox(
                        //   height: 14.h,
                        // ),
                        // Text(
                        //   "***",
                        //   style: Theme.of(context).textTheme.bodyText2,
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  localizedString!.checkTheFrontDesk,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
