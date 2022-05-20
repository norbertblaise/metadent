import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:metadent/src/ui/CustomWidgets/serviceCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:metadent/routes.dart' as routes;

import '../../models/user.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
   User loadUser = User();

  getUser() async {
    var userJson = await FlutterSecureStorage().read(key: "userData");
    var user = User.fromJson(jsonDecode(userJson!));
    loadUser = user;
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var localizedString = AppLocalizations.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      //todo change to profile pic otherwise use placeholder
                      backgroundImage:
                          AssetImage('assets/images/default-profile-pic.png'),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                    Text(
                      //todo add username from server
                      // "${localizedString!.greeting}, \nClarissa ",
                      
                      "${localizedString!.greeting}, \n${loadUser.firstName} ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Material(
                  color: Theme.of(context).backgroundColor,
                  child: IconButton(
                      onPressed:
                          //todo go to qr scanner
                          () {},
                      icon: Icon(
                        Icons.qr_code,
                        color: Theme.of(context).accentColor,
                      )),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Material(
                  color: Theme.of(context).backgroundColor,
                  child: InkWell(
                    child: Card(
                      elevation: 12.0,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor,
                              Color(0xFFFFA776)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().radius(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                                  vertical: 18.0, horizontal: 35)
                              .r,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  localizedString.upcomingAppointment,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(10),
                                ),
                                Text(
                                  "14 April 2022",
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(20)),
            Text(localizedString.services,
                style: Theme.of(context).textTheme.labelMedium),
            SizedBox(
              height: ScreenUtil().setHeight(8),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      ServiceCard(
                          imagePath: 'assets/images/manage-appointments.png',
                          cardLabel: localizedString.manageAppointments,
                          destination: () {
                            Navigator.pushNamed(context, routes.appointments);
                          }),
                      SizedBox(width: ScreenUtil().setWidth(8)),
                      ServiceCard(
                          imagePath: 'assets/images/statements-invoices.png',
                          cardLabel: localizedString.statementsAndInvoices,
                          destination: () {
                            //todo go to approriate page.
                          }),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      ServiceCard(
                          imagePath: 'assets/images/view-records.png',
                          cardLabel: localizedString.viewRecords,
                          destination: () {
                            //todo go to appointments page.
                          }),
                      SizedBox(width: ScreenUtil().setWidth(8)),
                      ServiceCard(
                          imagePath: 'assets/images/treatment-plans.png',
                          cardLabel: localizedString.treatmentPlans,
                          destination: () {
                            //todo go to appointments page.
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
