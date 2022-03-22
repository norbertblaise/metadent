import 'package:flutter/material.dart';
import 'package:metadent/src/ui/CustomWidgets/serviceCard.dart';
import 'package:metadent/routes.dart' as routes;

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      //todo add username from server
                      "Hi there, \nClarissa ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Material(
                  color: Theme.of(context).backgroundColor,
                child:  IconButton(
                      onPressed:
                      //todo go to qr scanner
                          (){},
                      icon: Icon(
                        Icons.qr_code,
                        color: Theme.of(context).accentColor,
                      )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
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
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 35),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Upcoming Appointment",
                                  style:
                                  Theme.of(context).textTheme.displaySmall,
                                ),
                                const SizedBox(
                                  height: 10.0,
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
            const SizedBox(height: 30),
            Text("Services", style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      ServiceCard(
                          imagePath: 'assets/images/manage-appointments.png',
                          cardLabel: "Manage\n Appointments",
                          destination: () {
                            Navigator.pushNamed(context, routes.appointments);
                          }),
                      const SizedBox(width: 8.0),
                      ServiceCard(
                          imagePath: 'assets/images/statements-invoices.png',
                          cardLabel: "Statements &\nInvoices",
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
                          cardLabel: "View Records",
                          destination: () {
                            //todo go to appointments page.
                          }),
                      const SizedBox(width: 8.0),
                      ServiceCard(
                          imagePath: 'assets/images/treatment-plans.png',
                          cardLabel: "Treatment Plans",
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
