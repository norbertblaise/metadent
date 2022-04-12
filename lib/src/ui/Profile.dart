import 'package:flutter/material.dart';
import 'package:metadent/routes.dart' as routes;
import 'CustomWidgets/CustomSliverAppbarDelegate.dart';
import 'CustomWidgets/InsuranceDetailItem.dart';
import 'CustomWidgets/ProfileFieldItem.dart';
import 'CustomWidgets/gradientAppBar.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   // flexibleSpace: const GradientAppBar(),
      //   title: const Text(
      //     "Profile",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),

      body:
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   child:
          CustomScrollView(
        slivers: [
          //   // SliverPersistentHeader(
          //   //   delegate: CustomSliverAppBarDelegate(
          //   //     expandedHeight: 180,
          //   //     // backgroundColor: Theme.of(context).primaryColor,
          //   //     // elevation: 0,
          //   //     // flexibleSpace: const GradientAppBar(),
          //   //   ),
          //   //   pinned: true,
          //   // ),
          //
          SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(
              expandedHeight: 180,
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        bottom: 8.0,
                      ),
                      child: Text('Profile',
                          style: Theme.of(context).textTheme.labelMedium),
                    ),
                    ProfileFieldCard(
                        icon: Icons.person,
                        label: 'Name',
                        value: 'Clarissa Hamilton',
                        editValue: () {
                          //todo open edit page/popup
                        }),
                    ProfileFieldCard(
                        icon: Icons.email,
                        label: 'Email',
                        value: 'clarrisa-hamilton@gmail.com',
                        editValue: () {
                          //todo open edit page/popup
                        }),
                    ProfileFieldCard(
                        icon: Icons.phone,
                        label: 'Phone',
                        value: '0700 122 321',
                        editValue: () {
                          //todo open edit page/popup
                        }),
                    ProfileFieldCard(
                        icon: Icons.home,
                        label: 'Address',
                        value: '1 Wampewo Ave, Kampala',
                        editValue: () {
                          //todo open edit page/popup
                        }),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        bottom: 8.0,
                      ),
                      child: Text('Insurance',
                          style: Theme.of(context).textTheme.labelMedium),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Policy Details",
                              style: Theme.of(context).textTheme.labelSmall),
                          IconButton(
                            onPressed: () {
                              //todo open edit page
                            },
                            icon: const Icon(Icons.edit),
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    ),
                    Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InsuranceDetailRow(
                                label: "holder's name",
                                value: "Clarissa Hamilton",
                                icon: Icons.person),
                            Divider(),
                            InsuranceDetailRow(
                                label: "Policy Number",
                                value: "RID029354856",
                                icon: Icons.numbers),
                            Divider(),
                            InsuranceDetailRow(
                                label: "Provider",
                                value: "Old Town Insurance",
                                icon: Icons.business),
                            Divider(),
                            InsuranceDetailRow(
                                label: "Coverage Plan",
                                value: "Premium Coverage",
                                icon: Icons.inventory),
                            Divider(),
                            InsuranceDetailRow(
                                label: "Expiry",
                                value: "12 Jun 2024",
                                icon: Icons.calendar_today_rounded),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

