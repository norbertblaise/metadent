import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metadent/routes.dart' as routes;
import 'CustomWidgets/CustomSliverAppbarDelegate.dart';
import 'CustomWidgets/InsuranceDetailItem.dart';
import 'CustomWidgets/ProfileFieldItem.dart';
import 'CustomWidgets/ProfilePicture.dart';
import 'CustomWidgets/gradientAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizedString = AppLocalizations.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: const GradientAppBar(),
          // title: const Text(
          //   "Profile",
          //   style: TextStyle(color: Colors.white),
          // ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body:
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child:
            ListView(
          children: [
            ProfilePicture(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16)
                  .r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      bottom: 8.0,
                    ).r,
                    child: Text(localizedString!.profile,
                        style: Theme.of(context).textTheme.labelMedium),
                  ),
                  ProfileFieldCard(
                      icon: Icons.person,
                      label: localizedString.name,
                      value: 'Clarissa Hamilton',
                      editValue: () {
                        //todo open edit page/popup
                      }),
                  ProfileFieldCard(
                      icon: Icons.email,
                      label: localizedString.email,
                      value: 'clarrisa-hamilton@gmail.com',
                      editValue: () {
                        //todo open edit page/popup
                      }),
                  ProfileFieldCard(
                      icon: Icons.phone,
                      label: localizedString.phone,
                      value: '0700 122 321',
                      editValue: () {
                        //todo open edit page/popup
                      }),
                  ProfileFieldCard(
                      icon: Icons.home,
                      label: localizedString.address,
                      value: '1 Wampewo Ave, Kampala',
                      editValue: () {
                        //todo open edit page/popup
                      }),
                  SizedBox(height: 16.r),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      bottom: 8.0,
                    ).r,
                    child: Text(localizedString.insurance,
                        style: Theme.of(context).textTheme.labelMedium),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(localizedString.policyDetails,
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
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InsuranceDetailRow(
                                label: localizedString.holderName,
                                value: "Clarissa Hamilton",
                                icon: Icons.person),
                            Divider(),
                            InsuranceDetailRow(
                                label: localizedString.policyNumber,
                                value: "RID029354856",
                                icon: Icons.numbers),
                            Divider(),
                            InsuranceDetailRow(
                                label: localizedString.provider,
                                value: "Old Town Insurance",
                                icon: Icons.business),
                            Divider(),
                            InsuranceDetailRow(
                                label: localizedString.coveragePlan,
                                value: "Premium Coverage",
                                icon: Icons.inventory),
                            Divider(),
                            InsuranceDetailRow(
                                label: localizedString.expiry,
                                value: "12 Jun 2024",
                                icon: Icons.calendar_today_rounded),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),

        //     CustomScrollView(
        //   slivers: [
        //     SliverPersistentHeader(
        //       delegate: CustomSliverAppBarDelegate(
        //         expandedHeight: 180.h,
        //       ),
        //       pinned: true,
        //     ),
        //     SliverList(
        //       delegate: SliverChildListDelegate([
        //         Padding(
        //           padding:
        //                EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(
        //                   left: 16.0,
        //                   bottom: 8.0,
        //                 ).r,
        //                 child: Text('Profile',
        //                     style: Theme.of(context).textTheme.labelMedium),
        //               ),
        //               ProfileFieldCard(
        //                   icon: Icons.person,
        //                   label: 'Name',
        //                   value: 'Clarissa Hamilton',
        //                   editValue: () {
        //                     //todo open edit page/popup
        //                   }),
        //               ProfileFieldCard(
        //                   icon: Icons.email,
        //                   label: 'Email',
        //                   value: 'clarrisa-hamilton@gmail.com',
        //                   editValue: () {
        //                     //todo open edit page/popup
        //                   }),
        //               ProfileFieldCard(
        //                   icon: Icons.phone,
        //                   label: 'Phone',
        //                   value: '0700 122 321',
        //                   editValue: () {
        //                     //todo open edit page/popup
        //                   }),
        //               ProfileFieldCard(
        //                   icon: Icons.home,
        //                   label: 'Address',
        //                   value: '1 Wampewo Ave, Kampala',
        //                   editValue: () {
        //                     //todo open edit page/popup
        //                   }),
        //                SizedBox(height: 16.r),
        //               Padding(
        //                 padding: const EdgeInsets.only(
        //                   left: 16.0,
        //                   bottom: 8.0,
        //                 ).r,
        //                 child: Text('Insurance',
        //                     style: Theme.of(context).textTheme.labelMedium),
        //               ),
        //               Padding(
        //                 padding:  const EdgeInsets.only(left: 16.0).r,
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Text("Policy Details",
        //                         style: Theme.of(context).textTheme.labelSmall),
        //                     IconButton(
        //                       onPressed: () {
        //                         //todo open edit page
        //                       },
        //                       icon: const Icon(Icons.edit),
        //                       color: Theme.of(context).primaryColor,
        //                     )
        //                   ],
        //                 ),
        //               ),
        //               Card(
        //                 elevation: 6,
        //                 shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(10.r),
        //                 ),
        //                 child: Padding(
        //                   padding: const EdgeInsets.symmetric(vertical: 16.0).r,
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       InsuranceDetailRow(
        //                           label: "holder's name",
        //                           value: "Clarissa Hamilton",
        //                           icon: Icons.person),
        //                       Divider(),
        //                       InsuranceDetailRow(
        //                           label: "Policy Number",
        //                           value: "RID029354856",
        //                           icon: Icons.numbers),
        //                       Divider(),
        //                       InsuranceDetailRow(
        //                           label: "Provider",
        //                           value: "Old Town Insurance",
        //                           icon: Icons.business),
        //                       Divider(),
        //                       InsuranceDetailRow(
        //                           label: "Coverage Plan",
        //                           value: "Premium Coverage",
        //                           icon: Icons.inventory),
        //                       Divider(),
        //                       InsuranceDetailRow(
        //                           label: "Expiry",
        //                           value: "12 Jun 2024",
        //                           icon: Icons.calendar_today_rounded),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ]),
        //     )
        //   ],
        // ),
      ),
    );
  }
}

